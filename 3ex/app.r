# Setup inicial
setwd("/home/gui_marc/Documents/IST/PE/PE-Project/3ex")

# Ler o ficheiro de input

input <- read.table("GENDER_EMP_19032023152556091.txt", sep = '\t', header = TRUE)

# Filtrar os dados
data_country <- subset(input, COU == "CZE")
data_country <- input[input$COU == "CZE", ]
data_ind <- subset(data_country, IND == "EMP3")
data_year <- subset(data_ind, Time == "2019")
data_sex <- subset(data_year, Sex = "ALL PERSONS" )

print(input)