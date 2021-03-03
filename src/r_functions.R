##### Load Libraries #####
#The following function will
#1. Check if you have necessary libraries
#2. If you do, then the library will be called.
#3. If you don't, it will install and call libraries that you don't have.

function_load_libraries <- function()
{
  packages <- c(
    #Data Transformation
    'tidyverse', 'janitor', 'splitstackshape', 'glue', 'lubridate', 'data.table', 'gridExtra',
    
    #Modeling
    # 'caret', 'glmnet', 'mlbench',
    
    #Connection
    'odbc', 'DBI',
    
    #Loading
    'readxl', 'readr', 'httr',
    
    #Other
    'sendmailR'
    
  )
  install_packages <- packages[!(packages %in% installed.packages()[,'Package'])]
  if(length(install_packages))
    install.packages(install_packages, repos = 'http://cran.rstudio.com', dependencies = TRUE)
  sapply(packages, require, character.only = TRUE)
}

##### Bucket values by SD from the mean #####
# Function to bucket by standard deviations from the mean

# sd_bucket <- function(x) {
#   
#   sd1 = sd(x, na.rm = TRUE)
#   sd2 = sd1*2
#   mean = mean(x, na.rm = TRUE)
#   
#   case_when(
#     
#     is.na(x) ~ 'NP',
#     
#     x >= (mean + sd2) ~ '+2SD',
#     (x >= (mean + sd1) & x < (mean + sd2)) ~ '+1SD',
#     (x >= mean & x < (mean + sd1)) ~ '<+1SD',
#     
#     x <= (mean - sd2) ~ '-2SD',
#     (x <= (mean - sd1) & x > (mean - sd2)) ~ '-1SD',
#     (x < mean & x > (mean - sd1)) ~ '<-1SD',
#     
#     TRUE ~ as.character(x))
# }

##### Identifies Outliers #####
# Function to identify outliers using quantiles
is_outlier <- function(x) {
  return(x < quantile(x, 0.25) - 1.5 * IQR(x) | x > quantile(x, 0.75) + 1.5 * IQR(x))
}

##### Calculate Mode #####
# Function to calculate mode(s)

# Mode <- function(x, na.rm = FALSE) {
#   if(na.rm){
#     x = x[!is.na(x)]
#   }
#   x <- sort(x)
#   u <- unique(x)
#   y <- lapply(u, function(y) length(x[x==y]))
#   u[which(unlist(y) == max(unlist(y)))]
# }
