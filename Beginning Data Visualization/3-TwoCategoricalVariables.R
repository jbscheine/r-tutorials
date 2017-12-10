
#Qualatative BiVariate Analysis
#Bivariate visualizations for two qualitative variables

setwd("C:/pluralsight/Datasets")
movies <- read.csv("Movies.csv")
head(movies)

awards <- table(movies$Awards,
                movies$Rating)

print(awards)

#
#
# Base Plotting
#
#

#Grouped Frequency Bar chart
barplot(
  height = awards,
  beside = TRUE,
  main = "Count of Movies by Ratings and Awards",
  xlab = "Rating",
  ylab = "count of movies",
  legend = c("No", "Yes"),
  args.legend = list(x = "topleft",
    title = "Awards"))

#Stacked Frequency Bar Chart
barplot(
  height = awards,
  main = "Count of Movies by Ratings and Awards",
  xlab = "Rating",
  ylab = "count of movies",
  legend = c("No", "Yes"),
  args.legend = list(x = "topleft",
                     title = "Awards"))

#Create proportional freuqency table - created percentage of total for each category in table
proportions <- apply(awards,2,function(x) {x/sum(x)}) #Used to convert columns to a number between 1 & 0
#in the above 2 indicates columns, not rows (for rows use 1)

head(awards)

head(proportions)
 
#create a 100% stacked frequency bar chart
barplot(
    height = proportions,
    main = "Proportion of Movies by Rating & Award",
    xlab = "Rating",
    ylab = "proportion of movies",
    legend = c("no","yes"),
    args.legend = list(x = "topleft",
                       title = "Awards")
)

#Create a contingency table
awards <- table(movies$Rating,
            movies$Awards)
#The switching of rows & Columns as seen above is call transposing

colnames(awards) <- c("No", "yes")

print(awards)

#Create a spine plot
spineplot(x = awards,
          main = "Proportion of Movies by rating & Awards",
          xlab = "Rating",
          ylab = "Awards")

#Mosaic Plot
mosaicplot(x = awards,
          main = "Proportion of Movies by rating & Awards",
          xlab = "Rating",
          ylab = "Awards")


#
#
# Lattice
#
#

library(lattice)
awards <- table(movies$Rating,
                movies$Awards)

print(awards)

#Grouped Frequency Bar Chart
barchart(x = awards,
         stack = FALSE,
         horizontal = FALSE,
         main = "Proportion of Movies by rating & Awards",
         xlab = "Rating",
         ylab = "Count of Movies",
         auto.key = list(x = .05, #to create a legend in top right area
                         y = .95,
                         title = "Awards",
                         text = c("No","Yes")
         )
)


#stacked frequency barchart
barchart(x = awards,
         stack = TRUE,
         horizontal = FALSE,
         main = "Proportion of Movies by rating & Awards",
         xlab = "Rating",
         ylab = "Count of Movies",
         auto.key = list(x = .05, #to create a legend in top right area
                         y = .95,
                         title = "Awards",
                         text = c("No","Yes")
         )
)

matrix <- apply(awards,1,function(x) {x/sum(x)}) #Used to convert columns to a number between 1 & 0
#This time uses rows instead of columns (since table is transposed)

proportions <- t(matrix)

head(awards)

head(proportions)

#100 frequency stacked barcharts
barchart(x = proportions,
         stack = TRUE,
         horizontal = FALSE,
         main = "Proportion of Movies by rating & Awards",
         xlab = "Rating",
         ylab = "Count of Movies",
         auto.key = list(x = .65, #to create a legend in top right area
                         y = 1.10,
                         title = "Awards",
                         columns = 2,
                         text = c("No","Yes"),
                         background = 'white'
         )
)

#No spine or mosaic plots in Lattice


#
#
# GGPlot2
#
#

library(ggplot2)

#Frequency Barchart
ggplot(
  data = movies,
  aes(x = Rating, fill = Awards)) + 
  geom_bar(position = "dodge") + #Dodge = Bars are set side by side within each group
  ggtitle("Count of Movies by Ratings & Awards") +
  xlab("Runtime (Minutes)") +
  scale_fill_discrete(labels = c("No","yes"))


#stacked Frequency Barchart
ggplot(
  data = movies,
  aes(x = Rating, fill = Awards)) + 
  geom_bar() + #By default position = "stacked"
  ggtitle("Count of Movies by Ratings & Awards") +
  xlab("Runtime (Minutes)") +
  scale_fill_discrete(labels = c("No","Yes"))

#100% Frequency Barchart
ggplot(
  data = movies,
  aes(x = Rating, fill = Awards)) + 
  geom_bar(position = "fill") +
  ggtitle("Count of Movies by Ratings & Awards") +
  xlab("Runtime (Minutes)") +
  ylab("proportion of Movies") +
  scale_fill_discrete(labels = c("No","Yes"))
  
#No MOsaic or Spine in GGPlot2
  