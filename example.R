dataDF <- read.csv("/Users/hkropp/Downloads/Data Collection Cleaned - Sheet1.csv")

a.vect <- c(1,2,3,4)
dataDF$Sugar.Content

mean(dataDF$Sugar.Content, na.rm=TRUE)

install.packages(c("ggplot2"))
library(ggplot2)
install.packages(c("dplyr"))
library(dplyr)

ggplot(dataDF, aes(x=as.factor(Tree.Number), y=Sugar.Content))+
  geom_boxplot()+
  theme_classic()

metaDF <- read.csv("/Users/hkropp/Downloads/Maple Data - Clean.csv")

redMaples <- metaDF %>%
  filter(Tree.Species == "Red Maple")

mean(redMaples$Sucrose.Conc.Mean, na.rm=TRUE)

summaryTable <- metaDF %>%
  group_by(Tree.Species, units) %>%
  summarise(mean.sugar= mean(Sucrose.Conc.Mean, na.rm=TRUE),
            n.sugar= n(),
            sd.sugar = sd(Sucrose.Conc.Mean, na.rm=TRUE))

redMaplesP <- metaDF %>%
  filter(Tree.Species == "Red Maple" & units == "%")
ggplot(redMaplesP, aes(x=Sucrose.Conc.Mean))+
  geom_histogram(binwidth=1)
