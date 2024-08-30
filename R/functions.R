#Import data from multiple files into R

file_names <- c("RioMameyesPuenteRoto.csv", 
                "QuebradaCuenca1-Bisley.csv",
                "QuebradaCuenca2-Bisley.csv",
                "QuebradaCuenca3-Bisley.csv")
pathway <- "/courses/EDS214/group_project/2024/tropical-aqua-titans/raw_data"

read_files <- function(file_names) {
  # Loop through the file names and read the CSV files into dynamically named variables
  for (i in seq_along(file_names)) {
    # Construct the dynamic name for the variable
    var_name <- paste0("data_", i)
    
    # Read the CSV file
    file_data <- read_csv(here(pathway, file_names[i]), na = c("-999", ""))
    # Assign the data frame to a variable with the constructed name
    assign(var_name, file_data, envir = .GlobalEnv)
  }
}