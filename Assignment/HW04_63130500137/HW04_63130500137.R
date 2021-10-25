# Library
library(dplyr)
library(stringr)
library(readr)
library(ggplot2)

# Dataset
superstoreSales <- read_csv("superstoreSales.csv")
View(superstoreSales)
glimpse(superstoreSales)

#Learning function from Tidyverse
superstoreSales %>% select_if(is.numeric)

superstoreSales %>% 
  select(`Product ID`,Category, `Sub-Category`) %>% 
  mutate(Category_Sub = paste(Category,`Sub-Category`,sep =   "_"))

superstoreSales %>% select(`Product Name`,Sales) %>% 
  filter(Sales > 10000) %>% arrange(desc(Sales))

#1
superstoreSales %>% select(`Product Name`,`Ship Date`) %>% filter(`Ship Date` == "14/06/2015")
#2
superstoreSales %>% group_by(`Category`) %>% summarise(Sales = sum(Sales, na.rm = TRUE))
#3
superstoreSales %>% select(`Product ID`,`Product Name`,`Category`,Sales) %>% filter(Sales > 5000 & Sales < 10000) %>% arrange(Sales)
#4
product_of_Brosina <- superstoreSales %>% select(`Product ID`,`Product Name`,Sales)%>% filter(superstoreSales$`Customer Name`== "Brosina Hoffman")

product_of_Brosina

product_of_Brosina %>% count()%>% rename(`Number of products` = n) 

product_of_Brosina %>% summarise(Total_Sales = sum(Sales, na.rm = TRUE))
#5
superstoreSales %>% select(`Customer Name`,City,State) %>% 
  filter(superstoreSales$Sales == max(superstoreSales$Sales))

# Visualization with GGplot2
#1
Sales_volume_by_category <- table(superstoreSales$`Category`)
Sales_volume_by_category
barplot(Sales_volume_by_category,main = "Sales volume by category", xlab = "Category", ylab = "Sales volume", col = c("lightgreen","pink","lightblue"))
#2
Sale_by_region <- superstoreSales %>% group_by(Region) %>% 
  summarise(SumSales = sum(Sales),SumSales1000USD = SumSales/1000) %>% 
  ggplot(aes(x=Region, y= SumSales1000USD))+
  geom_point(aes(color= Region)) 

Sale_by_region +ggtitle ("Sales by region")



