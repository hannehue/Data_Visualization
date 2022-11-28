library(tidyverse)


questions = c(
  "Height",
  "Weight",
  "Hair",
  "Physique",
  "Appearance of genetalia",
  "Clothing style",
  "Sexual performance or amount of sex",
  "Mental health",
  "Physical health",
  "Your finances",
  "Ability to provide for family",
  "None of the above"
)


q0801Count = factor(worry_about$q0008_0001)

ggplot(data = worry_about) +
  geom_bar(aes(x = questions[1], fill = q0008_0001)) +
  geom_bar(aes(x = questions[2], fill = q0008_0002)) +
  geom_bar(aes(x = questions[3], fill = q0008_0003)) +
  geom_bar(aes(x = questions[4], fill = q0008_0004)) + 
  geom_bar(aes(x = questions[5], fill = q0008_0005)) +
  geom_bar(aes(x = questions[6], fill = q0008_0006)) + 
  geom_bar(aes(x = questions[7], fill = q0008_0007)) +
  geom_bar(aes(x = questions[8], fill = q0008_0008)) + 
  geom_bar(aes(x = questions[9], fill = q0008_0009)) +
  geom_bar(aes(x = questions[10], fill = q0008_0010)) + 
  geom_bar(aes(x = questions[11], fill = q0008_0011)) +
  geom_bar(aes(x = questions[12], fill = q0008_0012)) + 
  coord_flip()