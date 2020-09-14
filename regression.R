flower <- iris[iris$Species == "virginica",]
fit <- lm(flower$Petal.Length ~ flower$Sepal.Length)
qqnorm(summary(fit)$residuals)
qqline(summary(fit)$residuals)

set.seed(32)
temperature <- rnorm(200, 15,5)
vars <- rnorm(200,0.1,0.1)
leafOut <- 90 - (0.01*temperature) + vars
plot(temperature,leafOut, ylab= "day of year of leaf out", xlab="average air temperature in march")
growth.mod <- lm(leafOut ~ temperature)
summary(growth.mod)
abline(growth.mod)
