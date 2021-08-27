# Example 0
x <- 1
y <- 2
print(x+y) #3f
#1
v9 <- c(10.4, 5.6, 3.1, 6.4, 21.7)
mean(v9) #9.44
sum(v9) #47.2
median(v9) #6.4
sd(v9) #7.33846
var(v9) #53.853



#2.1
# List of Marvel movies (Order by Marvel Phase released)

marvel_movies <- list(names,years)
marvel_movies <- data.frame(names,years)

names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)
#2.2
#1
length(marvel_movies$names) #27
#2 
marvel_movies$names[19] #"Avengers: Infinity War"
#3
# ปีที่มีหนังออกมาเยอะสุดคือ  2017 กับ 2021
max(marvel_movies$years) #2021