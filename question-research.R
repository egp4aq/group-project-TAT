# load packages
library(here)
library(janitor)
library(tidyverse)

# create a pathway to reteive files from workbench
data_pathway <- "/courses/EDS214/group_project/2024/tropical-aqua-titans/raw_data"

# read csv files
prieta_a <- read.csv(here(data_pathway, "QuebradaPrieta-A.csv"))
prieta_b <- read.csv(here(data_pathway, "QuebradaPrieta-B.csv"))
prieta <- read.csv(here(data_pathway, "QuebradaPrieta.csv"))

# merge data sets
combined_prieta <- full_join(prieta_a, prieta_b) %>%
  full_join(prieta)

# convert to lower snake case
combined_prieta <- clean_names(combined_prieta)

# filter years (1989- 1995)
prieta_89_98 <- combined_prieta %>%
  filter(sample_date < 1996)

# select variables for study (similar to original analysis)
k_no3 <- prieta_89_98 %>%
  select(sample_id, sample_date, k, no3_n)

# plot for k
ggplot(data = k_no3, aes(x = sample_date, y = k)) + # attempt :(
  geom_line() +
  theme_classic() +
  labs(x = "Year",
       y = "Potassium (mg/L)")
  
  
