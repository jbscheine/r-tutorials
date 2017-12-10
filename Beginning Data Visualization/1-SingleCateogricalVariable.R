#Statics Terms
#
# Observations = a row in a table
# Variables = columns in a table
# Qualitative Variables = strings etc... named values
# Quantitative Variables = numeric values, integers or decimal precision values
#
#
# Qualitative Univariate Anlaysis
#
#
#

# R BASE Plotting Language

#Import CSV
setwd("C:/pluralsight/Datasets")
movies <- read.csv("Movies.csv")
head(movies)

#Frequency Bar Chart of movie Ratings
plot(
    x = movies$Rating,
    main = "Count of Movies by Rating",
    xlab = "Rating",
    ylab = "Count of Movies")


#Create a horizontal Bar Chart
plot(
  x = movies$Rating,
  horiz = TRUE,
  main = "Count of Movies by Rating",
  ylab = "Rating",
  xlab = "Count of Movies")


#Create a Cleveland dot plot
dotchart(
  x = table(movies$Rating),
  pch = 16, #Plot point -> Index of solid point rather than hollow
  main = "Count of Movies by Rating",
  ylab = "Rating",
  xlab = "Count of Movies")

#Create a Pie Chart
pie(
  x = table(movies$Rating),
  main = "Count of Movies by Rating"
  )

#Create a Pie Chart of Movies that have won awards
pie(
  x = table(movies$Awards),
  clockwise = TRUE,
  main = "Proportion of Movies that won Awards")
 

#
#
# Lattice Plotting Package
#
#
library(lattice)

movies <- read.csv("Movies.csv")
table <- table(movies$Rating)
ratings <- as.data.frame(table)
names(ratings)[1] <- "Rating"
names(ratings)[2] <- "Count"
print(ratings)

#a frequency Barchart
barchart(
        x = Count~Rating,
        data = ratings,
        main = "Count of Movies by Ratings",
        xlab = "Rating") #dont need to specify the Y label

#Horiztonal Bar Chart
barchart(
  x = Rating~Count,
  data = ratings,
  main = "Count of Movies by Ratings",
  ylab = "Rating") #dont need to specify the X label for hozitonal Bar chart


#Create a Cleveland dot plot
dotplot(
  x = Rating~Count,
  data = ratings,
  main = "Count of Movies by Ratings",
  ylab = "Rating") #dont need to specify the X label for hozitonal Bar chart

#No pie charts in Lattice
#Instead, can use a histogram where Y axis will show percentage
histogram(
  x = ~Rating,
    data = movies,
    main = "Percent of Movies by Rating") 

#
#
# ggplot2
#
#
install.packages("ggplot2")
library(ggplot2)

#Basic Bar Chart
ggplot(
  data = movies,
  aes(x = Rating)) +
  geom_bar() + 
  ggtitle("Count of Movies by Rating")

#Hoizton Bar Chart
ggplot(
  data = movies,
  aes(x = Rating)) +
  geom_bar() + 
  coord_flip() +
  ggtitle("Count of Movies by Rating")

#Cleveland dot plot
ggplot(
  data = movies,
  aes(x = Rating)) +
  geom_point(stat = "count") + 
  coord_flip() +
  ggtitle("Count of Movies by Rating")

#Pie Chart of movie rating
ggplot(
  data = movies,
  aes(x = "", fill = Rating)) + #X = empty string meaning no varaible on X axis, Fill color set to Rating so that each rating is a different color
  geom_bar() + #want to display a single stacked bar chart 
  coord_polar(theta = "y") + #represent data in a circle rather than in each rating category
  ggtitle("Count of Movies by Rating") +
  ylab("")

#Pie Chart for movies that won an award
ggplot(
  data = movies,
  aes(x = "", fill = Awards)) + 
  geom_bar() + 
  coord_polar(theta = "y") + 
  ggtitle("Proportion of Movies won") +
  ylab("")
