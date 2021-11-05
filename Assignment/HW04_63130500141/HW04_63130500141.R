# Library
library(dplyr)
library(stringr)
library(readr)
library(ggplot2)


# Dataset
superstore <- read_csv("train.csv")


# View Dataset
View(superstore)
glimpse(superstore)
summary(superstore)
superstore <- as_tibble(superstore)

#coding Part 2-3
superstore %>% select(`Product Name`,`Category`,`Sub-Category`) %>% filter(`Sub-Category` == "Phones")

superstore %>% select (`Product Name`,`Category`,`Sales`) %>% arrange(Sales)

superstore %>% slice_tail(n=5)

superstore %>% summarize(mean = mean(Sales), max = max(Sales), min = min(Sales))

superstore %>% count(Total_State = State) %>% arrange(desc(n))

superstore %>% select(`Product Name`, `Category`, `Sub-Category`, `Sales`) %>% filter(Sales>= 5000, Sales<= 15000, `Sub-Category` == "Machines")

bought_by_Staavos <- superstore %>% select(`Order ID`, `Product Name`, `Category`) %>% filter(superstore$`Customer Name`== "Noel Staavos")

bought_by_Staavos %>% count() 

bought_by_Staavos %>% select(`Order ID`, `Product Name`, `Category`)

superstore %>% group_by(`Sub-Category`) %>% count() %>% arrange(n)


#graph

data1 <- superstore %>% 
  select(`Product Name`, `Category`, `Sub-Category`, `Sales`) %>%
  filter(Sales>= 5000, Sales<= 15000, `Sub-Category` == "Machines")

bargraph <- table(data1$`Product Name`)
barplot(bargraph,main = "Machines product that sales more than 5000 pieces and less than 15000 pieces ", 
        xlab = "Product Name", col = c("pink","blue","green","gray"))


data2 <- table(superstore$`Sub-Category`)
barplot(data2,main = "How many product that been sold ", xlab = "Category", ylab = "Sold by", col = c("red","blue","green","orange","lightblue","yellow","violet","grey"))
