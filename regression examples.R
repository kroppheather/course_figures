
temp <- rnorm(50, 20,5)

species <- 40 - (0.1*temp) + rnorm(50, 0 , 1)

plot(temp, species, ylab = "Species Richness", 
     xlab=expression(paste("Average July Temperature (",degree,"C)")),
     yaxt="n",pch=19)
axis(2, seq(30,40, by=2), las=2)


fit <- lm(species ~ temp)
summary(fit)

abline(fit)


