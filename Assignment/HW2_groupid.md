# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) หาแมวเพศผู้และเพศเมียว่ามีอย่างละกี่ตัว
```{R}
table(cats$sex)
```

2.) มีจำนวนนักศึกษาแต่ละคนสูบบุหรี่ปริมาณเท่าไหร่
```{R}
summary(survey$Smoke)
```

3.) อายุเฉลี่ยของนักศึกษา
```{R}
mean(survey$Age)
```

4.) นักศึกษาที่มีความสูงมากสุดคือเท่าไหร่
```{R}
max(survey$Height,na.rm=TRUE)
```

5.) ค่าเฉลี่ยของน้ำหนักตัวต่อน้ำหนักหัวใจของแมวเป็นเท่าไหร่
```{R}
ratio <- cats$Bwt/(cats$Hwt/1000)
mean(ratio)
```

6.) จำนวนนักศึกษาที่ออกกำลังกาย
```{R}
summary(survey$Exer)
```

7.) นักศึกษาส่วนใหญ่ถนัดมือข้างไหน และเป็นจำนวนเท่าไหร่
```{R}
length(grep("Freq", survey$Exer))+length(grep("Some", survey$Exer))
```
OR
```{R}
Exercises <- length(grep("Freq", survey$Exer))+length(grep("Some", survey$Exer))
Exercises
```

### Team: ภูอธิหทัยกชรัณ

1. ชื่อ นาย ภูนนท์ นามสกุล ศรีวรลักขณา    StudentID: 63130500093
2. ชื่อ นาย อธิติ  นามสกุล คงสบสิน    StudentID: 63130500128
3. ชื่อ นางสาว กชกร วงค์ทิพย์     StudentID: 63130500137
4. ชื่อ นาย ดรัณ มหาวนากูล     StudentID: 63130500141
5. ชื่อ นางสาว หทัยวรรณ เมฆวี     StudentID: 63130500160
