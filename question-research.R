# load packages
library(here)

# create a pathway to reteive files from workbench
data_pathway <- "/courses/EDS214/group_project/2024/tropical-aqua-titans/raw_data"

# read csv files
prieta_a <- read_csv(here(data_pathway, "QuebradaPrieta-A.csv"))
prieta_b <- read_csv(here(data_pathway, "QuebradaPrieta-B.csv"))
prieta <- read_csv(here(data_pathway, "QuebradaPrieta.csv"))
