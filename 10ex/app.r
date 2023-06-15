# Definir a semente para reprodução dos resultados
set.seed(2010)

# Parâmetros
mu <- 50.7  # Valor esperado
sigma <- 2  # Desvio padrão
n <- 21     # Tamanho da amostra
m <- 300    # Número de amostras

# Amostras numa matrix
amostras <- matrix(rnorm(n * m, mean = mu, sd = sigma), ncol = n)

# Função de Teste de Hipóteses
calc_teste_hipot <- function(amostra, nivel_significancia, hipotese_nula) {
  t  <- (mean(amostra) - hipotese_nula) / (sd(amostra) / sqrt(length(amostra)))
  p_valor <- 2 * pt(-abs(t_stat), df = length(amostra) - 1)
  resultado <- ifelse(p_valor <= nivel_significancia, "Rejeitar H0", "Não rejeitar H0")
  return(resultado)
}

# Realizar o teste de hipóteses para cada amostra
resultados <- apply(amostras, 1, calc_teste_hipot, nivel_significancia = 0.04, hipotese_nula = 49.7)

# Calcular a probabilidade de não rejeição de H0
probabilidade_nao_rejeicao <- mean(resultados == "Não rejeitar H0")

probabilidade_nao_rejeicao <- format(probabilidade_nao_rejeicao, digits = 3)

# Imprimir a probabilidade
print(paste("Probabilidade de não rejeição de H0:", probabilidade_nao_rejeicao))


