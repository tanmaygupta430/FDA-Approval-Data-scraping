library(tidyverse)
library(rvest)    
library(readr)

url<- 'https://www.biopharmcatalyst.com/calendars/historical-catalyst-calendar'
Web<- read_html(url)
ticker_html <- html_nodes(Web,'.ticker')
ticker_1 <- html_text(ticker_html)

drug_html<- html_nodes(Web,'.drug')
drug_1<- html_text(drug_html) 

indication_html<- html_nodes(Web,'.indication')
indication<- html_text(indication_html)

stage_html<- html_nodes(Web,'.stage')
stage<- html_text(stage_html) 

date_html<- html_nodes(Web,'.catalyst-date')
date_1<- html_text(date_html) 

details_html<- html_nodes(Web,'.catalyst-note')
details<- html_text(details_html) 

FDA_5=as.data.frame(cbind(ticker_1,drug_1,indication,stage,date_1,details))
#pander(DF,type='text')
FDA_5<-FDA_5[101:2458,]
view(FDA_5)

#write.csv(FDA_5,'FDA_data.csv')
#write.table(FDA_5, file = "FDA_data.txt", sep = "\t",
            #row.names = TRUE, col.names = NA)
