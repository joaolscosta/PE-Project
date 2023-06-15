set.seed(1718)

m <- 2744  # Número de amostras
n <- 13  # Tamanho das amostras

sample_sumsquares <- vector("numeric", m)  # Vetor para armazenar as somas dos quadrados das amostras

# Simulação das amostras e cálculo das somas dos quadrados
for (i in 1:m) {
  sample <- rnorm(n)  # Gera uma amostra de uma população normal
  sample_sumsquares[i] <- sum(sample^2)  # Calcula a soma dos quadrados dos valores observados
}

# Cálculo dos quantis de probabilidade 0.39
quantile_sample <- quantile(sample_sumsquares, probs = 0.39, type = 2)  # Quantil amostral
quantile_theoretical <- qchisq(0.39, df = n)  # Quantil teórico da distribuição qui-quadrado

# Diferença em valor absoluto entre os quantis
absolute_difference <- abs(quantile_sample - quantile_theoretical)

# Arredondamento da diferença a 4 casas decimais
rounded_difference <- round(absolute_difference, 4)

# Imprime o resultado
print(rounded_difference)
