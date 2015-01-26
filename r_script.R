
# Import libraries
require(caret)
require(ggplot2)
require(randomForest)

# Load data
# setwd(dir="/home/abdoul/git/ml/")
training <- read.csv("pml-training.csv", sep=",")
test <- read.csv("pml-testing.csv", sep=",")


# Select predictors
training <- training[,7:160]
test <- test[,7:160]

# Remove predictors that have most NA values
v <- apply(!is.na(training),2,sum)>19621
training <- training[,v]
test <- test[,v]

# Sample
inTrain <- createDataPartition(y=training$classe,p=0,6,list=FALSE)
training_train <- training[inTrain, ]
training_test <- training[-inTrain, ]

# Modeling
model <- train(classe ~., data=training_train, metho="rf", prox=TRUE)

# Validation on test sample
pred <- predict(model, training_test)
table(pred,training_test$classe)

# Print and cross validation accuracy
print(model)
print(model$finalModel)

# prediction on test data
prediction <- predict(model, test)
table(prediction$classe)

