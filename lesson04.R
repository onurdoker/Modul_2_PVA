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

# calling tidyverse
library(tidyverse)


install.packages('nycflights13')
library(nycflights13)

View(flights)

''
'
DATA TRANSFORMATION

For data transformation, we use five main functions available in the dplyr package:
  - filter () : Selecting observations based on values
  - arrange () : Reordering rows
  - select () : Selecting variables by name
  - mutte () : Deriving new variables from existing variables
  - summarize () : Converting multiple values into a summary value
'
''

# Filtering flights that occurred on January 1st
filter(
  flights,
  month == 1,
  day == 1
) # 842 flights

# Filtering flights that occurred on December 25th
filter(
  flights,
  month == 12,
  day == 25
) # 719 flights

# Filtering all flights that occurred in November and December
filter(
  flights,
  month == 11 | month == 12
) # 55403 flights

filter(
  flights,
  month %in% c(11, 12)
) # 55403 flights

# Filtering all flights with a delay of under two hours

filter(
  flights,
  !(dep_delay > 120) | !(arr_delay) > 120
) # 320060 flights

filter(
  flights,
  dep_delay <= 120 | arr_delay <= 120
) # 320060 flights

# Filtering all flights with an arrival delay exceeding two hours
filter(
  flights,
  arr_delay >= 120
) # 10200 flights

# Filtering all flights to Houston (AIH or HOU)
filter(
  flights,
  dest == 'AIH' | dest == 'HOU'
) # 2115 flights

filter(
  flights,
  dest %in% c('AIH', 'HOU')
) # 2115 flights

# Filtering all flights operated by United, Delta and American Airlines
airlines[grepl('United|American|Delta', airlines$name), ]

filter(
  airlines,
  grepl('United|American|Delta', name)
)

filter(
  flights,
  carrier %in% c('AA', 'DL', 'AU')
) # 80839 flights

# Filtering all flights deparing in July, August and September
filter(
  flights,
  month >= 7,
  month <= 9
) # 86326 flights

filter(
  flights,
  month %in% c(7:9)
) # 86326 flights

filter(
  flights,
  month %in% c(7, 8, 9)
) # 86326 flights

# Filtering all flights de departure delay and an arrival delay greater than two hours
filter(
  flights,
  dep_delay == 0 & arr_delay > 120
) # 3 flights

# How many flights have an NA value for departure delay
filter(
  flights,
  is.na(dep_delay)
)

# Sort the flight information
arrange(
  flights,
  year,
  month,
  day
)

# Sorting the flights by departure delay
arrange(
  flights,
  desc(dep_delay)
)

# Sorting the flights from fastest to the slowest
arrange(
  flights,
  desc(
    distance / air_time
  )
)

# Create a new dataset that contains only the data we want, from the original dataset
select(
  flights,
  year,
  month,
  day
)

select(
  flights,
  year:day
)

# Appending new data to the end of the dataset
#
flights_sml <- select(
  flights,
  year:day,
  dep_delay,
  arr_delay,
  distance,
  air_time
)
mutate(
  flights_sml,
  gain = dep_delay - arr_delay,
  speed = distance / air_time * 60
)

# Summarising the flights by arrival delay
summarise(
  flights,
  delay = mean(
    dep_delay,
    na.rm = TRUE
  )
) # 12.6

# Summarizing the flights for each day, based on arrival delay
by_day <- group_by(
  flights,
  year,
  month,
  day
)
summarise(
  by_day,
  delay = mean(
    dep_delay,
    na.rm = TRUE
  )
) # summarise with 365 lines

save.image(file = "lesson04.RData")
