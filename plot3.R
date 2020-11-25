## Import library
library(ggplot2)

## Read file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Total emission data in Baltimore per year (fips=="24510") by per type
data <- aggregate(Emissions ~ year + type, baltimore, sum)

## Plot 3
png("plot3.png",width = 600, height = 400)
g <- ggplot(data, aes(year, Emissions, color = type))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM "[2.5]*"  Emissions")) +
  ggtitle("Total PM2.5 Emissions per type in Baltimore") +
  theme(plot.title = element_text(hjust = 0.5))
dev.off()
