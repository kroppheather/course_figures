install.packages("palmerpenguins")
library(palmerpenguins)

penguins


unique(penguins$species)
unique(penguins$island)

Adelie <- penguins[penguins$species == "Adelie",]

plot(Adelie$bill_length_mm ~ Adelie$island,
     xlab="location",
     ylab="bill length (mm)")


plot(penguins$bill_length_mm ~ penguins$species)
penguins


#check normality
shapiro.test(penguins$bill_length_mm[penguins$species == "Adelie"])
shapiro.test(penguins$bill_length_mm[penguins$species == "Gentoo"])
shapiro.test(penguins$bill_length_mm[penguins$species == "Chinstrap"])

bartlett.test(penguins$bill_length_mm ~ penguins$species)

shapiro.test(Adelie$bill_length_mm[penguins$island == "Torgersen"])
shapiro.test(Adelie$bill_length_mm[penguins$island == "Biscoe"])
shapiro.test(Adelie$bill_length_mm[penguins$island == "Dream"])

bartlett.test(Adelie$bill_length_mm ~ Adelie$island)
mod.a <- lm(Adelie$bill_length_mm ~ Adelie$island)
anova.a <- aov(mod.a)
summary(anova.a)
