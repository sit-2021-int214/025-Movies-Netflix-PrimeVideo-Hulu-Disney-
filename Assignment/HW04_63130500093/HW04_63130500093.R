install.packages("dplyr")
install.packages("readr")
install.packages("ggplot2")
install.packages("stringr")
install.packages("tidyr")


library(tidyr)
library(dplyr)
library(readr)
library(ggplot2)
library(stringr)


book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
book %>% glimpse()
View(book)



# learn tidyverse
book %>% select(Book_title,Reviews) %>% filter(Reviews>10) %>% arrange(desc(Reviews))
book$Type%>%is.na()%>% any()


#1
book%>% select(Number_Of_Pages,Type)%>% filter(Number_Of_Pages>300)%>%select(Type) %>% table()


#2
book%>%mutate(PriceEachPage=Price/Number_Of_Pages)

book%>%glimpse()

#3
book%>% filter(Reviews<=1)%>% select(Book_title,Rating,Reviews,Price)%>%arrange(desc(Rating))


#4
book%>%group_by(Type)%>%summarise(avg=mean(Rating))



#graph1
showPlot <- book%>%ggplot(aes(x=Rating,y=Number_Of_Pages))+geom_point()
showPlot

#graph2
outlier2 <-book%>% ggplot(aes(x=Rating)) +geom_histogram(binwidth = 0.1)+
  stat_bin(aes(y=..count.., label=..count..), geom="text", vjust=-5) 
outlier2

