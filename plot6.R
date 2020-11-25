## Import library
library(ggplot2)

## Read and subset files to vehicle emissions between  Baltimore and LA
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore.NEI <- subset(NEI, fips=="24510" & type=="ON-ROAD")
LA.NEI <- subset(NEI, fips=="06037" & type=="ON-ROAD")

## Total emissions in Baltimore and LA
Baltimore.Emissions <- aggregate(Baltimore.NEI$Emissions,
                                 by=list(Baltimore.NEI$year),
                                 FUN=sum)
LA.Emissions <- aggregate(LA.NEI$Emissions,
                          by=list(LA.NEI$year),
                          FUN=sum)

Baltimore.Emissions$city = rep("Baltimore",nrow(Baltimore.Emissions))
LA.Emissions$city = rep("Los Angeles",nrow(LA.Emissions))

names(Baltimore.Emissions)[1] <- "year"
names(LA.Emissions)[1] <- "year"

## Merge dataframes
Emissions = rbind(Baltimore.Emissions, LA.Emissions)

## Plot 6
png("plot6.png", height = 300, width = 400)
ggplot(Emissions,
       aes(as.factor(year), x,
           fill = as.factor(year)))+
  xlab("Year") +
  geom_histogram(stat = "identity") +
  facet_grid(. ~ city) +
  scale_fill_discrete(name = "Year") +
  ylab(expression("Total PM "[2.5]*"  Emissions")) +
  ggtitle("Total Motor-sourced PM 2.5 Emissions") +
  theme(plot.title = element_text(hjust = 0.5))
dev.off()
