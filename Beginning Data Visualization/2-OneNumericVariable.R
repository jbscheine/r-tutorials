

#Quantitative Univariate Analysis

setwd("C:/pluralsight/Datasets")
movies <- read.csv("Movies.csv")
head(movies)

#
#
# Base Plot
#
#

#dot plot of runtime per each movie
plot(
    x = movies$Runtime,
    y = rep(0, nrow(movies)),
    main = "Distribution of movie run times",
    xlab = "Runtime (minutes",
    ylab = "",
    yaxt = "n")
 
#dotplot with alpha transparancy
plot(
  x = movies$Runtime,
  y = rep(0, nrow(movies)),
  main = "Distribution of movie run times",
  xlab = "Runtime (minutes",
  ylab = "",
  yaxt = "n",
  pch = 16,
  col = rgb(0,0,0,0.1))

#Making a Jitter Plot
plot(
  x = movies$Runtime,
  y = jitter(rep(0, nrow(movies))),
  main = "Distribution of movie run times",
  xlab = "",
  ylab = "",
  yaxt = "n")

#Box Plot
boxplot(
      x = movies$Runtime,
      horizontal = TRUE,
      main = "Distribution of movie run times",
      xlab = "Runtime (minutes)")

#Histogram of Runtime
hist(
  x = movies$Runtime,
  main = "Distribution of movie run times",
  xlab = "Runtime (minutes)")

#Histogram with 10 bins, making for more vague data ranges
hist(
  x = movies$Runtime,
  breaks = 10,
  main = "Distribution of movie run times",
  xlab = "Runtime (minutes)")


#Histogram with 30 bins, making for more specific data ranges
hist(
  x = movies$Runtime,
  breaks = 30,
  main = "Distribution of movie run times",
  xlab = "Runtime (minutes)")

#create a density plot of runtime
plot(
  x = density(movies$Runtime),
  main = "Distribution of movie run times",
  xlab = "Runtime (minutes)")

#small multiples of all four
par(mfrow = c(4,1))

plot(
  x = movies$Runtime,
  y = rep(0, nrow(movies)),
  main = "Distribution of movie run times",
  xlab = "",
  ylab = "",
  yaxt = "n",
  pch = 16,
  col = rgb(0,0,0,0.1))

boxplot(
  x = movies$Runtime,
  horizontal = TRUE,
  ylim = c(0,250))

hist(
  x = movies$Runtime,
  xlim = c(0,250),
  main = "",
  xlab = "",
  ylab = "",
  yaxt = "n")

plot(
  x = density(movies$Runtime),
  xlim = c(0,250),
  main = "",
  xlab = "Runtime (minutes)",
  yaxt = "n")

par(mfrow = c(1,1))

#
#
#Lattice Plugin
#
#
library(lattice)

#dotplot
dotplot(
        x = ~Runtime,
        data = movies,
        main = "Distribution of Runtimes",
        xlab = "Runtime(Minutes)")

#Jitter
stripplot(
  x = ~Runtime,
  data = movies,
  jitter = TRUE,
  amount = .5, #amount of Jitter wanted
  main = "Distribution of Runtimes",
  xlab = "Runtime(Minutes)")

#boxplot
bwplot( #bw = box and whisper
  x = ~Runtime,
  data = movies,
  main = "Distribution of Runtimes",
  xlab = "Runtime(Minutes)")

#Histogram
histogram( 
  x = ~Runtime,
  data = movies,
  main = "Distribution of Runtimes",
  xlab = "Runtime(Minutes)")

#density plot
densityplot( 
  x = ~Runtime,
  data = movies,
  main = "Distribution of Runtimes",
  xlab = "Runtime(Minutes)")

#Small Multiples of All 4

dot <- dotplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Runtimes",
  xlab = "")

print(
  x = dot,
  position = c(0, .75, 1, 1),
  more = TRUE
)

box <- bwplot( #bw = box and whisper
  x = ~Runtime,
  data = movies,
  xlab = "")

print(
  x = box,
  position = c(0, .50, 1, .75),
  more = TRUE
)

hist <- histogram( 
  x = ~Runtime,
  data = movies,
  ylab = "",
  scales = list(y = list(draw = FALSE)))

print(
    x = hist,
    position = c(0, .25, 1, .50),
    more = TRUE
)

density <- densityplot( 
    x = ~Runtime,
    data = movies,
    ylab = "",
    scales = list(y = list(draw = FALSE)))

print(
  x = density,
  position = c(0, 0, 1, .25),
  more = TRUE
)


#
#
#GGPlot2 Plugin
#
#

library(ggplot2) 

#DotPlot
ggplot(
  data = movies,
  aes(x = Runtime, stat = "count")) + 
  geom_dotplot(binwidth = 1) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (Minutes)")

#Violin style dotplot
ggplot(
  data = movies,
  aes(x = Runtime, stat = "count")) + 
  geom_dotplot(binwidth = 1, stackdir = "center") +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (Minutes)")


#box and whisker plot
ggplot(
  data = movies,
  aes(x = Runtime, y = Runtime)) + 
  geom_boxplot() +
  coord_flip() +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("") +
  ylab("Runtime (Minutes)") +
  theme( 
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

#Histogram
ggplot(
  data = movies,
  aes(x = Runtime)) + 
  geom_histogram(binwidth = 10) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (Minutes)")  


#density plot
ggplot(
  data = movies,
  aes(x = Runtime)) + 
  geom_density() +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (Minutes)")  


#Small Multiples of All 4
dev.off() #turns off the plot window

library(grid)

viewport <- viewport(
      layout = grid.layout(4,1))

pushViewport(viewport)

dot <- ggplot(
  data = movies,
  aes(x = Runtime, ..count..)) + 
  geom_dotplot(binwidth = .25) +
  scale_x_continuous(limits = c(0,250)) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("")

print(
  x = dot,
  vp = viewport(
    layout.pos.row = 1,
    layout.pos.col = 1))
  
box <- ggplot(
  data = movies,
  aes(x = Runtime, y = Runtime)) + 
  geom_boxplot() +
  coord_flip() +
  scale_y_continuous(
    limits = c(0,250)) +
  xlab("")


print(
  x = box,
  vp = viewport(
    layout.pos.row = 2,
    layout.pos.col = 1))

hist <- ggplot(
  data = movies,
  aes(x = Runtime)) + 
  geom_histogram(binwidth = 10) +
  scale_x_continuous(
    limits = c(0,250)) +
  xlab("") 

print(
  x = hist,
  vp = viewport(
  layout.pos.row = 3,
  layout.pos.col = 1))
  
density <- ggplot(
  data = movies,
  aes(x = Runtime)) + 
  geom_density() +
  scale_x_continuous(
    limits = c(0,250)) +
  xlab("Runtime (Minutes)") 

print(
  x = density,
  vp = viewport(
    layout.pos.row = 4,
    layout.pos.col = 1))
