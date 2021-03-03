stock_list <- read_excel("data/stock_list.xlsx")

api_key<- read.delim(file='secrets/api_key.txt',header=F)

url_stub <- 'https://api.tdameritrade.com/v1/marketdata/chains?'
  
url_apikey <- paste('apikey=',api_key,sep='')
url_symbol<- '&symbol='
url_contractType <- '&contractType=ALL'
url_strategy <- '&strategy=ANALYTICAL'
url_fromDate <- paste('&fromDate=',Sys.Date(),sep='')
url_toDate<- paste('&toDate=',Sys.Date()+lubridate::days(1095),sep='')

x <- GET(url = url_string)
y <- content(x)

for (loop1 in 1:nrow(stock_list)) {
  
  url_string <- paste(url_stub,url_apikey,url_symbol,stock_list$Ticker[loop1],url_contractType,url_strategy,url_fromDate,url_toDate,sep='')
  x <- GET(url = url_string)
  y <- content(x)
  
  z <- list(y$putExpDateMap,y$callExpDateMap)
  
  for (loop2 in 1:length(z)) {
    
    
    for(loop3 in 1:length(z[[loop2]][[loop3]])) {
      
      
    } #This is the end of loop3 
    
  } #This is the end of loop2 
  
} #This is the end of loop1

rbl <- readRDS('examples/rbindlist.rds')
temp_data_4 <- rbindlist(rbl, fill = TRUE)