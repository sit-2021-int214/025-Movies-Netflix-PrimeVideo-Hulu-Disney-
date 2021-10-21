# 📌EDA: Movies_Netflix_PrimeVideo_Hulu_Disney+ 

Dataset from [Movies_Netflix_PrimeVideo_Hulu_Disney+.csv](../../Movies-Netflix-PrimeVideo-Hulu-Disney-original.csv)

### My Step ⚙️
1. Define a question 🛠
2. Loading Library and dataset 📡
3. Observation of this dataset before cleaning 🔦
4. Cleaning dataset 🧼
5. Data Analysis with Descriptive Statistics 📇

## Step 1: Define a question 🛠

1. หาค่าเฉลี่ยของ IMDb ว่ามีค่าเฉลี่ยเป็นเท่าไหร่ ?
2. หาค่าเฉลี่ยของ Rotten Tomatoes ว่ามีค่าเฉลี่ยเป็นเท่าไหร่ ?
3. ค่าเฉลี่ยของ  IMDb และ  Rotten Tomatoes รวมกันเป็นเท่าไหร่ ?
4. หาหนังที่อยู่ในปี 1990 - 2000 ว่ามีกี่เรื่อง ?
5. หนังแต่ละเรทอายุมีทั้งหมดกี่เรื่อง ?
6. หาหนังในประเทศ USA ทุกเรื่องที่ฉายมากกว่า 1 ภาษา ?
7. directors ที่ชื่อว่า A.L. Vijay กำกับหนังมาแล้วกี่เรื่องและเรื่องอะไรบ้าง ?


## Step 2: Loading library and dataset 📡

```
# Library
library(readr)
library(dplyr)

# Dataset
movies <- read_csv("MoviesOnStreamingPlatforms_updated.csv")
```

## Step 3: Observation of this dataset before cleaning 🔦
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
จำนวนข้อมูลเริ่มต้นมีทั้งหมด 9,515 rows และมีทั้งหมด 17 column
| ลำดับ | ชื่อคอลัมน์              | คำอธิบาย         
| :--: | -------------------- | -----------     
| 1    | X                 | ลำดับตัวเลขตั้งแต่ 0 - 9514 ซึ่งเป็นข้อมูลประเภท Numeric | 
| 2    | ID                | รหัสของหนังแต่ละเรื่อง ซึ่งเป็นข้อมูลประเภท Numeric | 
| 3    | Title             | ชื่อของหนังแต่ละเรื่อง ซึ่งเป็นข้อมูลประเภท Character | 
| 4    | Year              | ปีที่เริ่มฉายหนังแต่ละเรื่อง ซึ่งเป็นข้อมูลประเภท Numeric | 
| 5    | Age               | เรทอายุของหนังแต่ละเรื่อง ซึ่งเป็นข้อมูลประเภท Character | 
| 6    | IMDb              | คะแนน IMDb ของหนังแต่ละเรื่องที่มีคะแนนสูงสุดคือ 10 คะแนน ซึ่งเป็นข้อมูลประเภท Character | 
| 7    | Rotten.Tomatoes   | คะแนน Rotten.Tomatoes ของหนังแต่ละเรื่องที่มีคะแนนสูงสุดคือ 100 คะแนน ซึ่งเป็นข้อมูลประเภท Character | 
| 8    | Netflix           | platform ที่ฉายหนัง โดยถ้า Netflix มีการฉายหนังเรื่องนั้น ก็จะแสดงเลข 1 ซึ่งเป็นข้อมูลประเภท Numeric | 
| 9    | Hulu              | platform ที่ฉายหนัง โดยถ้า Hulu มีการฉายหนังเรื่องนั้น ก็จะแสดงเลข 1 ซึ่งเป็นข้อมูลประเภท Numeric | 
| 10    | Prime.Video       | platform ที่ฉายหนัง โดยถ้า Prime.Video มีการฉายหนังเรื่องนั้น ก็จะแสดงเลข 1 ซึ่งเป็นข้อมูลประเภท Numeric | 
| 11   | Disney.           | platform ที่ฉายหนัง โดยถ้า Disney. มีการฉายหนังเรื่องนั้น ก็จะแสดงเลข 1 ซึ่งเป็นข้อมูลประเภท Numeric | 
| 12   | Type              | บอกประเภทของหนังแต่ละเรื่องว่าเป็น movie หรือ series ถ้าเป็น movie จะแสดงเป็นเลข 0 ซึ่งเป็นข้อมูลประเภท Numeric | 
| 13   | Directors         | ผู้กำกับหนังแต่ละเรื่อง ซึ่งเป็นข้อมูลประเภท Character | 
| 14   | Genres            | ประเภทของหนังแต่ละเรื่อง ซึ่งเป็นข้อมูลประเภท Character | 
| 15   | Country           | ประเทศที่ไปสำรวจคะแนน IMDb และ คะแนน Rotten.Tomatoes มา ซึ่งเป็นข้อมูลประเภท Character | 
| 16   | Language          | ภาษาที่รองรับหนังในแต่ละเรื่อง เช่น ภาษาอังกฤษ ภาษาเกาหลี ซึ่งเป็นข้อมูลประเภท Character | 
| 17   | Runtime           | ระยะเวลาที่ฉายหนังเรื่องนั้น ซึ่งเป็นข้อมูลประเภท Numeric | 


