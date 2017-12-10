library(datasets)
data(iris)
str(iris)
head(iris)

#Continuous Data Analysis <- 1.Central Tendency & 2.Spread or Dispersion

#Central Tendency
mean(iris$Sepal.Length)
median(iris$Sepal.Length)


#Spread or Dispersion

#Range: min - max
range(iris$Sepal.Length)
diff(iris$Sepal.Length) #Not sure what this does but kind of cool
diff(range(iris$Sepal.Length))

#Quartiles: Q1 - median of lower range,   Q2 - median of full range, Q3 - median of high range

# 5 Point SUmmary: min, Q1, Q2, Q3, max
summary(iris$Sepal.Length)
summary(iris)

#Box Plots
boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Length, horizontal = TRUE)
boxplot.stats(iris$Sepal.Length)
boxplot(iris[1:4])

#Histograms
data(iris)
hist(iris$Sepal.Length)
hist(iris$Sepal.Length,
     main="Histogram of Sepal Length",
     xlab="Sepal Length")

#The variance (??2), is defined as the sum of the squared distances of each term in 
#the distribution from the mean (??), divided by the number of terms 
#in the distribution (N).

var(iris$Sepal.Length)
sd(iris$Sepal.Length)





#categorical Data <- 1. Frequency Distribution 1. Category Statistics

#Frequency Distribution
library(datasets)
data(iris)
table(iris$Species)
barplot(table(iris$Species))
prop.table(table(iris$Species))
prop.table(table(iris$Species))*100
 
#Categorical Statistics
install.packages("psych")
library(psych)
describeBy(iris, group = iris$Species)
library(lattice)
histogram(~Sepal.Length|Species,
          data=iris,
          layout=c(1,3),
          col="black")
boxplot(Sepal.Length~Species,
        data=iris)



