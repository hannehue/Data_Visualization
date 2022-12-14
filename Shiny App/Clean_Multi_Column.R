library(tidyverse)
Test <- read_excel("Shiny App/data_files/Clean_Multi_Column.xlsx")

Test <- Test %>%
  group_by(Question) %>%
  mutate(percentage = Value / sum(Value) * 100)

Test$Selection = as.factor(Test$Selection)
Test$Selection = factor(Test$Selection, levels = c("Selected", "Not Selected"))
Test$percentage = round(Test$percentage, 0)
Test$Question = factor(Test$Question, levels = c("None of the above", "Height", "Appearance of genetalia", "Clothing style", "Hair", "Sexual performance or amount of sex",
                                                 "Mental health", "Ability to provide for family", "Physique", "Your finances", "Physical health",
                                                 "Weight"))
ggplot(Test, aes(fill = Selection, x = Question, y = percentage)) +
  geom_bar(position = "fill", stat = "identity") +
  coord_flip() + scale_y_reverse() +
  scale_fill_manual(values = c("#E0912A", "#005F94")) +
  labs(title = "What do you worry about on a daily/near daily basis")

# SAVE THIS FUCKING LINK
# https://gist.github.com/ale-lazic/f9754aff54acfcc0e32718d5685817c3