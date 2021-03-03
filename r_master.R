source('src/r_functions.R')
function_load_libraries()

# Acquisition ----

#'Loading TDAmeritrade data in via API
source('src/TDAmeritrade_HistoricalStockData_Acquisition.R')
source('src/TDAmeritrade_OptionsData_Acquisition')