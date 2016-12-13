# install.packages("combinat")
# library(combinat)
# 16777215

n <- 24
k <- 24
s <- 0
for (i in 1:k) {
        s <- s + dim(combn(n, i))[2]
}
s

