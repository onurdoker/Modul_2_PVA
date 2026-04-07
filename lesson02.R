''
'Exercises 1.
Write a function that, given an ordered array of 10 arbitrarily chosen numbers, selects 3 values using sampling without replacement, computes the square root of the sum of the selected values, and returns the result.
'
''
question1 <- function() {
  values <- sample(
    1:10,
    size = 3,
  )
  sqrt(
    sum(
      values
    )
  )
}
question1()

''
'
Exercises 2.
Write a function that selects 3 values from a list of 5 randomly selected numbers with replacement calculates the square of the average of the selected values, rounds the result to zero decimal places, and returns it.
'
''
question2 <- function() {
  values <- sample(
    1:5,
    size = 3,
    replace = TRUE
  )
  round(
    mean(
      values
    )^2,
    digits = 0
  )
}
question2()


''
'
Exercises 3
Write a function that calculates the area of circle based on the radius value entered by the user, and returns the result
'
''
question3 <- function() {
  radius <- readline(prompt = "Enter the radius: ")
  area <- pi * (as.numeric(radius))^2
  return(area)
}
question3()

# Atomic vector: is a simple data vector, Atomic vectors can contain one or more value
die <- c(1, 2, 3, 4, 5, 6)
die

# is.vector function is used for checking if the object is a vector or not.
is.vector(die) # TRUE
# Logical vector: is a vector of TRUE
five <- 5
is.vector(five) # TRUE

# length function is used to find the length of the vector.
length(die) # 6
length(five) # 1

# Atomic vectors hold only one type of data, while lists can hold multiple types of data.

# typeof function is used to check the type of a variable.
typeof(die) # double
typeof(five) # double
# double means numeric values in R

# Characters
text <- c(
  'Hello',
  'World'
)
text # "Hello" "World"
length(text) # 2
typeof(text) # character
typeof('Hello') # character


# Let's create a vector containing 4 randomly selected names.
names <- c(
  'Ali',
  'Veli',
  'Ahmet',
  'Zeynep'
)
typeof(names) # character

# Logicals
3 > 4 # FALSE
5 < 6 # TRUE
10 == 10 # TRUE
10 != 9 # TRUE
'Hello' == 'hello' # FALSE

# Logical vectors store only TRUE or FALSE values, which are used for conditional statements.
logic <- c(TRUE, FALSE, TRUE, TRUE)
typeof(logic) # logical

# Factors
gender <- factor(
  c(
    'male',
    'female',
    'male',
    'male'
  )
)
typeof(gender) #integer

# Lists
# lists contain different types of data in R.
list1 <- list(
  100:129,
  'R',
  list(
    TRUE,
    FALSE
  )
)
list1
length(list1) # 3
typeof(list1) #list

list2 <- list(
  c(
    'R',
    'Programming'
  ),
  c(
    1,
    2,
    3
  ),
  list(
    c(
      TRUE,
      FALSE
    ),
    1
  )
)

list2
length(list2) # 3
typeof(list2) # list


list3 <- list(
  '1',
  list(
    1,
    TRUE
  ),
  list(
    c(
      'R',
      'Programming'
    ),
    1:10
  ),
  TRUE,
  FALSE,
  TRUE
)
list3
length(list3) # 6
typeof(list3) # list

# Data Frames
# Data frames are two-dimensional versions of lists.
# They are the most useful storage structure for data analysis.
df <- data.frame(
  Name = c(
    'Ali',
    'Ahmet',
    'Zeynep'
  ),
  Class = c(
    1,
    4,
    3
  ),
  Grade = c(
    3.2,
    2.89,
    2.76
  )
)
df
View(df)

# In R programming language, instead of creating a dataframe from scratch, it is common to create dataframes by loading pre-existing data.
x <- read.csv(
  'lesson02.csv',
  header = TRUE,
)
View(x)

# Data filtering in R Programming Language

# From vectors
vector <- c(6, 3, 1, 6, 10, 5)
vector[2:4] # 3 1 6
vector[
  c(
    2,
    3,
    4
  )
] # 3 1 6


# From Dataframes
# For a single record
x[1, 1] # Selin
x[3, 2] # 3

# For entire row
x[1, c(1:3)] # 1 Selin     3 3.22
x[1, c(1, 2, 3)] # 1 Selin     3 3.22
x[1, 1:3] # 1 Selin     3 3.22
x[1, ] # 1 Selin     3 3.22

new1 <- x[c(1, 2), 1] # new1 is a vector with two elements
new1 # "Selin" "Baris"

new2 <- x[c(1, 2), c(1, 2)] # new1 is a data frame with two rows and two columns
View(new2)

nrow(x) # Number of rows in the dataframe
x[nrow(x), ] # All the values in the last row of the dataframe

ncol(x) # Number of columns in the dataframe
x[, ncol(x)] # All the values in the last column of the dataframe

# 100 lines second and third columns
x[100, c(2, 3)] #   2 2.84

# The use of negative numbers in data filtering operations
x[-1, ] # All rows except the first row

x[-(2:1000), ] # All rows except the second to the thousandth row aka first row only

# All rows and columns except for the 1st, 3rd and 5th rows
x[-c(1, 3, 5), ]

# All rows except the first two columns
x[, -3]

# All rows and columns except for the 3rd row and 1st column
x[-3, -1]

# Data filtering using logical expressions
# The first two columns of the first row
x[1, c(TRUE, TRUE, FALSE)] # Selin 3

# We can use it on a similar way with vectors
vector[c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)] # 3 6 5

# Data filtering using variable names
x[1, c('isim', 'sinif', 'not')] # Selin     3 3.22

# all values in the 'not' column
x[, 'not']

# To filter a single column from a dataframe in R
# all values in the 'not' column
x$not

# Calculate the mean of the all values in the 'not' column
mean(
  x$not
) # 2.58674

# Calculate the median of the all values in the 'not' column
median(
  x$not
) # 2.59


# Change the value within an object
vector # 6  3  1  6 10  5
vector[1] <- 17
vector # 17  3  1  6 10  5

# Increase the values of elements 4, 5 and 6 by 1
vector # 17  3  1  6 10  5
vector[4:6] <- vector[4:6] + 1
vector # 17  3  1  7 11  6

# Create a new dataframe named x1 with dataframe named x and add a new column
x1 <- x
x1$new <- 1:1000
View(x1)

# Delete a column from the dataframe
x1$new <- NULL
View(x1)

save.image(file = "lesson02.RData")
