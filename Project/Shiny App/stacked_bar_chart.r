library(data.table)
library(ggplot2)

dat <- fread("Shiny App/data_files/raw-responses.csv")

dat_sub <- dat[, .(age3 = as.factor(age3), racethn4 = as.factor(racethn4))][, .N, by = .(age3, racethn4)]

dat_sub[, tot := sum(N), by = age3][, perc := N / tot * 100][order(age3)]

ggplot(dat_sub, aes(x = age3, y = perc, fill = racethn4)) + geom_col()
