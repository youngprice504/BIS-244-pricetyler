library(readr)
library(dplyr)
# TAA You "hard-wired" reference to file
us_states <- read_csv("us-states.csv")

penn <- us_states %>% filter(state=="Pennsylvania")
penn <- penn %>% mutate(incr_cases = cases - lag(cases)) %>% 
  mutate(incr_deaths = deaths - lag(deaths, order_by = date))
# TAA Row 1 incr should be equal to row 1 cases/deaths
print(penn %>% pull(incr_cases) %>% sd(na.rm = TRUE))
