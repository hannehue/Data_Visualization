library(tidyverse)
library(hrbrthemes)

rankings <- data.frame(
  q01 = formatted_data$q0001, # How masculine do you feel
  q02 = formatted_data$q0002, # How important is it, that others see you as masculine
  q18 = formatted_data$q0018, # How often do you try to be the one who pays when on a date
  q29 = formatted_data$q0029, # What is the last grade of school you completed
  stringsAsFactors = TRUE
  )

#### Checking what numbers mean
## Unnessecary after check
# numq29 <- sapply(rankings$q29, unclass)
# table(numq29)
# table(rankings$q29)


rank_num <- sapply(rankings, unclass)
# Meaning of numbers 
# q01 | 1 = No answer, 2 = Not at all masculine, 3 = Not very masculine, 4 = Somewhat masculine, 5 = Very masculine
# q02 | 1 = No answer, 2 = Not at all important, 3 = Not too important, 4 = Somewhat important, 5 = Very important
# q18 | 1 = Always, 2 = Never, 3 = No answer, 4 = Often, 5 = Rarely, 6 = Sometimes
# q29 | 1 = Associate's degree, 2 = College graduate, 3 = Did not complete highschool, 
# 4 = High school or G.E.D, 5 = Post graduate degree, 6 = Some college
rank_num <- data.frame(rank_num)

numeric_values <- data.frame(q01 = rank_num$q01, # How masculine do you feel
                             q02 = rank_num$q02, # How important is it, that others see you as masculine
                             q18 = rank_num$q18, # How often do you try to be the one who pays when on a date
                             q29 = rank_num$q29, # What is the last grade of school you completed
                             race = formatted_data$q0028,
                             earnings = formatted_data$q0034,
                             age = formatted_data$age3,
                             kids = formatted_data$kids,
                             stringsAsFactors = TRUE) 


ggplot(numeric_values, aes(q01, race)) +
  geom_point()
 

ggplot(numeric_values, aes(race, q01)) +
  geom_boxplot()


ggplot(numeric_values,aes(q02, q01)) +
  geom_count(color = "#E0912A") +
  scale_size_area(max_size = 20) +
  labs(
    y = "masculinity",
    x = "importance"
  )


ggplot(numeric_values, aes( x = q01, group = race, fill = race,)) +
  geom_density(adjust = 1, alpha = 0.3) +
  facet_wrap(~race)

ggplot(numeric_values, aes( x = q01, group = race, fill = race,)) +
  geom_density(adjust = 1, alpha = 0.3)
























