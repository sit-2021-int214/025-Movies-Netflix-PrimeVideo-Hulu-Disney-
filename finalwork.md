### test test
## Step 1 กำหนดโจทย์

## Step 2 ตั้งสมมติฐาน

## Step 3 ทดสอบสมมติฐาน

### - เลือกข้อมูลตามประเภทของหนัง
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


## Step 4 สรุป

