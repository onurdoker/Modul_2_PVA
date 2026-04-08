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

# Changing the class information if the 3th grade studens in the dataset to 4th grade
x2 <- x
x2$sinif[
  x2$sinif == 3
] <- 4

# Creating a new dataset by excluding the 1st grade students
x3 <- x[
  x$sinif != 1,
]
View(x3)

x3_2 <- x[
  x$sinif %in% c(2, 3, 4),
]
View(x3_2)

# Determining how many students named Ali are in the dataset
sum(
  x$isim == 'Ali'
) # 22

# Calculating the average of the grade of all students named Ali
mean(
  x$not[
    x$isim == 'Ali'
  ]
) # 2.739545

round(
  mean(
    x$not[
      x$isim == 'Ali'
    ]
  ),
  digits = 2
) # 2.74

# all students whose name is Ali
x[
  x$isim == 'Ali',
]

# all students who are in the 4th grade
x[
  x$sinif == 4,
]

# all students who are in the 4th grade and whose name is Ali
x[
  x$isim == 'Ali' & x$sinif == 4,
]

# Finding the count of the students who are in the 4th grade and whose name is Ali
sum(
  x$isim == 'Ali' & x$sinif == 4
) # 8

#  Calculating the average grade of students who are 4th grade and whose name is Ali
mean(
  x$not[
    x$isim == 'Ali' & x$sinif == 4
  ]
) # 2.60875

round(
  mean(
    x$not[
      x$isim == 'Ali' & x$sinif == 4
    ]
  ),
  digits = 2
) # 2.61

# Identify the students who are in the 3rd or 4th grade in the dataset
x[
  x$sinif == 3 | x$sinif == 4,
]

x[
  x$sinif %in% c(3, 4),
]


# Calculating the average of the grades of students in the dataset for 2-usual value interval
# mean(not) ± (2*sd(not))
sum(
  x$not < mean(x$not) - (2 * sd(x$not)) | x$not > mean(x$not) + (2 * sd(x$not))
) # 48

x4 <- x[
  x$not < mean(x$not) - (2 * sd(x$not)) | x$not > mean(x$not) + (2 * sd(x$not)),
]
View(x4)

save.image(file = "lesson03.RData")