## Step 4: Cleaning dataset 🧼
4.1 ลบ column Type ออก เพราะว่าข้อมูลในตารางเป็น type movie หมด จึงแสดงค่าเป็น 0 ทั้งหมด
```
movies <- select(movies,-c(Type))
```
4.2 ลบ column X ออก เพราะว่าเป็น column ที่แสดงลำดับเฉยๆ
```
movies<- select(movies,-c(...1))
```
4.3 แก้ column Age ที่ไม่มีข้อมูลอายุ(NA) ให้เป็น "all" ทั้งหมด
```
movies$Age<- movies$Age%>%replace(is.na(movies$Age),"all")
```
4.4 แก้ column Directors ที่ไม่มีผู้กำกับ(NA) ให้เป็น "UNKNOWN" ทั้งหมด
```
movies$Directors <- movies$Directors%>%replace(is.na(movies$Directors),"UNKNOWN")
```
4.5 แก้ column IMDb ที่ไม่มีคะแนน(NA) ให้เป็น "0/10" ทั้งหมด
```
movies$IMDb<- movies$IMDb%>% replace(is.na(movies$IMDb),"0/10")
```
4.6 แก้ column Rotten Tomatoes ที่ไม่มีคะแนน(NA) ให้เป็น "0/100" ทั้งหมด
```
movies$`Rotten Tomatoes`<- movies$`Rotten Tomatoes`%>% replace(is.na(movies$`Rotten Tomatoes`),"0/100")
```
4.7 แก้ column Country ที่ไม่ระบุประเทศ(NA) ให้เป็น "UNKNOWN" ทั้งหมด
```
movies$Country<- movies$Country%>%replace(is.na(movies$Country),"UNKNOWN")
```
4.8 แก้ column Runtime ที่ไม่ระบุความยาวของหนัง(NA) ให้เป็น "0" ทั้งหมด
```
movies$Runtime<- movies$Runtime%>%replace(is.na(movies$Runtime),0)
```
4.9 แก้ column Genres ที่ไม่ระบุประเภทของหนัง(NA) ให้เป็น "UNKNOWN" ทั้งหมด
```
movies$Genres <- movies$Genres%>%replace(is.na(movies$Genres),"UNKNOWN")
```
4.10 แก้ column Language ที่ไม่ระบุภาษาของหนัง(NA) ให้เป็น "UNKNOWN" ทั้งหมด
```
movies$Language <- movies$Language%>%replace(is.na(movies$Language),"UNKNOWN")
```
Result:
```
Rows: 9,515
Columns: 15
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
$ Directors         <chr> "Martin Scorsese", "Nitesh Tiwari", "Alastair Fot…
$ Genres            <chr> "Biography,Crime,Drama", "Action,Biography,Drama,…
$ Country           <chr> "United States", "India,United States,United King…
$ Language          <chr> "English,Italian,Latin,Spanish,German", "Hindi,En…
$ Runtime           <dbl> 209, 161, 83, 224, 52, 99, 94, 120, 133, 129, 130…

```
### Format Score ###
1. จัด format ของคะแนน Rotten Tomatoes โดยลบ /100 ที่เป็นคะแนนเต็มออก และเปลี่ยน datatype จาก character เป็น numeric
```
movies$`Rotten Tomatoes`<- movies$`Rotten Tomatoes`%>%str_remove("/100")%>%str_trim()%>%as.numeric()
```
2. จัด format ของคะแนน IMDb โดยลบ /10 ที่เป็นคะแนนเต็มออก และเปลี่ยน datatype จาก character เป็น numeric
```
movies$IMDb <- movies$IMDb%>% str_remove("/10")%>%str_trim()%>%as.numeric()
```
Result:
```
IMDb          `Rotten Tomatoes`
<dbl>               <dbl>   
7.8                  98     
8.4                  97      
9                    95       
8.1                  94      
7.7                  94       
7.1                  94       

```
## Step 5: Data Analysis with Descriptive Statistics 📇

