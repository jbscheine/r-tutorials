
#If, ElseIF, Else etc...
IsGoodPerformanceByBatch <- function(test.marks) {
  average.marks <- mean(test.marks)
  print(paste("average marks: ", average.marks))
  if(average.marks >= 75){
    print("Overall performance of the batch is brilliant")
  }
  else if(average.marks >= 60){
    print("overall performance is satisfactory")
  }
  else{ 
    print("Overall peformance of the batch is below average")
  }
  print("Overall performance of the batch is completed")
}

IsGoodPerformanceByBatch(test.marks = c(70L, 75L, 80L, 85L)) #Brilliant
IsGoodPerformanceByBatch(test.marks = c(50L, 55L, 60L, 70L)) #Below
IsGoodPerformanceByBatch(test.marks = c(50L, 55L, 65L, 70L)) #Satisfactory


# Switch
GetMarksSummary <- function(test.marks, summary.type) {
  result <- switch(summary.type,
    "mean" = {
      mean(test.marks)
    },
    "median" = {
      median(test.marks)
    },
    "variance" = {
      var(test.marks)
    },
    "Not Implemeneted"
  
  )
    #If only one argument, no need for brackets:
    #result <- switch(summary.type,
    # "mean" = mean(test.marks),
    # "median" = median(test.marks),
    # "variance" = var(test.marks),
    # "Not Implemented"
    #)

  result
  }

GetMarksSummary(test.marks = c(70L, 75L, 80L, 85L), "mean")
GetMarksSummary(test.marks = c(70L, 75L, 80L, 85L), "median")
GetMarksSummary(test.marks = c(70L, 75L, 80L, 85L), "variance")
GetMarksSummary(test.marks = c(70L, 75L, 80L, 85L), "unkown")

#Vectorized If
test.marks <- c(70L, 75L, 80L, NA)
test.marks >= 75
ifelse(test.marks >= 75, c("Great", "Bravo", "Excellent", "Congrats"), c("Keep Going", "Keep it Up", "Not Bad", "Just Missed", "Just OK"))
ifelse(test.marks >= 75, "With Distinction", "Wihout Distinction " )


#Repeat (used for looping without a break)
#Only when want to execute for ever
WriteOnNotebook <- function() {
  count <- 0
  repeat {
    count <- count + 1
    print(paste("writing on page number",count))
  }
}

WriteOnNotebook()


#Repeat with Break -> in order to break the loop so it wont go forever
WriteOnNotebook <- function(total.page.count) {
  count <- 0
  repeat {
    count <- count + 1
    if(count > total.page.count){
      print("page finished")
      break
    }
    print(paste("writing on page number",count))
  }
}

WriteOnNotebook(total.page.count = 10)

#Repeat with Next -> In order to skip positions in the loop
WriteOnNotebook <- function(total.page.count) {
  count <- 0
  repeat {
    count <- count + 1
    if(count > total.page.count){
      print("page finished")
      break
    }
    if(count %% 2 == 0){
      print(paste("page skipping number", count))
      next
    }
    print(paste("writing on page number",count))
  }
}

WriteOnNotebook(total.page.count = 10)

#While Loops: the conditions are checked before entering into the loop
WriteOnNotebook <- function(total.page.count) {
  count <- 0
  while(count < total.page.count){
    count <- count + 1
    print(paste("writing on page number",count))
  }
      print("page finished")
}

WriteOnNotebook(total.page.count = 10)


#ForLoops: used to loop through vectors which can be of any type loops 
#through elements
WriteOnNotebook <- function(total.page.count){
  for(count in 1:total.page.count){
    print(paste("writing on the page", count))
  }
}

WriteOnNotebook(total.page.count = 10)


#Apply Loops: Advanced Loops that return a vector which should be used on an
#and array and matrix
student.marks <- matrix(c(70L, 75L, 72L, 80L, 50L,
                          80L, 85L, 60L, 72L, 88L,
                          60L, 70L, 87L, 55L, 90L,
                          85L, 70L, 74L, 86L, 78L), ncol = 5, nrow = 4, 
                        byrow = TRUE)

rownames(student.marks) <- c("Raj", "Rahul", "Priya", "Poonam")
colnames(student.marks) <- c("Physics", "Chemistry", "Mathematics", "Biology", 
                             "History")
student.marks 


#Example to show that using for loops to find the totals takes 7 or 8 lines
#where as with the APPLY function, it will only take 1 line
result <- vector("numeric", length=nrow(student.marks))
for(row in 1:nrow(student.marks)){
  sum <- 0
  for(column in 1:ncol(student.marks)){
    sum <- sum + student.marks[row,column]
  }
  result[row] <- 0
}
result

#apply functions
apply(student.marks,1,sum)
apply(student.marks, 1, max) #Top marks from each student
apply(student.marks, 1, which.max) #Which column each student did the best in
colnames(student.marks)[apply(student.marks,1,which.max)]#Which subject (name) each student did the best in
apply(student.marks,2,mean)
apply(student.marks,2,max)
rownames(student.marks)[apply(student.marks,2,which.max)]
apply(student.marks,1:2, function(x) x + 2)
