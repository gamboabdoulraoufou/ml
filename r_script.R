
# Import libraries
library(caret)
library(ggplot2)

# Load data
# setwd(dir="/home/abdoul/git/ml/")
training <- read.csv("pml-training.csv", sep=",")
test <- read.csv("pml-testing.csv", sep=",")


# Modeling
model <- train(classe ~., data=training, metho="rf", prox=TRUE)
model

# prediction
pred <- predict(model, test)
test$predRigh
table(pred,test$classe)