### 5.1. อยากทราบว่าหนังที่ได้ทำการสำรวจมาทุกเรื่องมีค่าเฉลี่ยของคะแนน IMDb มีค่าเฉลี่ยเป็นเท่าไหร่ ?
```
IMDb_avg<-(movies%>% select(IMDb)%>% filter(movies$IMDb>0)%>%sum() ) / count(movies)
```
Result:```6.023027```

จากข้อมูลแสดงให้เห็นว่าหนังทุกเรื่องมีค่าเฉลี่ยของคะแนน IMDb เท่ากับ 6.023027

### 5.2. อยากทราบว่าหนังที่ได้ทำการสำรวจมาทุกเรื่องมีค่าเฉลี่ยของคะแนน Rotten Tomatoes มีค่าเฉลี่ยเป็นเท่าไหร่ ?
```
rotten_avg<-(movies%>% select(`Rotten Tomatoes`)%>% filter(movies$`Rotten Tomatoes`>0)%>%
sum() ) / count(movies)
```
Result:```53.50562```

จากข้อมูลแสดงให้เห็นว่าหนังทุกเรื่องมีค่าเฉลี่ยของคะแนน Rotten Tomatoes เท่ากับ 53.50562 

### 5.3. อยากทราบจำนวนหนังที่ฉายในปี ค.ศ.1990 - ค.ศ.2000 ว่ามีทั้งหมดกี่เรื่อง ?
```
movie_90 <- movies%>%select(Year)%>%filter(movies$Year<=2000 & movies$Year>=1990)%>%count()
```
Result:```582```

จากข้อมูลแสดงให้เห็นว่าจำนวนหนังที่ฉายในปี ค.ศ.1990 - ค.ศ.2000 มีทั้งหมด 582 เรื่อง

### 5.4.  เนื่องจากใน streaming platforms มีผู้ชมหลากหลายวัย จึงอยากทราบว่าเรทหนังแต่ละช่วงอายุมีจำนวนทั้งหมดกี่เรื่อง ?
```
movies%>% select(Age) %>% table()
```
Result:
```
13+   16+   18+   7+    all
998   276   2276  1090  4875
```
จากข้อมูลแสดงให้เห็นว่าเรทหนังที่อยู่ในช่วงอายุ 13+ มีทั้งหมด 998 เรื่อง 
                  เรทหนังที่อยู่ในช่วงอายุ 16+ มีทั้งหมด 276 เรื่อง 
                  เรทหนังที่อยู่ในช่วงอายุ 18+ มีทั้งหมด 2276 เรื่อง 
                  เรทหนังที่อยู่ในช่วงอายุ 7+ มีทั้งหมด 1090 เรื่อง 
                  และ เรทหนังที่สามารถดูได้ทุกวัย มีทั้งหมด 4875 เรื่อง

### 5.5. จากประเทศที่ไปสำรวจมาเราอยากทราบว่าประเทศ USA มีหนังที่รองรับมากกว่า 1 ภาษาอยู่กี่เรื่อง ?
```
table(grepl("United States",movies$Country)& grepl(",",movies$Language) )
```
Result:
```
FALSE   TRUE
8463    1052
```
จากข้อมูลแสดงให้เห็นว่าในประเทศ USA ที่เราทำการสำรวจมานั้นมีหนังที่รองรับมากกว่า 1 ภาษามีอยู่ 1,052 เรื่อง ซึ่ง TRUE คือหนังที่รองรับได้หลายภาษา และ FALSE คือหนังที่รองรับได้ภาษาเดียวหรืออยู่ในประเทศอื่น

### 5.6. อยากทราบว่าผู้กำกับที่มีชื่อว่า A.L. Vijay กำกับหนังมาแล้วกี่เรื่องและเรื่องอะไรบ้าง ?
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
จากข้อมูลแสดงให้เห็นว่าผู้กำกับที่ชื่อว่า A.L. Vijay กำกับหนังมาแล้ว 3 เรื่อง 

ได้แก่    1.Thaandavam   2. Deiva Thirumagal   3. Abhinetri No. 1 
