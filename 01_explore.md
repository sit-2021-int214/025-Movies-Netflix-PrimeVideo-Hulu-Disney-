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

| ลำดับ | ชื่อคอลัมน์              | คำอธิบาย         |  เก็บข้อมูลในรูปแบบ         | ตัวอย่างข้อมูล                        |
| :--: | -------------------- | -----------     |  --------------------   | -------------------------------- |
| 1    | Index of Manga       | ลำดับของมังงะ     | ...1 = col_double()     | 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,... |
| 2    | Title                | ชื่อเรื่องของมังงะ   | Title = col_character() | "Berserk", "JoJo no Kimyou na Bouken Part 7: Steel Ball Run",... |
| 3    | Title_Synonym        | ชื่อเรียกแฝงของมังงะ| Title_Synonym = col_character()     | Doukyuusei ก็จะมีอีกชื่อเรียกว่า Classmates |
| 4    | Title_Japanese       | ชื่อเรื่องของมังงะแบบภาษาญี่ปุ่น   | Title_Japanese = col_character() | "ベルセルク", "ジョジョの奇妙な冒険 Part7 STEEL BALL RUN",... |
| 5    | Status               | มังงะเรื่องนี้มีสถานะเป็นอย่างไร (Finished=จบแล้ว / Publishing=อยู่ในระหว่างการตีพิมพ์ / On Hiatus=หยุดตีพิมพ์ชั่วคราว)    | Status = col_character()     | "Publishing", "Finished", "Publishing", "On Hiatus",… |
| 6    | Volumns              | จำนวนเล่มที่ตีพิมพ์จนจบ หากถ้าเกิดเรื่องไหนยังไม่จบ ช่องนี้จะมีค่าเป็น unknown   | Volumns = col_character() | "unkown", "24.0", "unkown", "37.0",… |
| 7    | Chapters        | จำนวนตอนของมังงะเรื่องนั้น ๆ จนจบ หากถ้าเกิดเรื่องไหนยังไม่จบ ช่องนี้จะมีค่าเป็น unknown| Chapters = col_character()     | "unkown", "96.0", "unkown", "327.0", "162.0", "116.0",... |
| 8    | Publishing       | ชื่อเรื่องของมังงะแบบภาษาญี่ปุ่น   | Publishing = col_logical() | TRUE, FALSE, TRUE, FALSE, FALSE,... |
| 9    | Rank        | อันดับของมังงะ โดยอิงจาก MAL(https://myanimelist.net)| Rank = col_double()     | 1, 2, 3, 4, 5, 6, 7, 8, 9,... |
| 10   | Score        | คะแนนของมังงะเรื่องนั้น ๆ โดย MAL(https://myanimelist.net)| Score = col_double()     | 9.39, 9.23, 9.15, 9.13, 9.10,...|
| 11   | Scored_by       | จำนวนคนที่โหวตให้กับมังงะเรื่องนั้น ๆ   | Scored_by = col_double() | 201756, 94427, 249936, 72613, 57801, 130375,... |
| 12   | Popularity       | อันดับความนิยมของผู้อ่าน   | Popularity = col_double() | 2, 29, 3, 19, 33, 16, 10,... |
| 13   | Memebers        | จำนวนผู้ใช้งานในเว็บไซต์ MAL(https://myanimelist.net) ที่เพิ่มมังงะเรื่องนั้นเข้าลิสต์มังงะที่อยากอ่าน (reading list) ของตนเอง| Memebers = col_double()     | 427894, 160782, 410522, 211345, 148764,... |
| 14   | Favorites        | จำนวนผู้ใช้งานในเว็บไซต์ MAL(https://myanimelist.net) ที่เพิ่มมังงะเรื่องนั้นเข้าลิสต์มังงะที่ชื่นชอบ (favorite list) ของตนเอง| Favorites = col_double()     | 80308, 27459, 82310, 21596, 13049,... |
| 15   | Synopsis       | เรื่องย่อของมังงะ   | Synopsis = col_character() | "Guts, a former mercenary now known as the \"Black... |
| 16   | Publish_period        | ช่วงเวลาที่ตีพิมพ์ ตั้งแต่เริ่มต้นถึงสิ้นสุด หากเรื่องไหนยังไม่จบจะเขียนตอนท้ายว่า to present| Publish_period = col_character()     | "Aug  25, 1989 to present", "Jan  19, 2004 to Apr  19, 2011",... |
| 17   | Genre       | ประเภทของมังงะเรื่องนั้น ๆ   | Genre = col_character() | Attack On Titan มีประเภทดังนี้ 'Action', 'Mystery', 'Drama', 'Fantasy', 'Shounen', 'Super Power', 'Military' |


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
Result:
```
Rows: 9,515
Columns: 17
$ ...1              <dbl> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,…
$ ID                <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15…
$ Title             <chr> "The Irishman", "Dangal", "David Attenborough: A …
$ Year              <dbl> 2019, 2016, 2020, 2001, 2018, 2018, 2020, 2017, 2…
$ Age               <chr> "18+", "7+", "7+", "7+", "18+", "13+", "13+", "13…
$ IMDb              <chr> "7.8/10", "8.4/10", "9.0/10", "8.1/10", "7.7/10",…
$ `Rotten Tomatoes` <chr> "98/100", "97/100", "95/100", "94/100", "94/100",…
$ Netflix           <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
$ Hulu              <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
$ `Prime Video`     <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
$ `Disney+`         <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
$ Type              <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
$ Directors         <chr> "Martin Scorsese", "Nitesh Tiwari", "Alastair Fot…
$ Genres            <chr> "Biography,Crime,Drama", "Action,Biography,Drama,…
$ Country           <chr> "United States", "India,United States,United King…
$ Language          <chr> "English,Italian,Latin,Spanish,German", "Hindi,En…
$ Runtime           <dbl> 209, 161, 83, 224, 52, 99, 94, 120, 133, 129, 130…
> 
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
