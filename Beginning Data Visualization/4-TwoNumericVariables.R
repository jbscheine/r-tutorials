#Bivariate visualizations for two quantative variables

#For all density plots see GGPlot

setwd("C:/pluralsight/Datasets")
movies <- read.csv("Movies.csv")
head(movies)

awards <- table(movies$Awards,
                movies$Rating)

print(awards)

#
#
# Base (Plotting)
#
#


#Scatterplot
plot(
  x = movies$Runtime,
  y = movies$Box.Office,
  main = "Runtime vs box Office Revenue",
  xlab = "Runtime (Minutes)",
  ylab = "Box Office ($M)")

#Creates linear regression line
model <- lm(movies$Box.Office ~ movies$Runtime)

#draw line regression line on plot
lines(
  x = movies$Runtime,
  y = model$fitted,
  col = "red",
  lwd = 3
)

install.packages("hexbin")
library(hexbin)

hexbin <- hexbin(x = movies$Runtime,
                 y = movies$Box.Office,
                 xbins = 30, #Creates a bin of hexagons along x axis at 30
                 xlab = "Runtime (ms)",
                 ylab = "box office ($m)")

plot(
  x = hexbin,
  main = "Runtime vs Box Office"
)

#Skipped Density charts because they are ugly and I didnt care about them


#Time Series
timeSeries <- read.csv("TimeSeries.csv")
print(timeSeries)

#Step chart
plot(x = timeSeries,
     type = "s", # s means step
     ylim = c(0,max(timeSeries$Box.Office)),
     main = "Average Box Office per Year",
     xlab = "Year",
     ylab = "Box Office ($m)")

#line Chart
plot(x = timeSeries,
     type = "l", # l means line 
     ylim = c(0,max(timeSeries$Box.Office)),
     main = "Average Box Office per Year",
     xlab = "Year",
     ylab = "Box Office ($m)")


#
#
# Lattice
#
#

library(lattice)

#scatterplot
xyplot(x = Box.Office ~ Runtime,
       data = movies,
       main = "Average Box Office per Year",
       xlab = "Year",
       ylab = "Box Office ($m)")

#Add Regresion Line
xyplot(x = Box.Office ~ Runtime,
       data = movies,
       type = c("p","r"), #p means points, r stands for regression (line)
       main = "Average Box Office per Year",
       xlab = "Year",
       ylab = "Box Office ($m)")

library(hexbin)

#Hexbin frequency heatmap
hexbinplot(x = Box.Office ~ Runtime,
           data = movies,
           main = "Average Box Office per Year",
           hexbins = 30,
           xlab = "Year",
           ylab = "Box Office ($m)")


#Create a Step plot
xyplot(x = Box.Office ~ Year,
     data = timeSeries,
     type = "s",
     ylim = c(0, max(timeSeries$Box.Office)),
     main = "Average Box Office per Year",
     xlab = "Year",
     ylab = "Box Office ($m)")


#Line Chart
xyplot(x = Box.Office ~ Year,
       data = timeSeries,
       type = "l",
       ylim = c(0, max(timeSeries$Box.Office)),
       main = "Average Box Office per Year",
       xlab = "Year",
       ylab = "Box Office ($m)")


install.packages("latticeExtra")
library(latticeExtra)

#Area Chart
xyplot(x = Box.Office ~ Year,
       data = timeSeries,
       panel = panel.xyarea,
       ylim = c(0, max(timeSeries$Box.Office)),
       main = "Average Box Office per Year",
       xlab = "Year",
       ylab = "Box Office ($m)")

#
#
# GGPlot2
#
#

library(ggplot2)

#scatterplot
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) + 
  geom_point() +
  ggtitle("Runtime vs Box Office Revenue") +
  xlab("Runtime (Minutes)") +
  ylab("box office")

#Add linear regression
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("Runtime vs Box Office Revenue") +
  xlab("Runtime (Minutes)") +
  ylab("box office")

#Heatmap
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) + 
  stat_bin2d() +
  ggtitle("Runtime vs Box Office Revenue") +
  xlab("Runtime (Minutes)") +
  ylab("box office")

#hexagonal bins
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) + 
  stat_binhex() +
  ggtitle("Runtime vs Box Office Revenue") +
  xlab("Runtime (Minutes)") +
  ylab("box office")

#contour plot of density
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) + 
  geom_density2d() +
  ggtitle("Runtime vs Box Office Revenue") +
  xlab("Runtime (Minutes)") +
  ylab("box office")

#level plot of density
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) + 
  stat_density2d(aes(fill = ..level..), geom = "polygon") + #" .. Varaible .. "(special notation) = says variable is not in the original data set and is computed by the statistic
  ggtitle("Runtime vs Box Office Revenue") +
  xlab("Runtime (Minutes)") +
  ylab("box office")

#3D does not exist in GGPlot 2

#Create a step chart
ggplot(
  data = timeSeries,
  aes(x = Year, y = Box.Office)) +
  geom_step() +
  expand_limits(y = 0) +
  ggtitle("Box Office per Year") +
  xlab("Year") +
  ylab("Box Office")

#Line Chart
ggplot(
  data = timeSeries,
  aes(x = Year, y = Box.Office)) +
  geom_line() +
  expand_limits(y = 0) +
  ggtitle("Box Office per Year") +
  xlab("Year") +
  ylab("Box Office")

#Area Chart
ggplot(
  data = timeSeries,
  aes(x = Year, y = Box.Office)) +
  geom_area() +
  expand_limits(y = 0) +
  ggtitle("Box Office per Year") +
  xlab("Year") +
  ylab("Box Office")
