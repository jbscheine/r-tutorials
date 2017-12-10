#Visualizing both a categorical and numeric variable
#Bivariate visualizations for both qualatative and quantatative variable
setwd("C:/pluralsight/Datasets")
movies <- read.csv("Movies.csv")
head(movies)

awards <- table(movies$Awards,
                movies$Rating)

print(awards)

#
#
# Base plotting
#
#

#Bivariate bar graph
average <- tapply(movies$Box.Office,
                  movies$Rating,
                  mean)

print(average)

barplot(height = average,
        main = "Average Box Office Rev by Rating",
        xlab = "Rating",
        ylab = "Box Office")

#Box Plot
plot(x = movies$Rating,
     y = movies$Box.Office,
     main = "Average Box Office Rev by Rating",
     xlab = "Rating",
     ylab = "Box Office")

#Notced Box Plot
plot(x = movies$Rating,
     y = movies$Box.Office,
     notch = TRUE,
     main = "Average Box Office Rev by Rating",
     xlab = "Rating",
     ylab = "Box Office")

#Base plotting cant create violin charts


#
#
# Lattice
#
#

install.packages("dplyr") #dplyr is highly reccomended
library(dplyr)

average <- movies %>%
          select(Rating, Box.Office) %>%
          group_by(Rating) %>%
          summarize(Box.Office = mean(Box.Office)) %>%
          as.data.frame()

print(average)

#Barchart
barchart(x = Box.Office ~ Rating,
         data = average,
         main = "Average Box Office Rev by Rating",
         xlab = "Rating",
         ylab = "Box Office")

#Box Plot
bwplot(x = Box.Office ~ Rating,
         data = movies,
         main = "Average Box Office Rev by Rating",
         xlab = "Rating",
         ylab = "Box Office")

#notched boxplot
bwplot(x = Box.Office ~ Rating,
       data = movies,
       notch = TRUE,
       main = "Average Box Office Rev by Rating",
       xlab = "Rating",
       ylab = "Box Office")

#violin boxplot
bwplot(x = Box.Office ~ Rating,
       data = movies,
       panel = panel.violin,
       main = "Average Box Office Rev by Rating",
       xlab = "Rating",
       ylab = "Box Office")

#
#
# GGPlot
#
#

#Bar Chart based on Average
ggplot(data = average, # from above
       aes(x = Rating, y = Box.Office)) +
      geom_bar(stat = "identity") +
      ggtitle("Average Box Office Rev by Rating") +
      xlab("Rating") +
      ylab("Box Office")
  

#Box Cahrt
ggplot(data = movies, 
       aes(x = Rating, y = Box.Office)) +
      geom_boxplot() +
      ggtitle("Average Box Office Rev by Rating") +
      xlab("Rating") +
      ylab("Box Office")

#Bar Chart notched
ggplot(data = movies, 
       aes(x = Rating, y = Box.Office)) +
  geom_boxplot(notch = TRUE) +
  ggtitle("Average Box Office Rev by Rating") +
  xlab("Rating") +
  ylab("Box Office")

#Violin
ggplot(data = movies, 
       aes(x = Rating, y = Box.Office)) +
  geom_violin() +
  ggtitle("Average Box Office Rev by Rating") +
  xlab("Rating") +
  ylab("Box Office")

