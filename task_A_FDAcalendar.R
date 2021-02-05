library(RODBC)
library(checkpoint)
checkpoint("2016-01-01")
conn <- odbcConnect("CData GoogleCalendar Source")
sqlTables(conn)
Adcom <- sqlQuery(conn, "SELECT ,Summary FROM Adcom", believeNRows=FALSE, rows_at_time=1)
(Adcom)
pdufa<- sqlQuery(conn, "SELECT Summary FROM pdufa", believeNRows=FALSE, rows_at_time=1)
pdufa
pdufa<- sqlQuery(conn, "SELECT * FROM pdufa", believeNRows=FALSE, rows_at_time=1,na.rm=TRUE)
Adcom_1<- sqlQuery(conn, "SELECT Summary,Description,StartDate FROM Adcom", believeNRows=FALSE, rows_at_time=1)
Adcom_1
pdufa<- sqlQuery(conn, "SELECT Summary,Description,StartDate FROM PDUFA", believeNRows=FALSE, rows_at_time=1)
Data<- as.data.frame(rbind(pdufa,Adcom_1))
write.csv(Data,"Data.csv")



