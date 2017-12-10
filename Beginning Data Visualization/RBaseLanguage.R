#R Base Language - Plotting without needing a package (preinstalled)

#Base Lession 1

#Basic Data Visualization
df <- data.frame(
      Name = c("a","b","c"),
      Value = c(1,2,3))

print(df)

#Basic Plot - Contains x and y label
plot(df)

#Basic Plot specifying Values (does not contain x and y label)
plot(df$Name, df$Value)

plot(
  x = df$Name,
  y = df$Value)

#Bar Plot
barplot(names = df$Name,
        height = df$Value,
        col = "skyblue",
        main = "Hello World",
        xlab = "Name",
        ylab = "Value")

#Help Files
?plot

?barplot

?par




