##--------------------------------------------------------##
## Title:  Binary regression modelling tutorial
## Date:   Winter 2022
##
## Author: Philipp Ratz
## Email:  ratz.philipp@courrier.uqam.ca
##
## Descr:  Simple data exploration and model adjustment
##         to predict accident probabilities on personal
##         vehicle insurance data
##
## Note:   The whole dataset is too large to post on 
##         GitHub, I added a sample instead (the code
##         will still run but you might get different
##         conclusions based on the sample)
##--------------------------------------------------------##

#### Setup ####

# Same as seen before..
setwd("~/Documents/Uni/PhD/UQAM/teaching/STT5100/course_10/")
rm(list=ls())

library(tidyverse)
library(knitr)
library(rpart)
library(rpart.plot)
library(ROCR)

# Font setup (needs to have the Montserrat Font installed). It is available
# for free at https://fonts.google.com/specimen/Montserrat
# Otherwise change the fontspec to whatever you prefer (or leave it empty)
# your system will then just use your default font (on windows - often Arial)

global_theme <- function(){
  
  theme_minimal() %+replace%
    theme(
      text=element_text(family='Montserrat', size=14),
      axis.text = element_text(size=14), 
      plot.title = element_text(family='Montserrat SemiBold', size=18, hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5)
    )
}

#### Split ####

load('./insurance_data_all.Rda')

data_all %>% 
  sample_n(10000) -> sample_data

save(sample_data, file='./sample_data.Rda')

# There is usually an inherent hierarchy
data_all %>%
  select(contains('id')) %>% 
  summarise_all(n_distinct)

data_all %>% 
  select(contains('id')) %>% 
  group_by(client_id) %>% 
  summarise_all(n_distinct) %>% 
  arrange(desc(policy_id))

data_all %>% 
  select(contains('id')) %>% 
  group_by(client_id) %>% 
  summarise_all(n_distinct) %>% 
  arrange(desc(location_id))

set.seed(1234)
all_ids <- unique(data_all$client_id)
sampled_ids <- sample(all_ids, size=floor(0.7*nrow(data_all)))

data_all %>% 
  filter(client_id %in% sampled_ids) -> train

data_all %>% 
  filter(!client_id %in% sampled_ids) -> test

#### First Look ####
train %>% 
  head()

train %>% 
  str()

# Inherent hierarchy also in the data..
train %>% 
  select(drv_drv2, drv_age2, drv_sex2) %>%
  head()

train %>% 
  summarise_all(funs(sum(is.na(.)))) %>% 
  gather() %>%
  View()

train$target_accident %>% table()

#### Exploratory Data Analysis ####

## What does our y look like?

train %>% 
  mutate(target_accident = as.factor(target_accident)) %>% 
  group_by(target_accident) %>% 
  summarise(totals = n()) %>% 
  mutate(fraction = totals / sum(totals)) %>% 
  ggplot() + 
  geom_bar(aes(x=target_accident, 
               y=fraction), 
           stat='identity', 
           color='black', 
           fill='firebrick4') + 
  global_theme() + 
  scale_y_continuous(labels=scales::percent) + 
  scale_x_discrete(labels = c('None', 'Has accident')) + 
  xlab('')

baseline_prediction = rep(mean(train$target_accident), 
                          nrow(test))

baseline_prediction

train %>% 
  head() %>% 
  View()

# Bonus is usually a very good indicator
# together with years
train %>% 
  select(pol_bonus, pol_duration) %>% 
  ggplot() + 
  geom_point(aes(x=pol_duration,
                 y=pol_bonus)) + 
  global_theme()

train %>% 
  arrange(target_accident) %>% 
  select(pol_bonus, pol_duration, target_accident) %>% 
  mutate(target_accident = as.factor(target_accident)) %>% 
  ggplot() + 
  geom_point(aes(x=pol_duration,
                 y=pol_bonus, 
                 color=target_accident)) + 
  geom_smooth(aes(x=pol_duration,
                  y=pol_bonus, 
                  color=target_accident)) +
  global_theme()

