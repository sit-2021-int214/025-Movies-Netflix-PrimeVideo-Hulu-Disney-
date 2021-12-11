
## Step 1 กำหนดโจทย์

## Step 2 ตั้งสมมติฐาน

## Step 3 ทดสอบสมมติฐาน
### 3.1 ประกาศตัวแปร
```
num_comedy<-234
n<-780
alpha <0.05
p0<- 0.31

```
### 3.2 คำนวณหา P-bar
```
se_of_p<- sqrt(p0*(1-p0)/n)
p_bar<- num_comedy/n

p_bar : 0.3
```
### 3.3 คำนวณหาค่า z
```
z<- (p_bar-p0)/se_of_p

z : -0.6038679
```
### 3.4 หา P-value ของ z
```
p_value<- pnorm(z)

p_value: 0.2729658

```
### 3.5 หา critical value ของ alpha
```
critical_value<- qnorm(0.05/2)

critical_value : -1.959964
```

## Step 4 สรุป
### สรุปด้วย P-value
```
if(p_value*2<0.05){
  print("reject H0")
}else{
  print("accept H0")
}
```
## Result
```
"accept H0"
```
### สรุปด้วย Critical value
```
if(critical_value>p_value){
  print("reject H0")
}else{
  print("Accept H0")
}
```
## Result
```
"accept reject H0"
```
