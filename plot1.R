## Download data and unzip file
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
filename = "EDA2_data.zip"
download.file(url,filename)

unzip(filename)

## Read file data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Total emissions per year
totalEmissions <- tapply(NEI$Emissions, NEI$year, sum)

## Plot 1
png("plot1.png")
barplot(totalEmissions, 
        xlab = "Year", 
        ylab = "Total Emission (ton)", 
        main = "Total PM2.5 Emission")
dev.off()
