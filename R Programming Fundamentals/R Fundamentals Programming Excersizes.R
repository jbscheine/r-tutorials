#comments
print ('hello world')
mean(1:20)
x <- (1:20)
mean(x)

x <- 10
#x is different then X - Case is different
#https://google.github.io/styleguide/Rguide.xml


#Variables & Envorments
assign("x",10)

match.score <- 300
match.score
assign("match.score",300)
match.score

my.enviorment <- new.env()
parent.env(my.enviorment)

assign("x",10,my.enviorment)
my.enviorment[["x"]] <- 10
my.enviorment$x <- 10

get(my.enviorment,"x")
my.enviorment[["x"]]
my.enviorment$x

#Arrithmatic operators
10 + 5
10 - 5
10 * 5
10 / 5
10 ^ 5
format(10 ^ 5, scientific=FALSE)
10**5
10%%3
10%/%3

#Math Functions
abs(-5)
log(2)
log(2, base = 10)
exp(5)
factorial(5)

#special constant
pi
options() #Gets global settings
options(digits = 10) #sets digits to 10
pi

#Special Cases
#Inf and -Inf = infinity and negative number
#NaN: Not a number
#NA: Not Available
1 / 0
-1 / 0
Inf + 5
is.finite(1 / 0)
is.infinite(1 / 0)

Inf / Inf
is.nan(Inf/Inf)

NA + 5
is.na(NA)

#NaN is NA, but NA is not Nan
is.nan(NA)
is.na(NaN)

#Logical Operators
5 > 2
5 >= 2
5 < 2
5 <= 2
5 == 2
5 != 2
"b" > "a"
!(TRUE) #Reverse TRUE, which = FALSE
TRUE | FALSE
TRUE & FALSE

#Vectorized Operations
student.marks <- c(10, 20, 30, 40)
student.marks

mean(student.marks)

student.marks <- student.marks + 5
student.marks
student.marks >= 30

student.physics.marks <- c(20, 40, 30, 50)
student.chemistry.marks <- c(30, 20, 50, 20)
student.total.marks <- student.physics.marks + student.chemistry.marks
student.total.marks

