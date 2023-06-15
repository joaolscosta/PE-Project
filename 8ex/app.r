library(ggplot2)

# X ~ Cauchy(loc = -3,scale = 1.8)

location <- -3
scale <- 1.8

set.seed(1280)

x <- rcauchy(186, location, scale)

# Os valores gerados ordenados por ordem crescente
x_ordered <- sort(x)

sequence <- list()
for (i in 1:185) {
    sequence[[i]] <- i/(185 + i)
}

# Quantis de probabilidade
p_quantiles <- qcauchy(sequence, location, scale)

norm <- rnorm(186, 1.8, 2.6)

# gerar o grafico
ggplot() +
    geom_point(aes(x = x_ordered, y = p_quantiles), color = "blue") +
    geom_point(aes(x = x_ordered, y = norm), color = "green") +
    geom_abline(intercept = 0, slope = 1, color = "black") +
    labs(x = "Valores ordenados", y = "Quantis de probabilidade") +
    theme_bw()

# acho q ta pronto mas o costa desistiu da vida dele :)