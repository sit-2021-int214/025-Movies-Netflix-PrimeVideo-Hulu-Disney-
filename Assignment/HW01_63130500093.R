#1.Finding the average, sum, median, sd, variance of 10.4, 5.6, 3.1, 6.4, 21.7

data <- c(10.4,5.6,3.1,6.4,21.7)
#Average = 9.44
print(mean(data))
#sum = 47.2
print(sum(data))
#median = 6.4
print(median(data))
#sd = 7.33846
print(sd(data))
#Variance = 53.853
print(var(data))

name <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
          "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
          "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
          "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
          "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
          "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)
#2.1. Create data structure in variable 
#named marvel_movies and explain why you using this data structure ?

# Answer -> using dataframe to collect these data because these are ranking pair (moviesname,Years)

marvel_movies <- data.frame(name,years)
View(marvel_movies)
#2.2
#The numbers of movies
#Answer -> 27
print(length(names))
#Find the 19th movies name
#Answer -> Avengers: Infinity War
print(names[19])
#Which year is most released movies
# 2017,2021
uyear <- unique(years)
frequence <- match(years,uyear)
cfrequence <- tabulate(frequence)
print(years[sum(cfrequence[1:which.max(cfrequence)])])


