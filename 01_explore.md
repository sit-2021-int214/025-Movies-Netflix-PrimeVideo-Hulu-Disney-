# Workshop 01 EDA: Movies_Netflix_PrimeVideo_Hulu_Disney+📌

Dataset from [Movies_Netflix_PrimeVideo_Hulu_Disney+.csv](../../Movies-Netflix-PrimeVideo-Hulu-Disney-original.csv)

**Created by Name-Surname (ID: xxxxxxxxxx)**

### My Step
1. Define a question
2. Loading Library and dataset
3. Observation of this dataset before cleaning
4. Cleaning dataset
5. Data Analysis with Descriptive Statistics

## Step 1: Define a question

1. หาค่าเฉลี่ยของ IMDb ว่ามีค่าเฉลี่ยเป็นเท่าไหร่ ?
2. หาค่าเฉลี่ยของ Rotten Tomatoes ว่ามีค่าเฉลี่ยเป็นเท่าไหร่ ?
3. ค่าเฉลี่ยของ  IMDb และ  Rotten Tomatoes รวมกันเป็นเท่าไหร่ ?
4. หาหนังที่อยู่ในปี 1990 - 2000 ว่ามีกี่เรื่อง ?
5. หนังแต่ละเรทอายุมีทั้งหมดกี่เรื่อง ?
6. หาหนังในประเทศ USA ทุกเรื่องที่ฉายมากกว่า 1 ภาษา ?
7. directors ที่ชื่อว่า A.L. Vijay กำกับหนังมาแล้วกี่เรื่องและเรื่องอะไรบ้าง ?


## Step 2: Loading library and dataset

```
# Library
library(readr)
library(dplyr)

# Dataset
movies <- read_csv("MoviesOnStreamingPlatforms_updated.csv")
```

## Step 3: Observation of this dataset before cleaning
```
glimpse(movies)
```

Result:
```
Rows: 9,515
Columns: 17
$ X               <int> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, ~
$ ID              <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,~
$ Title           <chr> "The Irishman", "Dangal", "David Attenborough: A Life ~
$ Year            <int> 2019, 2016, 2020, 2001, 2018, 2018, 2020, 2017, 2018, ~
$ Age             <chr> "18+", "7+", "7+", "7+", "18+", "13+", "13+", "13+", "~
$ IMDb            <chr> "7.8/10", "8.4/10", "9.0/10", "8.1/10", "7.7/10", "7.1~
$ Rotten.Tomatoes <chr> "98/100", "97/100", "95/100", "94/100", "94/100", "94/~
$ Netflix         <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ~
$ Hulu            <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
$ Prime.Video     <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
$ Disney.         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
$ Type            <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
$ Directors       <chr> "Martin Scorsese", "Nitesh Tiwari", "Alastair Fothergi~
$ Genres          <chr> "Biography,Crime,Drama", "Action,Biography,Drama,Sport~
$ Country         <chr> "United States", "India,United States,United Kingdom,A~
$ Language        <chr> "English,Italian,Latin,Spanish,German", "Hindi,English~
$ Runtime         <int> 209, 161, 83, 224, 52, 99, 94, 120, 133, 129, 130, 94,~
```

###

## Step 4: Cleaning dataset
```
movies$Age<- movies$Age%>%replace(is.na(movies$Age),"all")
movies$Directors <- movies$Directors%>%replace(is.na(movies$Directors),"UNKNOWN")
movies$IMDb<- movies$IMDb%>% replace(is.na(movies$IMDb),"0/10")
movies$`Rotten Tomatoes`<- movies$`Rotten Tomatoes`%>% replace(is.na(movies$`Rotten Tomatoes`),"0/100")
movies$Country<- movies$Country%>%replace(is.na(movies$Country),"UNKNOWN")
movies$Runtime<- movies$Runtime%>%replace(is.na(movies$Runtime),0)
movies$Genres <- movies$Genres%>%replace(is.na(movies$Genres),"UNKNOWN")
movies$Language <- movies$Language%>%replace(is.na(movies$Language),"UNKNOWN")
```
### Format Score ###
```
movies$`Rotten Tomatoes`<- movies$`Rotten Tomatoes`%>%str_remove("/100")%>%str_trim()%>%as.numeric()
movies$IMDb <- movies$IMDb%>% str_remove("/10")%>%str_trim()%>%as.numeric()
```
Result:
```
IMDb `Rotten Tomatoes`
<dbl>            <dbl>   
7.8               98     
8.4               97      
9                 95       
8.1               94      
7.7               94       
7.1               94       

```
### Explain:
- แก้ column Age ที่ไม่มีข้อมูลอายุ(NA) ให้เป็น "all" ทั้งหมด
- แก้ column Directors ที่ไม่มีผู้กำกับ(NA) ให้เป็น "UNKNOWN" ทั้งหมด
- แก้ column IMDb ที่ไม่มีคะแนน(NA) ให้เป็น "0/10" ทั้งหมด
- แก้ column Rotten Tomatoes ที่ไม่มีคะแนน(NA) ให้เป็น "0/100" ทั้งหมด
- แก้ column Country ที่ไม่ระบุประเทศ(NA) ให้เป็น "UNKNOWN" ทั้งหมด
- แก้ column Runtime ที่ไม่ระบุความยาวของหนัง(NA) ให้เป็น "0" ทั้งหมด
- แก้ column Genres ที่ไม่ระบุประเภทของหนัง(NA) ให้เป็น "UNKNOWN" ทั้งหมด
- แก้ column Language ที่ไม่ระบุภาษาของหนัง(NA) ให้เป็น "UNKNOWN" ทั้งหมด

