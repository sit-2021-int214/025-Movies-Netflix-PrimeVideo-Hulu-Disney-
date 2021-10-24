

library(readr)
library(dplyr)
library(assertive)
library(stringr)
movies <- read_csv("MoviesOnStreamingPlatforms_updated.csv")

# null correction
movies$Age<- movies$Age%>%replace(is.na(movies$Age),"all")
movies$Directors <- movies$Directors%>%replace(is.na(movies$Directors),"UNKNOWN")
movies$IMDb<- movies$IMDb%>% replace(is.na(movies$IMDb),"0/10")
movies$`Rotten Tomatoes`<- movies$`Rotten Tomatoes`%>% replace(is.na(movies$`Rotten Tomatoes`),"0/100")
movies$Country<- movies$Country%>%replace(is.na(movies$Country),"UNKNOWN")
movies$Runtime<- movies$Runtime%>%replace(is.na(movies$Runtime),0)
movies$Genres <- movies$Genres%>%replace(is.na(movies$Genres),"UNKNOWN")
movies$Language <- movies$Language%>%replace(is.na(movies$Language),"UNKNOWN")
# drop column TYPE
movies <- select(movies,-c(Type))
# drop column ..1
movies<- select(movies,-c(...1))
# format score
movies$`Rotten Tomatoes`<- movies$`Rotten Tomatoes`%>%str_remove("/100")%>%str_trim()%>%as.numeric()
movies$IMDb <- movies$IMDb%>% str_remove("/10")%>%str_trim()%>%as.numeric()

#null checking
print(any(is.na(movies$Age)))
print(any(is.na(movies$Directors)))
print(any(is.na(movies$IMDb)))

movies%>% select(Age)%>% filter(is.na(movies$Age))
movies%>% select(Age)%>% filter(movies$IMDb<5)

movies%>% select(movies$Title)
# duplicated check
movies%>%duplicated()%>% table()
#1
IMDb_avg<-(movies%>% select(IMDb)%>% filter(movies$IMDb>0)%>%sum() ) / count(movies)
print(IMDb_avg)
#2
rotten_avg<-(movies%>% select(`Rotten Tomatoes`)%>% filter(movies$`Rotten Tomatoes`>0)%>%sum() ) / count(movies)
print(rotten_avg)
#3
avg<-(rotten_avg+(IMDb_avg*10))/2
print(avg)
#4
movie_90 <- movies%>%select(Year)%>%filter(movies$Year<=2000 & movies$Year>=1990)%>%count()
print(movie_90)
#5
 movies%>% select(Age) %>% table()
#6
 #grepl ได้ true false
 #grep ได้ index
 #grep(l) (pattern, ค่าที่ตรวจสอบ)

 table(grepl("United States",movies$Country)& grepl(",",movies$Language) )
 #7
 director<-movies %>% select(Title,Directors)%>%filter(movies$Directors =="A.L. Vijay")
 print(director)
 director%>% count()

View(movies)
movies%>% head(6)
glimpse(movies)


#table แยกประเภท
movies$Netflix%>% table()

