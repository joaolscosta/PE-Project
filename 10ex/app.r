set.seed(2010)

alpha <- 0.04 # nivel de significancia
h0 <- 49.7 # nula
h1 <- 50.7 # alternativa
sigma <- 2 #desvio-padrao
m <- 300 #amostras
n <- 21 # dimensão

amostras <- matrix(rnorm(m * n, mean = h1, sd = sigma), linha = n)

resultados <- numeric(m)

for (i in 1:m) {
  t_test <- t.test(amostras[, i], mu = h0) # ttest de uma das amostras
  valorp <- t_test$p.value # extrai valor-p dessa amostra
  resultados[i] <- ifelse(valorp > alpha, 1, 0) # verifica se se rejeita (1 para não rejeitar h0)
}

prob_n_rejeicao <- mean(resultados)

cat("Estimativa da probabilidade de não rejeição de H0:", round(prob_n_rejeicao, 3))

# Resposta: 0.447