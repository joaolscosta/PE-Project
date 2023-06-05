set.seed(1340)

n <- 1062  # Tamanho da amostra
p <- 0.35  # Probabilidade de sucesso

# Função de distribuição acumulada
FX <- function(x, p) {
  ifelse(x >= 0, 1 - (1 - p)^(x + 1), 0)
}

simulated_values <- vector("numeric", n)  # Vetor para armazenar os valores simulados

for (i in 1:n) {
  u <- runif(1)  # Gera um valor aleatório uniforme no intervalo (0, 1)
  
  x <- 0  # Valor inicial de x
  while (FX(x - 1, p) >= u || FX(x, p) < u) {
    x <- x + 1  # Incrementa x até satisfazer as condições
  }

  simulated_values[i] <- x  # Armazena o valor simulado no vetor
}

mean_sample <- mean(simulated_values)  # Média amostral
sd_sample <- sd(simulated_values)  # Desvio padrão amostral

proportion <- mean(simulated_values > (mean_sample + sd_sample))

print(round(proportion, 4))