## Step 5: Data Analysis with Descriptive Statistics

### 5.1. หาค่าเฉลี่ยของ IMDb ว่ามีค่าเฉลี่ยเป็นเท่าไหร่ ?
```
IMDb_avg<-(movies%>% select(IMDb)%>% filter(movies$IMDb>0)%>%sum() ) / count(movies)
```
Result:```6.023027```

ค่าเฉลี่ยของ IMDb มีค่าเท่ากับ 6.023027

### 5.2. หาค่าเฉลี่ยของ Rotten Tomatoes ว่ามีค่าเฉลี่ยเป็นเท่าไหร่ ?
```
rotten_avg<-(movies%>% select(`Rotten Tomatoes`)%>% filter(movies$`Rotten Tomatoes`>0)%>%
sum() ) / count(movies)
```
Result:```53.50562```

ค่าเฉลี่ยของ Rotten Tomatoes มีค่าเท่ากับ 53.50562

### 5.3. ค่าเฉลี่ยของ  IMDb และ  Rotten Tomatoes รวมกันเป็นเท่าไหร่ ?
```
avg<-(rotten_avg+(IMDb_avg*10))/2
```
Result:```56.86795```

ค่าเฉลี่ยของ IMDb และ Rotten Tomatoes รวมกันมีค่าเท่ากับ 56.86795

### 5.4. หาหนังที่อยู่ในปี 1990 - 2000 ว่ามีกี่เรื่อง ?
```
movie_90 <- movies%>%select(Year)%>%filter(movies$Year<=2000 & movies$Year>=1990)%>%count()
```
Result:```582```

หนังที่อยู่ในปี 1990 - 2000 มีทั้งหมด 582 เรื่อง

### 5.5.  หนังแต่ละเรทอายุมีทั้งหมดกี่เรื่อง ?
```
movies%>% select(Age) %>% table()
```
Result:
```
13+   16+   18+   7+    all
998   276   2276  1090  4875
```
หนังที่อยู่ในเรทอายุ 13+ มี 998 เรื่อง หนังที่อยู่ในเรทอายุ 16+ มี 276 เรื่อง หนังที่อยู่ในเรทอายุ 18+ มี 2276 เรื่อง หนังที่อยู่ในเรทอายุ 7+ มี 1090 เรื่อง และ หนังที่สามารถดูได้ทุกวัย มี 4875 เรื่อง

### 5.6. หาหนังในประเทศ USA ทุกเรื่องที่ฉายมากกว่า 1 ภาษา ?
```
table(grepl("United States",movies$Country)& grepl(",",movies$Language) )
```
Result:
```
FALSE   TRUE
8463    1052
```
หนังในประเทศ USA ที่ฉายมากกว่า 1 ภาษามีอยู่ 1052 เรื่อง

### 5.7. directors ที่ชื่อว่า A.L. Vijay กำกับหนังมาแล้วกี่เรื่องและเรื่องอะไรบ้าง ?
```
director<-movies %>% select(Title,Directors)%>%filter(movies$Directors =="A.L. Vijay")

director%>% count()
```
Result:```Director = 3```
```
Title               Directors
Thaandavam          A.L. Vijay
Deiva Thirumagal    A.L. Vijay
Abhinetri No. 1     A.L. Vijay
```
directors ที่ชื่อว่า A.L. Vijay กำกับหนังมาแล้ว 3 เรื่อง ได้แก่ 1.Thaandavam  2. Deiva Thirumagal 3. Abhinetri No. 1 
