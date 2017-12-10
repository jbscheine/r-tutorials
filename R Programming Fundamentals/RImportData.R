#To import files, need to go to the correct directory in your file path

getwd() #gets the working directory
setwd() #Sets the working directory

setwd("C:\\pluralsight")
setwd("C:/pluralsight")


#csv
getwd()
read.csv()
read.csv("", header = TRUE, sep = ",")

my.data <- read.csv() #stores data in a data frame

#Import CSV
file <- file.path("Datasets","01Sample.csv")
my.data <- read.csv(file)
str(my.data)
my.data


#Import txt file for tabular data
file <- file.path("Datasets", "02Sample.txt")
my.data <- read.table(file,
                      header = TRUE,
                      skip = 1,
                      colClasses = c("character","factor", "numeric", "integer", "integer"))
str(my.data)
my.data


#Import Dataset from URL
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
getwd()
local <- file.path("Datasets","03DownloadedFile.data")
download.file(url,local)
my.data <- read.table(local,sep = ",")
str(my.data)
my.data

#Can use RCurl Package for more advanced scenarios when using a URL


#Import XML
setwd("C:/pluralsight")
file <- file.path("Datasets","04Sample.xml")
install.packages("XML")
library(XML)
my.data <- xmlToDataFrame(file,
                          colClasses = c("character","integer","integer"),
                          stringsAsFactors = FALSE)
str(my.data)


#Import Xlsx
setwd("C:/pluralsight")
file <- file.path("Datasets","05Sample.xlsx")
install.packages("XLConnect")
library(XLConnect)
my.data <- readWorksheetFromFile(file,
                                 sheet=1,
                                 startRow=2)
str(my.data)
my.data <- transform(my.data,
                     student.gender = as.factor(student.gender),
                     student.physics.marks = as.integer(student.physics.marks),
                     student.chemistry.marks = as.integer(student.chemistry.marks))
str(my.data)

#Import existing datasets
library(datasets)
data(package="datasets")
data(iris)
str(iris)

#Import from Database using RODBC
install.packages("RODBC")
library(RODBC)
connect <- odbcConnect("mysqlconnection")
my.data <- sqlQuery(connect, "SELECT * FROM test.classroom")
my.data