seed <- 1497
n_values <- c(30,50,100,200,300,500,1000)

k <- 2500
p <- 0.5
y <- 0.97

z <- qnorm((1 + y) / 2)

# Fixe a semente em 1497
set.seed(seed)

calc_b = function (X,n) {
    return((X^2) - ((z ^ 2) * (p * (1 - p) / n) - (2 * p * X)))
}

for (n in n_values) {

}