#PART1
#library
library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

#explore dataset
sale <- read_csv("E:/Document/INT214/R project/train.csv")

View(sale)

#PART2
#rename
sale <- sale %>% rename(no = `Row ID`)
sale <- sale %>% rename(order_id = `Order ID`)
sale <- sale %>% rename(order_date = `Order Date`)
sale <- sale %>% rename(ship_date = `Ship Date`)
sale <- sale %>% rename(ship_mode = `Ship Mode`)
sale <- sale %>% rename(customer_id = `Customer ID`)
sale <- sale %>% rename(customer_name = `Customer Name`)
sale <- sale %>% rename(postal_code = `Postal Code`)
sale <- sale %>% rename(product_id = `Product ID`)
sale <- sale %>% rename(sub_category = `Sub-Category`)
sale <- sale %>% rename(product_name = `Product Name`)

glimpse(sale)

#distinct
sale %>% distinct(customer_name, .keep_all = FALSE) 

#slice 
sale %>% slice(2:5)

#sample
s_sample <- sale %>% sample_n(6) %>% select(customer_id,order_date,product_name,Sales)

#top_nØ
sale %>% top_n(5, no)

#tally
sale %>% group_by(sub_category) %>% tally()


#PART3
#Question
#1
sale %>% distinct(customer_name,customer_id, .keep_all = FALSE) 

#2 
sale %>% top_n(10, Sales) %>% select(no,customer_name,product_name,Sales)

#3 
sale %>% filter(Category == "Technology" , City == "Henderson") %>% select(product_id,product_name,sub_category,City)

#4
sale %>% filter(postal_code >= 94000 , Sales >= 2000 ) %>% select(City,postal_code,product_name,Sales)

#5 
sale %>% select(customer_name, product_name, Category) %>% filter(customer_name =="Joseph Airdo")

#6 
sale %>% group_by(ship_mode) %>% count()



#PART4
#ggplot
sale %>% filter(State=="Texas") %>% ggplot(aes(x= Category)) + geom_bar() + ggtitle("the Amount of product's category that has sale in Texas") + ylab("Amount")


sale %>% ggplot(aes(x=State , y=Sales)) + geom_point()

#from the second graph what are the 2 outliers
sale %>% filter(Sales > 15000) %>% select(State, Sales)








