library(readr)
library(dplyr)
us_states <- read_csv("Desktop/Lehigh University Spring 2022/Business Analytics II/Assignment 2/BIS-244-pricetyler/covid-19-data/us-states.csv")

penn <- us_states %>% filter(state=="Pennsylvania")
penn <- penn %>% mutate(incr_cases = cases - lag(cases)) %>% 
  mutate(incr_deaths = deaths - lag(deaths, order_by = date))
print(penn %>% pull(incr_cases) %>% sd(na.rm = TRUE))