seed <- 1497
n_values <- c(30,50,100,200,300,500,1000) # tamanho das amostras

k <- 2500 # amostras
p <- 0.5 # parametro da bernoulli
y <- 0.97 # nivel de confianca

z <- qnorm((1 + y) / 2)

# Fixe a semente em 1497
set.seed(seed)

# Gerar k = 2500 amostras de tamanho n para cada valor de n
amostras <- list()
for (n in n_values) {
    # Gerar uma amostra de tamanho n
    amostra <- rbinom(k, size = n, prob = p)
    amostras[[as.character(n)]] <- amostra
}

# Metodo 1
z <- qnorm((1 + y) / 2)
# ap^2 + bp + c = 0
a <- 1
calc_b = function (X,n) {
    return(- ((z ^ 2) * (p * (1 - p) / n) + (2 * X)))
}
calc_method_1 = function (X, n) {
    b <- calc_b(X, n) 
    c <- X ^ 2
    delta <- b ^ 2 - 4 * a * c
    x1 <- (-b + sqrt(delta)) / (2 * a)
    x2 <- (-b - sqrt(delta)) / (2 * a)
    return(c(x1, x2))
}

lista_diferenças <- list()
# Calcular a diferença entre os metodos 1 e 2
for (n in n_values) {
    X <- mean(amostras[[as.character(n)]])

    # Metodo 1
    m1 <- calc_method_1(X,n)
    comp_m1 <- abs(m1[2] - m1[1])
    

    # Metodo 2
    desvio_padrao <- sd(amostras[[as.character(n)]])
    valor_critico <- qnorm(1- (1-y)/2)
    erro_padrao <- desvio_padrao / sqrt(n)
    m2 <- c(X - valor_critico * erro_padrao,  X + valor_critico * erro_padrao)
    comp_m2 <- abs(m2[2] - m2[1])
    

    diferença <- abs(comp_m1 - comp_m2)
    lista_diferenças[[as.character(n)]] <- diferença
} 

diferenças <- unlist(lista_diferenças)
media_diff <- mean(diferenças)

# 0.6345631