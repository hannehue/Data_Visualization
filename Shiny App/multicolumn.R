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
cadkj = count(q0801Count)
table(q0801Count)
table(q0801Count)

ggplot()

worry = formatted_data[, c(
  "q0008_0001",
  "q0008_0002",
  "q0008_0003",
  "q0008_0004",
  "q0008_0005",
  "q0008_0006",
  "q0008_0007",
  "q0008_0008",
  "q0008_0009",
  "q0008_0010",
  "q0008_0011",
  "q0008_0012"
)]

worry <- as.data.frame(worry)
colnames(worry) <- questions
library(reshape2)
aaa <- melt(worry)
view(worry)





ggplot(data = worry_about) +
  geom_bar(aes(x = questions[1], fill = q0008_0001), position = "fill") +
  geom_bar(aes(x = questions[2], fill = q0008_0002), position = "fill") +
  geom_bar(aes(x = questions[3], fill = q0008_0003), position = "fill") +
  geom_bar(aes(x = questions[4], fill = q0008_0004), position = "fill") + 
  geom_bar(aes(x = questions[5], fill = q0008_0005), position = "fill") +
  geom_bar(aes(x = questions[6], fill = q0008_0006), position = "fill") + 
  geom_bar(aes(x = questions[7], fill = q0008_0007), position = "fill") +
  geom_bar(aes(x = questions[8], fill = q0008_0008), position = "fill") + 
  geom_bar(aes(x = questions[9], fill = q0008_0009), position = "fill") +
  geom_bar(aes(x = questions[10], fill = q0008_0010), position = "fill") + 
  geom_bar(aes(x = questions[11], fill = q0008_0011), position = "fill") +
  geom_bar(aes(x = questions[12], fill = q0008_0012), position = "fill") + 
  coord_flip()

view(q0801Count)
view(worry_about$q0008_0001)
