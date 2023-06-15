# Setup inicial
library(ggplot2)

setwd("/Users/Guisu/Documents/Tecnico/PE/PE-Project/3ex/")

# Ler o ficheiro de input

input <- read.table("GENDER_EMP_19032023152556091.txt", sep = '\t', header = TRUE)

# Filtrar os dados
data_country <- subset(input, COU == "CZE")
data_country <- input[input$COU == "CZE", ]
data_ind <- subset(data_country, IND == "EMP3")
data_year <- subset(data_ind, Time == "2019")
data_sex <- subset(data_year, Sex == "Men" | Sex == "Women")
data_age <- subset(data_sex, Age.Group == "15-24" | Age.Group == "25-54" | Age.Group == "55-64")

ggplot(data_age, aes(Age.Group, Value, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs("Taxa de Desemprego entre homens e mulheres por grupo etário") +
  xlab("Grupos etários") +
  ylab("Taxa de Desemprego (%)")