train %>% 
  group_by(pol_coverage) %>% 
  summarise(
    total = mean(target_accident)
  ) %>% 
  ggplot() + 
  geom_bar(aes(x=pol_coverage, 
               y=total), 
           stat='identity', 
           color='black', 
           fill='firebrick4') + 
  global_theme() + 
  scale_y_continuous(labels=scales::percent) 

train %>% 
  select(pol_coverage, target_accident) %>% 
  table() %>%
  prop.table() %>% 
  kable()

train %>% 
  select(pol_coverage, target_accident) %>% 
  table() %>%
  prop.table(margin = 1) %>% 
  kable()

train %>% 
  select(pol_coverage, target_accident) %>% 
  table() %>%
  prop.table(margin = 2) %>% 
  kable()


## Fill in missing values
train %>% 
  summarise_all(funs(sum(is.na(.)))) %>% 
  gather() %>% 
  arrange(desc(value))

train %>% 
  filter(is.na(vh_age)) %>% 
  View()

train %>% 
  mutate(vh_age = if_else(is.na(vh_age),
                          mean(train$vh_age),
                          vh_age)) -> train

test %>% 
  mutate(vh_age = if_else(is.na(vh_age),
                          mean(train$vh_age),
                          vh_age)) -> test

# Check all remaining "2-variables"
train %>% 
  select(contains('2'))

train %>% 
  mutate(check_second_driver = if_else(is.na(drv_sex2), 'N', drv_sex2)) %>% 
  select(check_second_driver, target_accident) %>% 
  table() %>% 
  prop.table(margin = 1) %>% 
  kable()

train %>% 
  mutate(check_second_driver = if_else(is.na(drv_sex2), 'N', drv_sex2)) %>% 
  ggplot() + 
  geom_jitter(aes(x=check_second_driver, 
               y=drv_age2), 
           stat='identity', 
           color='black', 
           fill='firebrick4') + 
  global_theme()

train %>% 
  mutate(has_second_driver = if_else(is.na(drv_sex2), 1, 0)) -> train

test %>% 
  mutate(has_second_driver = if_else(is.na(drv_sex2), 1, 0)) -> test

# How to work with a continuous variable?
train %>% 
  pull(pol_bonus) %>% 
  table()

train %>% 
 mutate(
   cuts_ = cut(pol_bonus, 
               breaks=c(0.45, 0.7,0.8,0.99,1.1, 8))
 ) %>% 
  group_by(cuts_) %>% 
  summarise(
    avg_ = mean(target_accident)
  ) %>% 
  ggplot() + 
  geom_bar(aes(x=cuts_, y=avg_), 
           stat='identity', fill='firebrick4', color='black') + 
  global_theme()

# What does that mean?
   
#### First Model ####
train %>% 
  select(where(is.character)) %>% 
  summarise_all(funs(n_distinct(.))) %>% 
  gather() %>% 
  arrange(desc(value))

train %>% 
  select(where(is.character)) %>% 
  summarise_all(funs(n_distinct(.))) %>% 
  gather() %>% 
  filter(value > 4) %>% 
  pull(key) -> drop_vars
  
train %>% 
  select(-c(drop_vars)) %>% 
  select(-c(drv_sex2)) %>% 
  select(-c(has_second_driver)) %>% 
  select(where(is.numeric)) %>% 
  add_column(vh_fuel = train$vh_fuel) -> data_model_1

model_1 <- glm(target_accident ~ ., 
               family = 'binomial',
               data = data_model_1)

model_1 %>% 
  summary()

# Sanity check

# Global Analysis
1-pchisq(60490-59285, 76474-76457)

# Restrictions
train %>% 
  select(-c(drop_vars)) %>% 
  select(-c(drv_sex2)) %>% 
  select(-c(has_second_driver)) %>% 
  select(-c(vh_fuel)) %>% 
  select(where(is.numeric)) -> data_model_1_restricted

model_1_restricted <- glm(target_accident ~ .,
                          family = 'binomial',
                          data = data_model_1_restricted)

