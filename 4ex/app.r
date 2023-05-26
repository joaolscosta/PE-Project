# 1 - Fixando a semente em 3235, gere uma amostra de dimensão k = 1820
# proveniente de uma distribuição Exponencial de parâmetro lambda = 27.
# Os valores gerados correspondem aos tempos entre acontecimentos sucessivos.

set.seed(3235)

k <- 1820
lambda <- 27

# Gerar a amostra
amostra <- rexp(k, lambda)

# 2 - Considere agora a soma sucessiva destas observações,
# i.e., se xi designar o i-ésimo valor gerado, então xj = x1 + x2 + ... + xj
# é o instante da ocorrência do j-ésimo acontecimento.
# Seja T = x1820 o menor número inteiro maior ou igual ao instante
# da ocorrência do último acontecimento.

T <- ceiling(sum(amostra))

# 3 - Divida o intervalo [0,T] em intervalos de amplitude unitária e contabilize
# o número de acontecimentos que ocorrem em cada um desses subintervalos.

# Dividir o intervalo [0,T] em intervalos de amplitude unitária
intervalos <- seq(0, T, 1)

# Contabilizar o número de acontecimentos que ocorrem em cada um desses subintervalos
contagem <- rep(0, length(intervalos))

for (i in 1:length(intervalos)) {
  contagem[i] <- sum(amostra <= intervalos[i])
}

# 4 - Calcule a média do número de acontecimentos por subdivisão
# e de seguida calcule o desvio absoluto entre este valor e o valor esperado
# (teórico) do número de acontecimentos num subintervalo. Indique
# este desvio arrendondado a 4 casas decimais.

# Média do número de acontecimentos por subdivisão
media <- mean(contagem)

# Valor esperado (teórico) do número de acontecimentos num subintervalo
valor_esperado <- lambda

# Desvio absoluto entre este valor e o valor esperado (teórico)
# do número de acontecimentos num subintervalo
desvio <- abs(media - valor_esperado)

# Indicar este desvio arrendondado a 4 casas decimais
print(round(desvio, 4))

# Resposta: 1767.366