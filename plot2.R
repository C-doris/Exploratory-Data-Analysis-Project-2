## Read file and subset data
baltimore <- subset(NEI, fips == "24510")

## Total emissions per year
totalEmissions <- tapply(baltimore$Emissions, baltimore$year, sum)

## Plot 2
png("plot2.png")
barplot(totalEmissions, 
        xlab = "Year", 
        ylab = "Total Emission (ton)", 
        main = "Total PM2.5 Emission per year in Baltimore")
dev.off()