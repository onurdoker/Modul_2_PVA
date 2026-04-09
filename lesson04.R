# Importing a CSV file into R
x <- read.csv(
  'lesson02.csv',
  header = TRUE,
)
View(x)

# Select 10 students randomly without replacement from the dataset using the sample function, and then calculate the difference their average grade and the average gradeof the entire sample
mean_all <- mean(x$not) #2.58674
set.seed(12345)
mean_sample <- mean(
  x$not[
    sample(
      1:nrow(x),
      size = 10,
    )
  ]
) # 2.602
difference <- mean_all - mean_sample # -0.01526

# What percentage does the average obtained through sampling deviate from true average (the average grade all data)?
diff_percentage <- round(
  ((mean_all - mean_sample) / mean_all) * 100,
  digits = 2
) # -0.59%

# Calculating the difference between the average grade of the 1st grade and the average grade of the 4th
round(
  mean(
    x$not[x$sinif == 1]
  ) -
    mean(
      x$not[x$sinif == 4]
    ),
  digits = 2
) # 0.66

# Let the usual value interval for a variable be defined as Mean ± (2 * Standart Derivation). Accordingly, let's calculate the usual value internal for the third-grade scores using the scores dataset

lower_bound <- mean(
  x$not[
    x$sinif == 3
  ]
) -
  2 *
    sd(
      x$not[
        x$sinif == 3
      ]
    ) #1.361523

upper_bound <- mean(
  x$not[
    x$sinif == 3
  ]
) +
  2 *
    sd(
      x$not[
        x$sinif == 3
      ]
    ) # 3.557038

# Raporting process
paste0(
  round(
    lower_bound,
    digits = 2
  ),
  ' < not < ',
  round(
    upper_bound,
    digits = 2
  )
) # "1.36 < not < 3.56"

''
'
WORKING WITH MISSING DATA
Missing data problems frequently occur in data science. This happens when we do not know a value because the measurement was lost, corrupted, or simply never performed. The R language provides a way to help us manage these missing values. The NA character is a special symbol in R that stands for "Not Available" and can be used as a placeholder for missing data. R processes NA in a way that allows us to handle the missing information exactly as we intend.
'
''

# Any operation involving NA will result in NA
NA + 1 # NA
NA * 2 # NA
NA == 1 # NA

# Creating a vector that contains NA values
vec_na <- c(NA, 1:50)

# Calculation of the Mean of This Vector
mean(vec_na) #NA
mean(
  vec_na,
  na.rm = TRUE
) # 25.5

# Checking for NA values in a vector
NA == NA #NA
c(1, 2, 3, NA) == NA # NA NA NA NA
is.na(NA) # TRUE
is.na(
  c(1, 2, 3, NA)
) # FALSE FALSE FALSE TRUE
is.na(vec_na)

!is.na(NA) #FALSE
!is.na(
  c(1, 2, 3, NA)
) # TRUE  TRUE  TRUE FALSE

# Dropping NA values
vec_na[!is.na(vec_na)]

#
x_na <- x
set.seed(12345)
x_na$not[
  sample(
    1:nrow(x),
    size = 60,
    replace = FALSE
  )
] <- NA

mean(x_na) #NA

mean(
  x_na$not,
  na.rm = TRUE
) # 2.583266

round(
  mean(
    x_na$not,
    na.rm = TRUE
  ),
  digits = 2
) # 2.58

# Counting NA Values in the Dataset
sum(
  is.na(x_na$not)
) #60

# Exporting the NA-cleaned dataset to a new dataset

x2 <- x_na[
  !is.na(x_na$not),
]

''
'
TIDYVERSE
Tidyverse is a collection of packages developed for data science
'
''

# installing tidyverse
install.packages('tidyverse')
