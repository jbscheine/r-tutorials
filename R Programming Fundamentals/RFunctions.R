#Functions
#Built in Functions & Build your own Functions
#Need Functions because 

GetTotalMarks <- function(quiz.marks, viva.marks) {
  
  total.marks <- quiz.marks + viva.marks
  total.marks
}

student.physics.quiz.marks <-c(70L, 75L, 80L, 85L)
student.physics.viva.marks <- c(7L, 5L, 8L, 6L)
student.physics.total.marks <- GetTotalMarks(student.physics.quiz.marks, student.physics.viva.marks)

student.physics.total.marks

student.chemistry.quiz.marks <-c(60L, 70L, 85L, 70L)
student.chemistry.viva.marks <- c(8L, 4L, 7L, 9L)
student.chemistry.total.marks <- GetTotalMarks(student.chemistry.quiz.marks, student.chemistry.viva.marks)

student.chemistry.total.marks

#Default Assigment within a function
GetTotalMarks <- function(quiz.marks, viva.marks,assignment.marks = 5L) {
  
  total.marks <- quiz.marks + viva.marks + assignment.marks
  total.marks
}


quiz.marks <-c(70L, 75L, 80L, 85L)
viva.marks <- c(7L, 5L, 8L, 6L)
assignment.marks <- c(2L, 1L, 3L, 4L)

GetTotalMarks(quiz.marks,viva.marks)
GetTotalMarks(quiz.marks,viva.marks,assignment.marks)


GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L))
GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L),
              assignment.marks = c(2L, 1L, 3L, 4L))

#Additional Arguments Using Ellipses
GetTotalMarks <- function(quiz.marks, viva.marks,assignment.marks = 5L, ...) {
  
  total.marks <- quiz.marks + viva.marks + assignment.marks + sum(...)
  total.marks
}


GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L),
              assignment.marks = c(2L, 1L, 3L, 4L), creativity.marks = 2)
GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L),
              assignment.marks = c(2L, 1L, 3L, 4L), creativity.marks = 2, attendance.marks = 3)

#Duplicate as above, with just adding viewing for the extra argument s
GetTotalMarks <- function(quiz.marks, viva.marks,assignment.marks = 5L, ...) {
  
  total.marks <- quiz.marks + viva.marks + assignment.marks + sum(...)
  #Can Print & Work on additional arguments within the function
  extra.arguments = list(...)
  print(extra.arguments)
  total.marks
}


GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L),
              assignment.marks = c(2L, 1L, 3L, 4L), creativity.marks = 2)
GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L),
              assignment.marks = c(2L, 1L, 3L, 4L), creativity.marks = 2, attendance.marks = 3)


#Lazy Evaluation (Not a Duplicate)
#on line 78, when the code gets to extra.marks -> it will go back to the argument on line 75 to check if
#there is a new argument, in which case there is (extra.marks). extra.marks = average.viva.marks so therefor
#it will check for the variable in the function in which we have already set it on line 79
GetTotalMarks <- function(quiz.marks, viva.marks, extra.marks = average.viva.marks) {

  average.viva.marks <- mean(viva.marks)
  total.marks <- quiz.marks + viva.marks + extra.marks
  total.marks
}

GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L))

#Multiple Return Values
#average Marks = Class Average
GetMarksSummary <- function(quiz.marks, viva.marks){
  
  total.marks <- quiz.marks + viva.marks
  average.marks <- mean(total.marks)
  return(list(total = total.marks,average = average.marks))
}

GetMarksSummary(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L))

#Functions as first class Objects
GetTotalMarks <- function(quiz.marks, viva.marks) {
  
  total.marks <- quiz.marks + viva.marks
  total.marks
}

GetTotalMarks #return function itself
formals(GetTotalMarks) #Returns Arguments
body(GetTotalMarks) #Access Body

MyGetTotalMarks <- GetTotalMarks #Assign Functions to New Variables
MyGetTotalMarks


#Named Functions Created
GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L)) #Normal Function Normal Arguments

#Pass GetTotalMarks as an arugemnt in do.call function
do.call(GetTotalMarks, list(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L))) 


#Anomynous Function
do.call(function(quiz.marks, viva.marks) {
  quiz.marks + viva.marks
}, list(quiz.marks = c(70L, 75L, 80L, 85L),viva.marks = c(7L, 5L, 8L, 6L)))

