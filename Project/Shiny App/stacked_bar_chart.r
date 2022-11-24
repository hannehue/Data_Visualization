library(dplyr)
library(ggplot2)

dat <- fread("Shiny App/data_files/raw-responses.csv")

dat_sub <- dat %>%
  select(age3, racethn4) %>%
  group_by(age3, racethn4) %>%
  summarise(n = n()) %>%
  group_by(age3) %>%
  mutate(tot = sum(n), perc = n / tot * 100)

ggplot(dat_sub, aes(x = age3, y = perc, fill = racethn4)) + geom_col(width = 1)
