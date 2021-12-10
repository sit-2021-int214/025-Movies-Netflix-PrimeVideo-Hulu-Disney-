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
comedy<-data.frame(variance=var(sample_comedy$score),mean=mean(sample_comedy$score))

#Variance:1.192355 
#Mean:5.732800 
```
### Drama
```
drama<-data.frame(variance=var(sample_drama$score),mean=mean(sample_drama$score))


#Variance:1.170136
#Mean:5.910280 
```
### 3.4 คำนวณหา T-test
```
t_score<- (drama$mean-comedy$mean)/ sqrt(drama$variance/2500+comedy$variance/2500)
# T-score : 5.773435
```
### 3.5 หาค่า P-value ของ t
```
t_area<- pt(t_score,2499)

p-value: 0.9999
```
### 3.6 หาค่า critical value โดย alpha=0.05
```
t_alpha<- qt(0.05,2499)

critical value: -1.645464
```


## Step 4 สรุป
### สรุปด้วย P-value
```
if(t_area<0.05){
  print("reject H0")
}else{
  print("not reject H0")
}
```
## Result
```
"not reject H0"
```
### สรุปด้วย Critical value
```
if(t_alpha>t_score){
  print("reject H0")
}else{
  print("not reject H0")
}
```
## Result
```
"not reject H0"
```
