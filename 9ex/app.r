seed <- 1497
n_values <- c(30,50,100,200,300,500,1000)

k <- 2500
p <- 0.5
y <- 0.97

z <- qnorm((1 + y) / 2)

# Fixe a semente em 1497
set.seed(seed)

# Gerar k = 2500 amostras de tamanho n para cada valor de n
samples <- list()
for (n in n_values) {
    # Gerar uma amostra de tamanho n
    sample <- rbinom(k, size = n, prob = p)
    samples[[as.character(n )]] <- sample
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

#Método 2
calc_method_2 = function (n){
    return qbinom((1 + y) / 2, size = n, prob = p)
}
diff_list <- list()
# Calcular a diferença entre os metodos 1 e 2
for (n in n_values) {
    X <- mean(samples[[as.character(n)]])

    # Metodo 1
    m1 <- calc_method_1(X,n)
    comp_m1 <- abs(m1[2] - m1[1])
    #t1 <- t.test(samples[[as.character(n)]], conf.level = y)
    #intervalo_m1 <- t1$conf.int

    # Metodo 2
    m2 <- calc_method_2(n)
    comp_m2 <- abs(m2[2] - m2[1])
    #t2 <- t.test(samples[[as.character(n)]], conf.level = y)    
    #intervalo_m2 <- t2$conf.int

    diff <- abs(comp_m1 - comp_m2)
    diff_list[[as.character(n)]] <- diff
} 

differences <- unlist(lista_diferenças)
mean_differences <- mean(differences)
