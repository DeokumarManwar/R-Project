library(readr)
vehicles <- read_csv("C:/Users/Dev/Downloads/vehicles.csv", 
                     col_types = cols(vehicle = col_skip(), 
                                      fc = col_integer(), Mileage = col_integer(), 
                                      lh = col_number(), lc = col_number(), 
                                      mc = col_number()))
View(vehicles)