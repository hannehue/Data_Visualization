library(readr)
library(dplyr)
library(ggplot2)

dat <- read_csv("data_files/raw-responses.csv")

dat_sub <- dat %>%
  select(age3, q0009) %>%
  group_by(age3, q0009) %>%
  summarise(n = n()) %>%
  group_by(age3) %>%
  mutate(tot = sum(n), perc = n / tot * 100)

ggplot(dat_sub, aes(x = age3, y = perc, fill = q0009)) +
  geom_col(width = 0.1) +
  ggtitle("Which of the following categories best describes your employment status?
") +
  xlab("Age groups") +
  ylab("Respondee percentage") +
  scale_fill_discrete(name = "") +
  coord_flip()

dat_sub1 <- dat %>%
  select(racethn4, q0009) %>%
  group_by(racethn4, q0009) %>%
  summarise(n = n()) %>%
  group_by(racethn4) %>%
  mutate(tot = sum(n), perc = n / tot * 100)

ggplot(dat_sub1, aes(x = racethn4, y = perc, fill = q0009)) +
  geom_col(width = 0.1) +
  ggtitle("Which of the following categories best describes your employment status?") +
  xlab("Race distribution") +
  ylab("Respondee percentage") +
  scale_fill_discrete(name = "") +
  coord_flip()
