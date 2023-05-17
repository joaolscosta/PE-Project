library(ggplot2)

# Setup inicial
setwd("/home/gui_marc/Documents/IST/PE/PE-Project/2ex")

# 1 - Ler o ficheiro e eliminar todos os dados referentes a África do Sul

# Ler o ficheiro
csv <- read.csv("TIME_USE_24092022.csv")

# Eliminar todos os dados referentes a África do Sul
dados <- subset(csv, País != "África do Sul")

# 2 - Gerar diagramas de extremos e quartis para os dados filtrados 

# Obter dados filtrados

dados_filtrados_sexo <- subset(dados, Sexo == "Total")
dados_ordenados <- dados_filtrados_sexo[order(dados_filtrados_sexo$Tempo),]

dados_filtrados_outros <- subset(dados_ordenados, Ocupação == "Outros")
dados_filtrados_remun <- subset(dados_ordenados, Ocupação == "Trabalho remunerado ou estudo")

# Gerar diagramas de extremos e quartis para os dados filtrados

pdf("grafico.pdf")
grafico <- boxplot(dados_filtrados_outros$Tempo, dados_filtrados_remun$Tempo, main = "Outros vs Trabalho remunerado ou estudo", ylab = "Tempo (minutos)")
dev.off()