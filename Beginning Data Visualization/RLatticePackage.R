
#R Lattice Package

#Lattice Lesson 1

install.packages("lattice")
library(lattice)


df <- data.frame(
      Name = c("a","b","c"),
      Value = c(1,2,3))

#basic plotting defaults
dotplot(x = Value ~ Name,
        data = df)

#Lattice uses fomulas to specify what should be plotted
# the formula can be read as y as a value of x (or "y~x" )

#plot with additional parameters
dotplot(x = Value ~ Name,
        data = df,
        main = "Hello World",
        xlab = "Name",
        ylab = "Value")

#Setting a Barchart
barchart(x = Value ~ Name,
        data = df,
        col = "skyblue",
        main = "Hello World",
        xlab = "Name",
        ylab = "Value")

#Help Files
?barchart

?formula
