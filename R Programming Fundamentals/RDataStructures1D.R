# Data Structures

#collection of data elements
#Grouped under one name

#Container
  #What to put in
  #How to arrange items

#Similar items = Homogeneus data structures (Atomic Vector, Matrix, Array)
#None Similar items = Heterogenus data structures (List, Data Frame)

student.names <- c("Raj", "Rahul", "Priya", "Poonam")
student.names
str(student.names)
is.character(student.names)

student.weight <- c(60.5, 72.5, 45.2, 47.5)
str(student.weight)
is.numeric(student.weight)

student.physics.marks <-c(70L, 75L, 80L, 85L) #L means to treat as a Integer
str(student.physics.marks)
is.integer(student.physics.marks)

#Integer is always numeric, but number is not always an integer
is.numeric(student.chemistry.marks)
is.integer(student.weight)

student.physics.interest <- c(FALSE, F, TRUE, T)
str(student.physics.interest)
is.logical(student.physics.interest)

complex.vector <- c(10+2i, -1+10i, 4+3i, 7+8i)
str(complex.vector)
is.complex(complex.vector)

#Creating an empty atomic vector using vector()
vector("character", length = 4) #Empy String
vector("numeric", length = 4) #0
vector("integer", length = 4) #0
vector("logical", length = 4) #default FALSE
vector("complex", length = 4) # 0+0i

#Performing arithmetic and logical operationon atomic vectors
student.physics.marks <- c(70L, 75L, 80L, 85L)
student.chemistry.marks <- c(60L, 70L, 85L, 70L)
student.physics.marks + student.chemistry.marks
student.physics.marks >= 75

#Extract elements from atomic vectors (Substring)
student.names <- c("Raj", "Rahul", "Priya", "Poonam")
student.names[1]
student.names[2]
student.names[1:3]
student.names[c(T,F,T,F)]
student.names[student.physics.marks >= 75]

#Coercions: converting one type to another, Typecasting, typeconverting

#implicit coercion
student.weight <- c(60.5, 72.5, 45.2, "47.5")
str(student.weight) #All become string type and not integer type

#Explicit Coercions - Sensible 
as.numeric(student.physics.marks >= 75) #Since Logical, will return 1 for True, 0 for False
as.character(student.physics.marks)
student.weight <- c(60.5, 72.5, 45.2, "47.5")
as.integer(student.weight)

#Explicit Coercions - unsensible
as.numeric(student.names) #Return Error message




#Factors
#more  efficient than character vectors
#Self Describing (not numeric representation)
#Additional Levels can be created, categorization
#

student.genders <- c("Male", "Male", "Female", "Female") #Character Vector
student.genders
student.genders <- c(2L, 2L, 1L, 1L) #Integer Vector
student.genders
student.genders <- factor(c("Male", "Male", "Female", "Female")) #Factor
student.genders
as.numeric(student.genders)
student.bloodgroups <- factor(c("A", "AB", "O", "AB"), levels = c("A", "B", "O", "AB"))
str(student.bloodgroups)


#Extra
student.chemistry.marks
student.physics.marks
student.genders
student.names
student.weight


#Lists
#

#Unnamed List
student1 <- list(student.names[1],student.weight[1], student.genders[1], 
                 student.physics.marks[1], student.chemistry.marks[1])
str(student1)
student1

#Named List
student1 <- list(Name = student.names[1],
                 Weight = student.weight[1], 
                 Gender = student.genders[1], 
                 Physics = student.physics.marks[1], 
                 Chemistry = student.chemistry.marks[1])
str(student1)

#Vector as a variable in list
student1 <- list(Name = student.names[1],
                 Weight = student.weight[1], 
                 Gender = student.genders[1], 
                 Marks = c(student.physics.marks[1], student.chemistry.marks[1]))
str(student1)

#subsetting

#Unnamed List
student1 <- list(student.names[1],student.weight[1], student.genders[1], 
                 student.physics.marks[1], student.chemistry.marks[1])


student1[1] #returns element of same type
typeof(student1[1])
student1[[1]] #returns of object of same type
typeof(student1[[1]])
student1[1:3] #Access multiple using index
student1[[1:3]] #Error - cannot do it on an object in a list


#Named List
student1 <- list(name = student.names[1],
                 weight = student.weight[1], 
                 gender = student.genders[1], 
                 marks = c(student.physics.marks[1], student.chemistry.marks[1]),
                 chemistry = student.chemistry.marks[1],
                 physics = student.physics.marks[1])

student1[["name"]]
student1$gender
student1["marks"]
student1[c("chemistry","physics")] 

length(student1)
