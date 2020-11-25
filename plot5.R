## Read and subset SCC with motor vehicle values
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorV  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[motorV, ]

## Merge dataframes
NEISCC <- merge(baltimore, subsetSCC, by="SCC")

## Total emission data in Baltimore per year (fips=="24510") by per type
totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)

## Plot 5
png("plot5.png")
barplot(totalEmissions, 
        xlab = "Year", 
        ylab = "Total Emission (ton)", 
        main = "Total Motor-sourced PM2.5 Emission in Baltimore")
dev.off()