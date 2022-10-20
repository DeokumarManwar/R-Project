#vehicles <- read.csv(file.choose(),header = T)
library(mice)
library(VIM)
# missing data
p <- function(x) {sum(is.na(x))/length(x)*100}
apply(vehicles,2,p)

#in format it will show what is missing
md.pattern(vehicles)
md.pairs(vehicles)

# Impute
impute <-mice(vehicles[,2:7], m=3 ,seed = 123)
print(impute)
impute$imp$Mileage
vehicles[20,]

#Cmmplete data
complete(impute,1)
newDATA <-complete(impute,1)


