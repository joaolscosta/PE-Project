# Instale o pacote "readxl" se ainda não estiver instalado
# install.packages("readxl")
library(rio)

library(readxl)
# Instale o pacote "ggplot2" se ainda não estiver instalado
# install.packages("ggplot2")
library(ggplot2)

# Leitura dos dados do arquivo econ.xlsx
dados <- import("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/econ.xlsx")

# Converter o campo de data para o formato correto (caso necessário)
dados$tempo <- as.Date(dados$tempo)

# Filtrar as observações a partir de um determinado ano
dados_filtrados <- subset(dados, format(tempo, "%Y") >= "1981")

# Cálculo da média e desvio-padrão para as variáveis selecionadas
media_ddesemp <- mean(dados_filtrados$ddesemp)
desvio_ddesemp <- sd(dados_filtrados$ddesemp)
media_ndesemp <- mean(dados_filtrados$ndesemp)
desvio_ndesemp <- sd(dados_filtrados$ndesemp)

# Transformação dos dados associados a cada variável Xk: zik = (xik - x¯ks) / sxk
dados_filtrados$ddesemp_transformado <- (dados_filtrados$ddesemp - media_ddesemp) / desvio_ddesemp
dados_filtrados$ndesemp_transformado <- (dados_filtrados$ndesemp - media_ndesemp) / desvio_ndesemp

# Criação do gráfico utilizando o pacote ggplot2
grafico <- ggplot(dados_filtrados, aes(x = tempo)) +
  geom_line(aes(y = ddesemp_transformado, color = "Duração Mediana do Desemprego")) +
  geom_line(aes(y = ndesemp_transformado, color = "Número de Desempregados")) +
  labs(x = "Ano", y = "Valores Transformados", color = "Variável") +
  scale_color_manual(values = c("Duração Mediana do Desemprego" = "blue", "Número de Desempregados" = "red")) +
  theme_minimal()

print(grafico)

#Salvar em PDF
# ggsave("/home/belchior/classes/grafico.pdf", plot = grafico)
