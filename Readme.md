# R Programming Exercises

This repository contains R programming exercises from the Data Analysis School (Veri Analiz Okulu) - Module 2.

## Contents

### Lesson 1: Basic R Operations (`lesson01.R`)

This lesson covers fundamental R programming concepts:

- **Mathematical Operations**: Arithmetic operations (+, -, *, /)
- **Variables**: Creating and manipulating variables
- **Vectors**: Element-wise operations on vectors
- **Functions**: 
  - Built-in functions (round, factorial, mean, sample)
  - Creating custom functions
  - Function arguments and default values
- **Data Types**:
  - Atomic vectors (numeric, character, logical)
  - Lists
  - Data frames
- **Random Sampling**: Using `sample()` for random selection

**Key Functions Used**:
- `round()`: Round numbers to specified digits
- `factorial()`: Calculate factorial
- `mean()`: Calculate mean
- `sample()`: Random sampling with/without replacement
- `args()`: View function arguments

### Lesson 2: R Data Structures & Filtering (`lesson02.R`)

This lesson focuses on R data structures and data manipulation:

- **Exercises**:
  1. Sampling without replacement and computing square root of sum
  2. Sampling with replacement and calculating squared mean
  3. Circle area calculation from user input

- **Data Structures**:
  - Vectors (numeric, character, logical)
  - Lists (nested and complex structures)
  - Data Frames

- **Data Filtering**:
  - Row and column selection
  - Using negative indices to exclude rows/columns
  - Logical indexing
  - Column access via `$` operator
  - Creating and deleting columns

### Lesson 3: Data Analysis & Advanced Filtering (`lesson03.R`)

This lesson demonstrates advanced data filtering and analysis techniques:

- **Data Subsetting**: Extracting specific rows and columns
- **Logical Operators**:
  - Comparison operators (==, !=, >, <)
  - `%in%` operator for membership testing
  - `&` (AND) and `|` (OR) for compound conditions

- **Aggregations**:
  - Calculating means and medians
  - Filtering by class/grade
  - Filtering by name

- **Standard Score Analysis**: Identifying outliers using mean ± 2*sd

- **Reproducibility**: Using `set.seed()` for reproducible random sampling

### Lesson 4: Missing Data & Tidyverse (`lesson04.R`)

This lesson covers missing data handling and tidyverse data transformation:

- **Missing Data Handling**:
  - Understanding NA values in R
  - Checking for NA values using `is.na()`
  - Dropping NA values from vectors and data frames
  - Calculating means with `na.rm = TRUE`
  - Creating and cleaning datasets with missing values

- **Tidyverse Package**:
  - Installing and loading tidyverse
  - Working with the `nycflights13` dataset

- **Data Transformation Functions**:
  - `filter()`: Selecting observations based on values
  - `arrange()`: Reordering rows
  - `select()`: Selecting variables by name
  - `mutate()`: Deriving new variables from existing variables
  - `summarise()`: Converting multiple values into summary values
  - `group_by()`: Grouping data for aggregation

- **Flight Data Analysis**:
  - Filtering flights by date, month, day
  - Filtering by airlines and destinations
  - Filtering by delay times
  - Sorting flights by various criteria
  - Calculating new variables (gain, speed)
  - Summarizing statistics by day

**Key Functions Used**:
- `read.csv()`: Import CSV files
- `mean()`: Calculate mean with `na.rm = TRUE`
- `filter()`: Filter rows based on conditions
- `arrange()`: Sort rows
- `select()`: Select specific columns
- `mutate()`: Add new columns
- `summarise()`: Create summary statistics
- `is.na()`: Check for missing values
- `sample()`: Random sampling

## CSV Data File

- `lesson02.csv`: Student data file containing columns:
  - `isim`: Student names
  - `sinif`: Class/grade numbers (1-4)
  - `not`: Student grades/scores

## How to Run

To execute the R scripts:

```bash
# Using Rscript
Rscript lesson01.R
Rscript lesson02.R
Rscript lesson03.R
Rscript lesson04.R

# Or in RStudio
# Source each file:
source("lesson01.R")
source("lesson02.R")
source("lesson03.R")
source("lesson04.R")
```

## R Environment

After running the scripts, R data files are saved:
- `lesson01.RData`: Session data from Lesson 1
- `lesson02.RData`: Session data from Lesson 2
- `lesson03.RData`: Session data from Lesson 3
- `lesson04.RData`: Session data from Lesson 4

To load saved data in a new R session:
```r
load("lesson01.RData")
load("lesson02.RData")
load("lesson03.RData")
load("lesson04.RData")
```

## License

This project is part of the Data Analysis School curriculum.