model_1_restricted %>% summary()

1-pchisq(59354 - 59285, 76459 - 76457)

# All info on vehicules
train %>% 
  select(contains('vh'))

#### Adjustments ####

# Fuel regrouping
train$vh_fuel %>% table()

tree <- rpart(target_accident ~ vh_fuel,
              data = train,
              cp=1e-4)
prp(tree, type = 2, extra = 1)

train %>% 
  mutate(fuel_dummy = if_else(vh_fuel=='Gasoline', 1, 0)) -> train

test %>% 
  mutate(fuel_dummy = if_else(vh_fuel=='Gasoline', 1, 0)) -> test

# Too many factors
tree <- rpart(target_accident ~ vh_make,
              data = train,
              cp=1e-4)

prp(tree, type = 2, extra = 1)

predict(tree) %>% table()

train %>% 
  mutate(
    brand_dummy = predict(tree)
  ) %>% 
  mutate(brand_dummy = if_else(brand_dummy > 0.14, 1, 0)) -> train

# Will not work due to missing factors
predict(tree, newdata = test)

train_alt <- train %>% select(vh_make, client_id, target_accident) %>%
  bind_rows(test %>% 
              select(vh_make, client_id)) %>% 
  mutate(vh_make = as.factor(vh_make))

train_alt %>% 
  head(nrow(train)) -> train_alt

tree <- rpart(target_accident ~ vh_make,
              data = train_alt,
              cp=1e-4)

prp(tree, type = 2, extra = 1)

# Now it works like a charm
predict(tree, newdata = test) %>% 
  table()

test %>% 
  mutate(
    brand_dummy = predict(tree, newdata = test)
  ) %>% 
  mutate(brand_dummy = if_else(brand_dummy > 0.14, 1, 0)) -> test

train %>% 
  mutate(
    brand_dummy = predict(tree)
  ) %>% 
  mutate(brand_dummy = if_else(brand_dummy > 0.14, 1, 0)) -> train

train %>% View()

train %>% 
  mutate(
    drv_sex2 = if_else(is.na(drv_sex2), 'N', drv_sex2)
  ) -> train

test %>% 
  mutate(
    drv_sex2 = if_else(is.na(drv_sex2), 'N', drv_sex2)
  ) -> test

# Location

train_alt <- train %>% select(vh_make, location_id, target_accident) %>%
  bind_rows(test %>% 
              select(vh_make, location_id)) %>% 
  mutate(location_id = as.factor(location_id))

train_alt %>% 
  head(nrow(train)) %>% 
  group_by(location_id) %>% 
  mutate(total = n()) %>% 
  filter(total > 200)-> train_alt

tree <- rpart(target_accident ~ location_id,
              data = train_alt,
              cp=0.0005)

predict(tree) %>% table()

# But what does that tell us? -> larger counties have less accidents!
large_counties <- train_alt$location_id


train %>% 
  mutate(
    location_dummy = if_else(location_id %in% large_counties, 1, 0)
  ) -> train

test %>% 
  mutate(
    location_dummy = if_else(location_id %in% large_counties, 1, 0)
  ) -> test

## Model Fit

# Takes a while..
#car::residualPlots(model_1)
car::influencePlot(model_1)

train %>% 
  drop_na() %>% 
  mutate(cooks_ = stats::cooks.distance(model_1)) %>% 
  arrange(desc(cooks_)) %>% View()

#### Second Model ####

train %>% 
  select(-contains('_id')) %>% 
  select(-c(vh_make, vh_model, vh_fuel)) -> transformed_data

transformed_data %>% 
  drop_na() -> transformed_data

test %>% 
  select(-contains('_id')) %>% 
  select(-c(vh_make, vh_model, vh_fuel)) %>% 
  drop_na()-> transformed_data_test

y_ <- transformed_data$target_accident
database <- transformed_data %>% select(-c(target_accident))

y_t <- test$target_accident
database_test <- transformed_data_test %>% select(-c(target_accident))

