#R Lattice Package

#ggplot2 Lesson 1
install.packages("ggplot2")
library(ggplot2)

df <- data.frame(
  Name = c("a","b","c"),
  Value = c(1,2,3))

#Basic Plot
ggplot(
        data = df,
        aes(
            x = Name,
            y = Value)) +
  geom_point()

#Plot with parameters
ggplot(
  data = df,
  aes(
    x = Name, 
    y = Value)) +
  geom_point() +
  ggtitle("Hello World") +
  xlab("Name") +
  ylab("Value") +
  theme(plot.title = element_text(hjust = 0.5)) # Makes the title centered

#Plot a Bar Chart
ggplot(
  data = df,
  aes(
    x = Name, 
    y = Value)) +
  geom_bar(
    stat = "identity",
    fill = "skyblue") +
  ggtitle("Hello World") +
  xlab("Name") +
  ylab("Value") +
  theme(plot.title = element_text(hjust = 0.5)) # Makes the title centered

#Help files
?ggplot

?aes #aestetics

?geom_bar

?ggtitle