## Statplace

## Script Case Prático - Lubridate
# 
## Instalando e carregando pacotes

install.packages('tidyverse') # maneira mais fácil de instalar o pacote
install.packages('lubridate') # maneira alternativa, instalar o próprio pacote

library(tidyverse)
library(lubridate)


# date() e as_date() convertem string para data


# date() as_date() assumem o padrão da língua inglesa (ano-mes-dia)


x <- date('2022-03-20')
as_date('2022-03-20')

class(x)

# Criando objetos com classe "date" diante de números e strings
dmy(20022022)
dmy("20022022")
dmy("20/02/2022")
dmy("20.02.2022")


# Caso seja preciso informar o horário
ymd_h(2022022016)  # data, hora 

ymd_hm(202202201630)  # data, hora e minutos

ymd_hms(20220220163025) # data, hora, minutos e segundos 


# Transformando uma string em data
bd_data <- as.Date("2022-02-22")
class(bd_data)
bd_data


## Funções úteis

data_exemplo <- ymd_hms('2022-02-20 163045')
data_exemplo

# Extrai o Mês
month(data_exemplo)

# Extrai o Ano
year(data_exemplo)

# Extrai o Dia
day(data_exemplo)

# Extrai os minutos
minute(data_exemplo)

# Extrai os segundos
second(data_exemplo)


# Adicionar um componente a uma data
bd_exemplo_data <- dmy("20/02/2022")
bd_exemplo_data

hour(bd_exemplo_data) <- 08

bd_exemplo_data
