library(dplyr)

season15 <- read.csv("/home/bcarancibia/nba_analysis/data/1516_playerstats.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)
season14 <- read.csv("/home/bcarancibia/nba_analysis/data/1415_playerstats.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)
season13 <- read.csv("/home/bcarancibia/nba_analysis/data/1314_playerstats.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)

season15 <- subset(season15, season15$Tm != "TOT")
season14 <- subset(season14, season14$Tm != "TOT")
season13 <- subset(season13, season13$Tm != "TOT")

season13$FT. <- as.numeric(season13$FT.)
season14$FT. <- as.numeric(season14$FT.)
season15$FT. <- as.numeric(season15$FT.)

season13 <- na.omit(season13)
season14 <- na.omit(season14)
season15 <- na.omit(season15)

mean(season13$FT.)
#[1] 0.7204333
mean(season14$FT.)
#[1] 0.7236255
mean(season15$FT.)
#[1] 0.7393228

FT13 <- subset(season13, season13$FT. < 0.7204333)
FT14 <- subset(season14, season14$FT. < 0.7236255)
FT15 <- subset(season15, season15$FT. < 0.7393228)

