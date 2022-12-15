library(tidyverse)
library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(shiny)
library(shinyWidgets)
library(shinycssloaders)
library(igraph)
library(ggraph)
library(scales)
library(DT)
library(treemap)
library(highcharter)
library(purrr)
library(stringr)
library(fuzzyjoin)
library(lexicon)
library(visNetwork)
library(httr)
library(rdrop2)
library(lubridate)
library(readr)
library(hrbrthemes)


raw_data <- read_csv("data_files/raw-responses.csv")
#View(raw_responses)
formatted_data <- read_csv("data_files/raw-responses.csv")
# formatted_data %>%
#   select(c(
#     "q0001",
#     "q0002",
#     "q0005",
#     "q0009",
#     "q0013",
#     "q0014",
#     "q0015",
#     "q0017",
#     "q0018",
#     "q0022",
#     "q0024",
#     "q0026"
#   ))

Formatted_Multicolum <- read_csv2("data_files/Clean_Multi_Column.csv")


single_Column_Quest = formatted_data[, c(
  "q0001",
  "q0002",
  "q0005",
  "q0009",
  "q0013",
  "q0014",
  "q0015",
  "q0017",
  "q0018",
  "q0022",
  "q0024",
  "q0026"
)]


worry_about = formatted_data[, c(
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



colnames(single_Column_Quest) = c(
  "1How Masculine do you feel?",
  "2How important is it, that others see you as masculine?",
  "5Do you think society puts unhealthy pressure on men?",
  "9Employment status",
  "13Why did you not respond",
  "14How much have you heard about #MeToo",
  "15Do you behave differently after #MeToo",
  "17Do you feel you're supposed to make the first romantic move",
  "18How often do you try to pay for a date",
  "22How you changed your behaviour in romantic relationships after #MeToo",
  "24What is your marriage status",
  "26What is you sexual orientation"
)






# colnames(formatted_data) = c(
#   "id",
#   "start",
#   "end",
#   "1How Masculine do you feel?",
#   "2How important is it, that others see you as masculine?",
#   "3One hobby you associate with masculinity?",
#   "4Where have you gotten your ideas about what it means to be a good man?",
#   "4_2",
#   "4_3",
#   "4_4",
#   "4_5",
#   "4_6",
#   "5Do you think society puts unhealthy pressure on men?",
#   "6How do you think society puts unhealthy pressure on men?",
#   "7How often do you do the following?",
#   "7_2",
#   "7_3",
#   "7_4",
#   "7_5",
#   "7_6",
#   "7_7",
#   "7_8",
#   "7_9",
#   "7_10",
#   "7_11",
#   "8Which of the following do you worry about daily",
#   "8_2",
#   "8_3",
#   "8_4",
#   "8_5",
#   "8_6",
#   "8_7",
#   "8_8",
#   "8_9",
#   "8_10",
#   "8_11",
#   "8_12",
#   "9Employment status",
#   "10Advantages of being a man",
#   "10_2",
#   "10_3",
#   "10_4",
#   "10_5",
#   "10_6",
#   "10_7",
#   "10_8",
#   "11Disadvantages of being a man",
#   "11_2",
#   "11_3",
#   "11_4",
#   "11_5",
#   "12How did you react to a sexual harrasment incident at work",
#   "12_2",
#   "12_3",
#   "12_4",
#   "12_5",
#   "12_6",
#   "12_7",
#   "13Why did you not respond",
#   "14How much have you heard about #MeToo",
#   "15Do you behave differently after #MeToo",
#   "16How do you think differently about your behaviour after #MeToo",
#   "17Do you feel you're supposed to make the first romantic move",
#   "18How often do you try to pay for a date",
#   "19Why do you try to pay during a date",
#   "19_2",
#   "19_3",
#   "19_4",
#   "19_5",
#   "19_6",
#   "19_7",
#   "20How do you gauge somones interest when you want to be intimate",
#   "20_2",
#   "20_3",
#   "20_4",
#   "20_5",
#   "20_6",
#   "21Sexual Boundries: Which of the following things have you done",
#   "21_2",
#   "21_3",
#   "21_4",
#   "22How you changed your behaviour in romantic relationships after #MeToo",
#   "23How have you changed your behaviour",
#   "24What is your marriage status",
#   "25Do you have children",
#   "25_2",
#   "25_3",
#   "26What is you sexual orientation",
#   "27Age?",
#   "Race:",
#   "Last completed grade of school",
#   "What state do you live in",
#   "q34",
#   "q35",
#   "q36",
#   "race2",
#   "raceetn4",
#   "educ3",
#   "educ4",
#   "age3",
#   "kids",
#   "orientation",
#   "weight"
# )


