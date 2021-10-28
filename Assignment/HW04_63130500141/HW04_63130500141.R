# Library
library(dplyr)
library(stringr)
library(readr)
library(ggplot2)


# Dataset
superstoreSales <- read_csv("train.csv")


# View Dataset
View(superstoreSales)
glimpse(superstoreSales)
summary(superstoreSales)
superstoreSales <- as_tibble(superstoreSales)

#
superstoreSales %>% select(`Product Name`,`Category`,`Sub-Category`) %>% filter(`Sub-Category` == "Phones")

superstoreSales %>% select (`Product Name`,`Category`,`Sales`) %>% arrange(Sales)
