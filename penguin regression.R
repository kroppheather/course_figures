install.packages("palmerpenguins")
library(palmerpenguins)

gentoo <- penguins[penguins$species == "Gentoo",]

plot(gentoo$bill_depth_mm, gentoo$body_mass_g,
     pch=19, xlab="Bill depth (mm)",
     ylab="Body mass (g)")

# ordinary least squares regression
# lm(y ~ x)
penguin.mod <- lm(gentoo$body_mass_g ~ gentoo$bill_depth_mm)
summary(penguin.mod)

plot(gentoo$bill_depth_mm, gentoo$body_mass_g,
     pch=19, xlab="Bill depth (mm)",
     ylab="Body mass (g)")

abline(penguin.mod)


penguin.res <- rstandard(penguin.mod)
summary(penguin.mod)

qqnorm(penguin.res)
qqline(penguin.res)
shapiro.test(penguin.res)

