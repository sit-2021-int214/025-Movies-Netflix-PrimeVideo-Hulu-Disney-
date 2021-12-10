### test test
## Step 1 กำหนดโจทย์

## Step 2 ตั้งสมมติฐาน

## Step 3 ทดสอบสมมติฐาน

### 3.1 เลือกข้อมูลตามประเภทของหนัง
### Comedy
```
allComedy <-movies%>%filter(!is.na(str_extract(Genres,"Comedy")))%>%select(IMDb,Rotten.Tomatoes/10)
allComedy<-allComedy%>%mutate(usable=((allComedy$Rotten.Tomatoes/10)+allComedy$IMDb)/2)
allComedy<- data.frame(score=allComedy$usable)
```
### Drama
```
allDrama<- movies%>%filter(!is.na(str_extract(Genres,"Drama")))%>%select(IMDb,Rotten.Tomatoes/10)
allDrama<-allDrama%>%mutate(usable=((allDrama$Rotten.Tomatoes/10)+allDrama$IMDb)/2)
allDrama<- data.frame(score=allDrama$usable)
```
### 3.2 สุ่ม sample จากชุดข้อมูลมาชนิดละ 2500 record
#Comedy
```
sample_comedy<-allComedy%>%sample_n(2500)
```
### Drama
```
sample_drama<- allDrama%>%sample_n(2500)
```
### 3.3 คำนวณหา variance และ mean ของแต่ละชนิด
### Comedy
```
comedy<-var(sample_comedy)
comedy<-c(variance=comedy,mean=mean(sample_comedy$score))
#Variance:1.192355 
#Mean:5.732800 
```
### Drama
```
drama<-var(sample_drama)
drama<-c(variance=drama,mean=mean(sample_drama$score))

#Variance:1.170136
#Mean:5.910280 
```




## Step 4 สรุป

