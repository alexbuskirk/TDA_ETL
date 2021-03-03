api_key<- read.delim(file='secrets/api_key.txt',header=F)

url_stub_1 <- 'https://api.tdameritrade.com/v1/marketdata/'
url_stub_2 <- '/pricehistory?'

url_symbol<- 'JPM'
url_apikey <- paste('apikey=',api_key,sep='')
url_periodType <- '&periodType=month'
url_frequencyType <-'&frequencyType=daily'
url_endDate <-'&endDate=1613764329000'
url_startDate <-'&startDate=1609530729000'
url_needExtendedHoursData <- '&needExtendedHoursData=true'


url_string <- paste(url_stub_1,url_symbol,url_stub_2,url_apikey,url_periodType,url_frequencyType,url_endDate,url_startDate,url_needExtendedHoursData,sep='')

x <- GET(url = url_string)
y <- content(x)