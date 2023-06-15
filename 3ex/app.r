# Setup inicial
library(ggplot2)
library(rio)

# Ler o ficheiro de input
input <- import("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/GENDER_EMP_19032023152556091.txt", format = '\t', header = TRUE)

# Renomear a coluna de Age group (estava a causar um erro)
names(input)[8] = "AgeGroup"

# Filtrar os dados
data_country <- subset(input, COU == "CZE")
data_country <- input[input$COU == "CZE", ]
data_ind <- subset(data_country, IND == "EMP3")
data_year <- subset(data_ind, Time == "2019")
data_sex <- subset(data_year, Sex == "Men" | Sex == "Women")
data_age <- subset(data_sex, AgeGroup == "15-24" | AgeGroup == "25-54" | AgeGroup == "55-64")


ggplot(data_age, aes(AgeGroup, Value, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs("Taxa de Desemprego entre homens e mulheres por grupo etário") +
  xlab("Grupos etários") +
  ylab("Taxa de Desemprego (%)")
