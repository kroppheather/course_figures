climate <- matrix(c(80,30,10,20,
                    30,25,60,35,
                    22,8,10,5,
                    6,9,8,2), byrow=TRUE, ncol=4)

chisq.test(climate)

nullClimate <- matrix(c(35,35,35,35,# 140
                        37.5,37.5,37.5,37.5,  #150
                        11.25,11.25,11.25,11.25,  #45
                        6.25,6.25,6.25,6.25),  #25
                       byrow=TRUE, ncol=4  )

nullClimate

chisq.test(climate,p=nullClimate, rescale.p=TRUE)

# will get error message chi-squared approximation may be incorrect
# this is because some counts are very small (and others larger)
# that means some expected counts will be very small and thus there
# may be some error in approximating chi squared
