# Mathematical operations in R
5 + 2
7 * 3
21 - 6
15 / 3

a <- 1
a + 2

a <- 2
a

#
ls()

die <- 1:6

# Element wise execution
die - 1 # 0 1 2 3 4 5
die / 2 # 0.5 1 1.5 2 2.5 3
die * die # 1 4 9 16 25 36
die + 1:2 # 2 4 4 6 6 8
die + 1:4 # 2 4 5 8 6 8
2:3 + die # 3 5 5 7 7 9

# Functions
round(3.1415) # 3
factorial(3) # 6
mean(die) # 3.5
round(mean(die))

sample(x = 1:4, size = 2)
sample(
  x = 1:4,
  size = 2
)

# Example of rolling a die
sample(
  x = die,
  size = 1
)

# Looking at the arguments of the function
args(round) # function (x, digits = 0, ...)

# Example of rolling two dice
args(sample) # function (x, size, replace = FALSE, prob = NULL)
sample(
  die,
  size = 2,
  replace = TRUE
)

# calculate the sum of the two dice rolls (Long way)
dice <- sample(
  die,
  size = 2,
  replace = TRUE
)
sum(dice)

rm(die)
# creating function to roll two dice and return their sum
roll <- function() {
  die <- 1:6
  dice <- sample(
    die,
    size = 2,
    replace = TRUE
  )
  sum(dice)
}
roll() # get result

roll2 <- function() {
  die <- 1:6
  dice <- sample(
    die,
    size = 2,
    replace = TRUE
  )
  dice
}
roll2() # get results

roll3 <- function() {
  dice <- sample(
    die,
    size = 2,
    replace = TRUE
  )
  dice
}
roll3() # object 'die' not found


roll4 <- function(bones) {
  dice <- sample(
    bones,
    size = 2,
    replace = TRUE
  )
  dice
}
roll4() # argument "bones" is missing, with no default
roll4(bones = 1:6) # get results

roll5 <- function(bones = 1:6) {
  dice <- sample(
    bones,
    size = 2,
    replace = TRUE
  )
  dice
}
roll5() # get results
roll5(bones = 1:7) # get results

save.image(file = "lesson01.RData")
