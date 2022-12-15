library(tidyverse)
library(gifski)
library(gganimate)
Test <- read_csv2("Shiny App/data_files/Clean_Multi_Column.csv")

Test <- Test %>%
  group_by(Question) %>%
  mutate(percentage = Value / sum(Value) * 100)

Test$Selection = as.factor(Test$Selection)
Test$Selection = factor(Test$Selection, levels = c("Not Selected", "Selected"))
Test$percentage = round(Test$percentage, 0)
Test$Question = factor(Test$Question, levels = c("None of the above", "Height", "Appearance of genetalia", "Clothing style", "Hair", "Sexual performance or amount of sex",
                                                 "Mental health", "Ability to provide for family", "Physique", "Your finances", "Physical health",
                                                 "Weight"))
ggplot(Test, aes(fill = Selection, x = Question, y = percentage)) +
  geom_bar(position = "fill", stat = "identity") +
  coord_flip() +
  scale_fill_manual(values = c("#005F94", "#E0912A")) +
  labs(title = "What do you worry about on a daily/near daily basis")

# SAVE THIS FUCKING LINK
# https://gist.github.com/ale-lazic/f9754aff54acfcc0e32718d5685817c3


worry_about

test2 <- data.frame(q = worry_about$q0008_0012, race = worry_about$q0028)

test2 %>%
  summarise(n_notSelected = sum(q == "Not selected"), nSelected = sum(q != "Not selected"))

test3 <- test2 %>%
  group_by(race)

test3 %>%
  summarise(n_notSelected = sum(q == "Not selected"), nSelected = sum(q != "Not selected"))


anim <- read.csv2("Shiny App/data_files/Animate.csv")
#anim
#view(anim)

anim <- anim %>%
  group_by(Question, Race) %>%
  mutate(Percentage = Value / sum(Value) * 100)

anim$Percentage = round(anim$Percentage, 0)

### Create new data frame, containing only one race

allAns <- list()

rowindex = 1
lolIndex = 1
asd = 1
for (j in 1:6) {
  print(lolIndex)
  
  lolIndex = rowindex
  for (i in 1:12){
    allAns[[asd]] <- (anim[lolIndex,])
    asd = asd + 1
    allAns[[asd]] <- (anim[lolIndex + 1,])
    asd = asd + 1
    lolIndex = lolIndex + 12
  }
  
  rowindex = rowindex + 2
}


datfra1 <- data.frame(do.call(rbind, allAns))
x <- c('All', 'Asian', 'Black', 'Hispanic', 'Other', 'White')
d <- rep(x, each = 24)
datfra1$frame <- d

### Create new data frame, containing only one race

# allAns <- list()
# lolIndex <- 3
# asd <- 1
# for (i in 1:12){
#   allAns[[asd]] <- (anim[lolIndex,])
#   asd = asd + 1
#   allAns[[asd]] <- (anim[lolIndex + 1,])
#   asd = asd + 1
#   lolIndex = lolIndex + 12
# }
# 
# datfra2 <- data.frame(do.call(rbind, allAns), frame = rep('datfra2', 3))


datfra1$Question = factor(datfra$Question, levels = c("None of the above", "Height", "Appearance of genetalia", "Clothing style", "Hair", "Sexual performance or amount of sex",
                                                 "Mental health", "Ability to provide for family", "Physique", "Your finances", "Physical health",
                                                 "Weight"))

# animi <- rbind(datfra1, datfra2)


p <- ggplot(datfra1, aes(fill = Selection, x = Question, y = Percentage)) +
  geom_bar(position = "fill", stat = "identity") +
  coord_flip() +
  scale_fill_manual(values = c("#005F94", "#E0912A")) +
  labs(title = "What do you worry about daily", subtitle = "Race: {closest_state}") +
  transition_states(
    frame,
    transition_length = 2,
    state_length = 2
  ) + 
  ease_aes('sine-in-out')

animate(p, renderer = gifski_renderer())

anim_save('animation.gif')



ggplot(datfra, aes(fill = Selection, x = Question, y = Percentage)) +
  geom_bar(position = "fill", stat = "identity") +
  coord_flip() +
  scale_fill_manual(values = c("#005F94", "#E0912A")) +
  labs(title = "What do you worry about on a daily/near daily basis")





