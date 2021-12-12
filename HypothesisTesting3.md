# Hypothesis testing 
## Step 1 กำหนดโจทย์

## Step 2 ตั้งสมมติฐาน
```
Ho : μ >= 93
Ha : μ < 93
```
## Step 3 ทดสอบสมมติฐาน
### 3.1 ประกาศตัวแปร
```
runtime <- movies%>%filter(!is.na(Runtime))%>%select(Runtime)
mu<- 93
sd<- sqrt(var(runtime$Runtime))
n<- length(runtime$Runtime)
x_bar <- mean(runtime$Runtime)


```
### 3.2 คำนวณหา t testing
```
t<- (x_bar-mu)/(sd/sqrt(n))

t: -2.862088
```
### 3.3 คำนวณหาค่า P-value
```
t_area<- pt(t,n-1)

area: 0.002108893
```
### 3.4 หา critical value ของ alpha
```
critical_value <- qt(0.05,n-1)

critical value: -1.645014

```


## Step 4 สรุป
### สรุปด้วย P-value
```
if(t_area< 0.05){
  print("reject H0")
}else{
  print("accept H0")
}
```
## Result
```
"reject H0"
```
### สรุปด้วย Critical value
```
if(critical_value> t){
  print("reject H0")
}else{
  print("accept H0")
}
```
## Result
```
"reject H0"
```
