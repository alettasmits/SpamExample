##install kernlab if it is not already there
if("kernlab" %in% rownames(installed.packages()) == FALSE) {
  install.packages("kernlab")
}

##source kernlab and the dataset 'spam' that comes with it
library(kernlab)
data(spam)
str(spam)

##perform a subsampling (for training and testing purposes)
set.seed(3435)
trainIndicator = rbinom(4601, size =1, prob = 0.5)
table(trainIndicator)
trainSpam=spam[trainIndicator == 1,]
testSpam=spam[trainIndicator==0,]

##inspect the trainingset trainSpam
names(trainSpam)
head(trainSpam,5)
table(trainSpam$type)
##omdat er veel nullen in de dataset zitten maken we het een beetje compacter en veranderen de nullen in een 1 zodat je een log mag toepassen
plot(log10(trainSpam$capitalAve +1) ~trainSpam$type)
plot(log10(trainSpam[,1:4]+1))
