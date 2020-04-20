# Pulling the coronavirus data from the main repo and save it as csv file
data_refresh <- function(){
df <- read.csv("https://raw.githubusercontent.com/Covid19R/coronavirus/master/csv/coronavirus.csv", stringsAsFactors = FALSE)

df$date <- as.Date(df$date)
if(ncol(df) != 7){
  stop("The number of columns is invalid")
} else if(nrow(df)< 69000){
  stop("The number of raws does not match the minimum number of rows")
} else if(min(df$date) != as.Date("2020-01-22")){
  stop("The starting date is invalid")
}

write.csv(df, "coronavirus_dataset.csv", row.names = FALSE)
writexl::write_xlsx(x = df, path = "coronavirus_dataset.xlsx", col_names = TRUE)
return(print("Done..."))
}

data_refresh()
