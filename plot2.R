# Read the data file
## This first line will likely take a few seconds. Be patient!
setwd("~/Desktop/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BaltimoreCity <- subset(NEI, fips == "24510")

totalPM25ByYear <- tapply(BaltimoreCity$Emissions, BaltimoreCity$year, sum)

png("plot2.png")
plot(names(totalPM25ByYear), totalPM25ByYear, type="l",
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main=expression("Total Baltimore City" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()
