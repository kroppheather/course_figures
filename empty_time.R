par(mfrow=c(1,3))

plot(c(1950,2020),c(0,30),
     type="n", axes=FALSE,
     xlab="year", ylab="y variable",
     xaxs="i", yaxs="i")
axis(1, seq(1950,2020, by=10))
axis(2, seq(0,30, by=5), las=2)

plot(c(1950,2020),c(0,30),
     type="n", axes=FALSE,
     xlab="year", ylab="y variable",
     xaxs="i", yaxs="i")
axis(1, seq(1950,2020, by=10))
axis(2, seq(0,30, by=5), las=2)

plot(c(1950,2020),c(0,30),
     type="n", axes=FALSE,
     xlab="year", ylab="y variable",
     xaxs="i", yaxs="i")
axis(1, seq(1950,2020, by=10))
axis(2, seq(0,30, by=5), las=2)

#lag plot
plot(c(12,20), c(0,20), axes=FALSE,
     type="n",  xlab="hour", ylab="y variable")

set.seed(25)
y <- rnorm(9,15,3)
for(i in 1:9){
  polygon(c(seq(12,20)[i]-0.25, seq(12,20)[i]-0.25,
            seq(12,20)[i]+0.25,seq(12,20)[i]+0.25),
          c(0,y[i],y[i],0), border="white",
          col=rgb(218/255,227/255,243/255,.5))
  
}
abline(v=20, col="tomato3")
text(seq(12,20), rep(1,9), rev(seq(0,8)))

set.seed(25)
points(seq(12,20), rnorm(9,15,3), type="b", pch=19)

axis(1, seq(12,20, by=1))
axis(2, seq(0,20, by=5), las=2)

mtext("lag", side=1, line=4)


