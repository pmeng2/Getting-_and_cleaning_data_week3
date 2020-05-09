##1
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile = "C:/Users/pmeng2/Documents/R.Studio/Getting_and_Cleaning_Data/Getting_and_cleaning_data_week3/01.csv")
fileurl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(fileurl1, destfile = "C:/Users/pmeng2/Documents/R.Studio/Getting_and_Cleaning_Data/Getting_and_cleaning_data_week3/01.pdf")
data<- read.csv("01.csv")
agricultureLogical<- data$AGS==6 & data$ACR==3
which(agricultureLogical)

##2
ownload.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg', 'jeff.jpg', mode='wb' )
picture <- readJPEG("jeff.jpg", native = TRUE)
quantile(picture, probs = c(0.3,0.8))

##3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "~/R.Studio/Getting_and_Cleaning_Data/Getting_and_cleaning_data_week3/FGDP.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "~/R.Studio/Getting_and_Cleaning_Data/Getting_and_cleaning_data_week3/Country.csv")
library(data.table)
FGDP <- read.csv("FGDP.csv")
FGDP1 <- data.table(FGDP)[5:194,c(1,2,4,5)]
colnames(FGDP1) <-  c("CountryCode", "ranking", "name", "total")
FGDP2 <- mutate(FGDP1, rank = as.numeric(as.character(ranking)))
Country <-read.csv("Country.csv")
Country1 <- data.table(Country)
mergedDT <- merge(Country1, FGDP2, by = "CountryCode")
nrow(mergedDT)
orderedDT<- arrange(mergedDT, desc(rank))
orderedDT[13, "Long.Name"]

