devtools::install_github("rstudio/EDAWR")
library(EDAWR)
newDATA <- arrange(newDATA,Mileage)
newDATA %>% summarise(mean = mean(Mileage), sum = sum(Mileage), n = n())
veh <- newDATA %>% 
  filter(State =='CA' | State == 'TX' | State == 'FL'| State == 'AZ'| State == 'GA'| State == 'LA'| State == 'NC')