f <- as.formula(y_ ~ .)
y_ <- as.matrix(y_)
x <- model.matrix(f,database)[,-1]

x %>% View()

x %>% as_tibble() %>% 
  mutate(interaction_age_sex_2 = drv_sex2N*drv_age2) %>%
  add_column(target_ = transformed_data$target_accident) -> final_train

f.1 <- as.formula(y_t ~ .)
y_t <- as.matrix(y_t)
x_test <- model.matrix(f.1, database_test)[,-1]

x_test %>% as_tibble() %>% 
  mutate(interaction_age_sex_2 = drv_sex2N*drv_age2) -> x_test

# model_aic <- glm(target_ ~.,
#                  data=final_train,
#              family = 'binomial') %>%
#   MASS::stepAIC(trace = TRUE)
# 
# save(model_aic, file='./model_aic.Rda')
# load('./model_aic.Rda')
# 
# model_aic %>% summary()

# OR
set.seed(42)
constant <- glm(target_ ~ 1, data=final_train, family = 'binomial')
complete_ <- glm(target_ ~., data=final_train, family = 'binomial')

stepwise_selection_aic <- step(constant,
                               scope = list(lower=constant,upper=complete_),
                               direction="both")

stepwise_selection_aic %>% summary()
# Chooses both location and brand dummies that we created :-)

#### Evaluation ####

# First - predictions
predictions_naive <- baseline_prediction
predictions_model1 <- predict(model_1, newdata = test)
predictions_model2 <- predict(stepwise_selection_aic, newdata = x_test)

obj_0 <- prediction(predictions_naive, test$target_accident)
auc <- performance(obj_0, measure = "auc")
auc_naive <- auc@y.values[[1]]

obj_1 <- prediction(predictions_model1, test$target_accident)
auc <- performance(obj_1, measure = "auc")
auc_model1 <- auc@y.values[[1]]

obj_2 <- prediction(predictions_model2, test$target_accident)
auc <- performance(obj_2, measure = "auc")
auc_model2 <- auc@y.values[[1]]

# AUC increases from
# Baseline: 0.5
# Model 1:  0.594
# Model 2:  0.603
# Not a huge improvement but..
# The best result with a ML model (below) is not a lot better.. (~ 0.62)

roc_1 <- performance(obj_1, measure = "tpr", x.measure= "fpr")
roc_2 <- performance(obj_2, measure = "tpr", x.measure= "fpr")

plot(roc_1)
plot(roc_2)

tibble(
  x_1 = head(unlist(roc_1@x.values), length(unlist(roc_2@x.values))),
  x_2 = unlist(roc_2@x.values),
  y_1 = head(unlist(roc_1@y.values), length(unlist(roc_2@x.values))),
  y_2 = unlist(roc_2@y.values),
) %>%
  ggplot() + 
  geom_line(aes(x=x_1, y=y_1), color='red') + 
  geom_line(aes(x=x_2, y=y_2), color='blue') +
  geom_abline(slope=1, intercept = 0) +
  global_theme() +
  ggtitle('Comparison ROC Curve')

# In general the model 2 line is higher, but not by much..

#### From a different period ####

# A very simple machine learning model, not suitable 
# for the course, but it might be interesting..

# f <- as.formula(y_ ~ .*.)
# y_ <- as.matrix(y_)
# x <- model.matrix(f,database)[,-1]
# 
# f.1 <- as.formula(y_t ~ .*.)
# y_t <- as.matrix(y_t)
# x_test <- model.matrix(f.1, database_test)[,-1]
# 
# cvfit <- glmnet::cv.glmnet(x, y_, family = "binomial",
#                            type.measure = "mse",
#                            parallel=TRUE)
# 
# predictions_lasso <- predict(cvfit, newx = x_test, s = "lambda.min", type = "response")
# 
# obj_lasso <- prediction(predictions_lasso, test$target_accident)
# auc <- performance(obj_lasso, measure = "auc")
# auc_model1 <- auc@y.values[[1]]


