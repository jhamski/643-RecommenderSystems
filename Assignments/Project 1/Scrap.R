#http://stats.stackexchange.com/questions/61085/cosine-similarity-on-sparse-matrix

x1 <- rnorm(10)
x2 <- rnorm(10)

x1 <- c(2,-1)
x2 <- c(-2,2)

Euc_dist = dist(rbind(x1,x2) ,method="euclidean")
Euc_dist


y <- x1 - x2
y2 <- y^2
sum_y <- sum(y2)
sqrt(sum_y)





#Euclidean distance
#Sum up the square of the distances between each elements. 
#Square root of the sum is the distance
euclidean_distance <- function(x, y) {
  #z <- sqrt(sum((x-y)^2))

  #Get the difference between each element of both vectors
  z <- x-y
  
  #Squre the Distances
  z1 <- z^2
  
  #Sum up the squared differences
  z2 <- sum(z1)
  
  z3 <- sqrt(z2)
  
  return (z3)  
}

euclidean_distance(x1,x2)


library(Matrix)
set.seed(42)
non_zero <- 10
i <- sample(1:10, non_zero, replace=TRUE)
j <- sample(1:10, non_zero, replace=TRUE)
x <- sample(1:5, non_zero, replace=TRUE)
m <- sparseMatrix(i=i,j=j,x=x) #Rows are movies, columns are users
m <- drop0(m)

fast_row_normalize <- function(m){
  d <- Diagonal(x=1/sqrt(rowSums(m^2)))
  return(t(crossprod(m, d)))
}

test <- fast_row_normalize(m)
sim <- tcrossprod(test)

as.matrix(sim)



# Calculating Similiarity using Euclidean Distance


# ```{r, eval=FALSE}
# euclidean_distance <- function(x, y) {
#   z <- sqrt(sum((x-y)^2))
#   
#   #Get the difference between each element of both vectors
#   #z <- x-y
#   #Squre the Distances
#   #z1 <- z^2
#   #Sum up the squared differences
#   #z2 <- sum(z1)
#   #z3 <- sqrt(z2)
#   
#   return (z)  
# }
# 
# user.artists_replace_NA <-  user.artists[is.na(user.artists)] <- 0
# 
# user1 <- user.artists[1,]
# user2 <- user.artists[2,]
# user3 <- user.artists[3,]
# 
# 
# 
# euclidean_distance(user1, user2)
# euclidean_distance(user1, user3)
# euclidean_distance(user3, user2)
# euclidean_distance(user1, user1)
# 
# user.artists <- user.artists[1:10, 1:10]
# View(user.artists)
# 
# dist(user.artists)
# 
# x <- matrix(rnorm(100), nrow = 5)
# View(x)
# ```
