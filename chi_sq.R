70-31


food <- matrix(c(49,21,
                 31,39), ncol= 2, byrow=TRUE)

seed.Tot <- sum(food[1,])
berries.Tot <- sum(food[2,])
jays.Tot <- sum(food[,1])
card.Tot <- sum(food[,2])
food.Tot <- sum(food)

foodExp <- matrix(c(seed.Tot*jays.Tot/food.Tot,
                    seed.Tot*card.Tot/food.Tot,
                    berries.Tot*jays.Tot/food.Tot,
                    berries.Tot*card.Tot/food.Tot), ncol= 2, byrow=TRUE)

chisq.test(x=food, y=foodExp)                    
