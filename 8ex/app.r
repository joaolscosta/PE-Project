library(ggplot2)

# X ~ Cauchy(loc = -3,scale = 1.8)

location <- -3
scale <- 1.8
n <- 185

set.seed(1280)

x <- rcauchy(n, location, scale)

# Os valores gerados ordenados por ordem crescente
x_ordered <- sort(x)

sequence <- c()
for (i in 1:n) {
    sequence[i] <- i/(n + i)
}

# Quantis de probabilidade
p_quantiles <- qcauchy(p = sequence, location, scale)

norm <- rnorm(n, 1.8, 2.6)

# gerar o grafico
ggplot() +
    geom_point(aes(x = x_ordered, y = p_quantiles), color = "blue") +
    geom_point(aes(x = x_ordered, y = norm), color = "green") +
    geom_abline(intercept = 0, slope = 1, color = "black") +
    labs(x = "Valores ordenados", y = "Quantis de probabilidade", title = "Normal x Cauchy", subtitle = "Azul para a população normal e verde para a população de Cauchy") +
    theme_bw()
