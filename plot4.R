## Read file and subset SCC with coal values
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalMatches  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
subsetSCC <- SCC[coalMatches, ]

## Merge dataframes
NEISCC <- merge(NEI, subsetSCC, by="SCC")

## Total emission data per year
totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)

## Plot 4
png("plot4.png")
barplot(totalEmissions, 
        xlab = "Year", 
        ylab = "Total Emission (ton)", 
        main = "Total Coal-sourced PM2.5 Emissions")
dev.off()