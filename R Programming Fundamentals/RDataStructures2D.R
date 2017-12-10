#Data Frame
#Heterogenus
#Contains elements from different classes
#2D

student.names <- c("Raj", "Rahul", "Priya", "Poonam")
student.weight <- c(60.5, 72.5, 45.2, 47.5)
student.genders <- factor(c("Male", "Male", "Female", "Female")) 
student.physics.marks <-c(70L, 75L, 80L, 85L)
student.chemistry.marks <- c(60L, 70L, 85L, 70L)

#Each Element needs to contain the same number of elements (each one in students has 4)
students <- data.frame(student.names,student.weight, student.genders, 
                      student.physics.marks, student.chemistry.marks)
typeof(students) #a Data frame is a list, with each element as a vector
students
str(students)
#By default, character strings are passed factor in a dataframe

#To change it back to a character string run the below stringAsFacor = false:
students <- data.frame(student.names,student.weight, student.genders, 
                       student.physics.marks, student.chemistry.marks, stringsAsFactors = F)
str(students)

#Subsetting Data Frames
students[1]
typeof(students[1])
students[[1]]
typeof(students[[1]])
students[["student.names"]]
typeof(students[["student.names"]])
students$student.names
typeof(students$student.names)
students[1:3] #Refers to headers (Names-Gender)
students [2:3]
students[c("student.physics.marks", "student.chemistry.marks")] #same as line 34
students
students[1,2] #row number, column number
students[1:3,1:2]
students[c(1,2),c(1,3,4)]
students[,1]
students[1,]
students[c(T,F,T,F),] #get rows 1 & 3, but not 2 & 4 (get all columns) 
students[student.genders == "Male",]
students[student.physics.marks >= 75,]

#Matrix (Matrices)
#2D
#Contains Elements of Same Class only
#used to store numeric data

student.physics.marks <-c(70L, 75L, 80L, 85L)
student.chemistry.marks <- c(60L, 70L, 85L, 70L)
student.marks <-rbind(student.physics.marks,student.chemistry.marks) #Rbind - sorts by rows
colnames(student.marks) <- c("Raj", "Rahul", "Priya", "Poonam")
student.marks
student.marks <-cbind(student.physics.marks,student.chemistry.marks) #Cbind - Sorts by Columns
student.marks
rownames(student.marks) <- c("Raj", "Rahul", "Priya", "Poonam")
student.marks
str(student.marks)
student.marks <- matrix(c(70L, 75L, 80L, 85L, 60L, 70L, 85L, 70L), ncol=2, nrow=4) #Ordered by Columns by default
student.marks
student.marks <- matrix(c(70L, 75L, 80L, 85L, 60L, 70L, 85L, 70L), ncol=4, nrow=2, byrow=TRUE) #ordered by Row 
student.marks

#Matrix Subsetting
student.physics.marks <-c(70L, 75L, 80L, 85L)
student.chemistry.marks <- c(60L, 70L, 85L, 70L)
student.marks <-cbind(student.physics.marks,student.chemistry.marks)
rownames(student.marks) <- c("Raj", "Rahul", "Priya", "Poonam")
student.marks

student.marks[,]
student.marks[2,2]
student.marks[2,]
student.marks[,2]
student.marks[1:3,]
student.marks[c(1,3),]
student.marks[c(T,F,F,T),]


#Summary
student.marks
rowSums(student.marks)
colSums(student.marks)
colMeans(student.marks)


#Arrays:
#Not Common
#Similar Class Types
#ND - As many as possible
#Considered as multiple sheets or matrixes stacked on one another

#Matrix 1
class1.student.physics.marks <-c(70L, 75L, 80L, 85L)
class1.student.chemistry.marks <- c(60L, 70L, 85L, 70L)
class1.student.marks <-cbind(class1.student.physics.marks,class1.student.chemistry.marks)

class1.student.marks

#Matrix 2
class2.student.physics.marks <-c(71L, 76L, 81L, 86L)
class2.student.chemistry.marks <- c(61L, 71L, 86L, 71L)
class2.student.marks <-cbind(class2.student.physics.marks,class2.student.chemistry.marks)

class2.student.marks


#Array
student.marks <- array(c(class1.student.marks, class2.student.marks), dim=c(4,2,2))
student.marks

#Extracting elements from an Array
student.marks[2,2,2] #Row, Column, Sheet
student.marks[1:3,2,]
