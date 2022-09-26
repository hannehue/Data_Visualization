# Practice 1 (but actually 2)
currentYear<-2022
startedUni<-2020
born<-1999
currentstarted<-currentYear - startedUni
print(currentstarted)
currentborn<-currentYear - born
print(currentborn)
divided<-currentstarted / currentborn
print(divided)
percent<-divided * 100
print(percent)

# Practice 2 (look practice 1)

# Pactice 3
vectorA=c(4, 5, 8, 11)
print(vectorA)
sum(vectorA)
vectorA[4]


# Practice 4
randomDataSet = rnorm(n = 1000, mean = 10, sd = 1.4)
# print(randomDataSet)

# Practice 5
plot(randomDataSet)

hist(randomDataSet)

# Practice 6

help(sqrt)
?sqrt

# Practice 7 (Look at HyggeRScript.R)

# Practice 8

P = c(seq(from=31, to=60))

Q = matrix(data=c(seq(from=31, to=60)), nrow = 6, ncol = 5)
Q[,1]
Q[3,]


# Practice 11

dates = c(today = Sys.Date(), christmas=(as.Date("2022-12-24")), 
          birthday=as.Date("1999-09-14"))

gifts = sample(0 : 1000, 3)

giftsPerDate = data.frame(x = dates, y = gifts)

plot(giftsPerDate, type="h")


# Practice 12

library(readr)

Salaries_CSV = read_csv("/home/hannehue/Desktop/Data_Visualization/SalariesDataset/Salaries.csv")
View(Salaries_CSV)

# Practice 13

Salaries_TSV = read_tsv("/home/hannehue/Desktop/Data_Visualization/SalariesDataset/Salaries.txt")
View(Salaries_TSV)

# Practice 14 

library(readxl)
Salaries_EXCEL = read_excel("/home/hannehue/Desktop/Data_Visualization/SalariesDataset/Salaries.xlsx")
