# Importing a CSV file into R
x <- read.csv(
  'lesson02.csv',
  header = TRUE,
)
View(x)

# All colums of observations from the 25th row to the 100th row into a new object
new_data <- x[25:100, ]
new_data <- x[25:100, 1:3]
new_data <- x[25:100, c(1, 2, 3)]
new_data <- x[25:100, c('isim', 'sinif', 'not')]
new_data <- x[25:100, c(TRUE, TRUE, TRUE)]
# All operations above yield the same result, but the first comde snippet is more practical.

View(new_data)

# Data filtering with logical expressions
1 > 2 # FALSE
1 > c(0, 1, 2) # TRUE, FALSE, FALSE
c(0, 1, 2) == c(2, 1, 0) # FALSE, TRUE, FALSE
c(1, 2, 3) == c(3, 1) # FALSE, FALSE, TRUE

# %in% is the only operator that does not perform element-wise operations
# %in% checks whether the values on the left side are present in the vector on the right side.
1 %in% c(2, 3, 4) # FALSE
c(1, 2) %in% c(3, 4, 5) #FALSE FALSE
c(1, 2, 3) %in% c(3, 4, 5) #FALSE FALSE TRUE
c(1, 2, 3, 4) %in% c(3, 4, 5) #FALSE FALSE TRUE TRUE


# Use the sample function in R to randomly select 5 students' grades without replacement.
set.seed(12345)
x$not[
  sample(
    1:nrow(x),
    size = 5
  )
]

# If the set.seed line is not run in the code, different results will be obtained each time you run the study. However, if you include the set.seed line when running the code, the random values will always produce the same result.

# The values in the 'not' column for rows 1, 3 and 10
x$not[c(1, 3, 10)] # 3.22 2.48 2.16

# Calculate the mean of the values in the 'not' column for row 1, 3 and 10
mean(
  x$not[c(1, 3, 10)]
) # 2.62

# Find all students int he 3rd grade
x[
  x$sinif == 3,
]

# Find grades of all students in the 3rd grade
x$not[
  x$sinif == 3
]

# Calculating the average of the grades of all students in the 3rd grade
mean(
  x$not[
    x$sinif == 3
  ]
) # 2.459281

round(
  mean(
    x$not[
      x$sinif == 3
    ]
  ),
  digits = 2
) # 2.46
