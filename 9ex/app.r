set.seed(1497)  # Define a semente aleatória para reprodução dos resultados

n_values <- c(30, 50, 100, 200, 300, 500, 1000)  # Tamanhos da amostra

k <- 2500  # Número de amostras

differences <- vector("numeric", length(n_values))  # Vetor para armazenar as diferenças médias

# Para cada tamanho de amostra
for (i in 1:length(n_values)) {
  n <- n_values[i]
  method1_intervals <- vector("numeric", k)  # Vetor para armazenar os intervalos pelo método 1
  method2_intervals <- vector("numeric", k)  # Vetor para armazenar os intervalos pelo método 2
  
  # Para cada amostra
  for (j in 1:k) {
    samples <- rbinom(n, 1, 0.5)  # Gera uma amostra de uma distribuição de Bernoulli com p = 0.5
    x_bar <- mean(samples)  # Calcula a média amostral
    
    # Método 1
    z <- qnorm((1 + 0.97) / 2)  # Calcula o valor de z
    p_hat <- x_bar
    method1_intervals[j] <- p_hat + c(-1, 1) * sqrt(p_hat * (1 - p_hat) / n) * z
    
    # Método 2
    p_hat <- x_bar
    method2_intervals[j] <- p_hat + c(-1, 1) * sqrt(p_hat * (1 - p_hat) / n)
  }
  
  # Calcula as diferenças médias
  differences[i] <- mean(method2_intervals - method1_intervals)
}

# Constrói o gráfico
plot(n_values, differences, type = "b", xlab = "Tamanho da Amostra", ylab = "Diferenças Médias",
     main = "Diferenças Médias entre os Métodos 2 e 1 de Intervalo de Confiança")
