
## Oper

## Script - Análise de Correspondência Simples

## Caso I

# Instalação dos pacotes
install.packages('FactoMineR')
install.packages('factoextra')
install.packages('tidyverse')
install.packages('ggplot2')
install.packages('readxl')


require(FactoMineR)
require(factoextra)
require(tidyverse)
require(ggplot2)
library(tidyverse)
library(readxl)

# Dados

# Leitura da base de dados
df_invest <- read_excel("dados_investimento.xlsx")

# -------------------------------------------------

## Análise de Correspondência Simples 


# CA
res_CA <- table(df_invest$PERFIL, df_invest$APLICACAO)

# Biplot
res.ca.invest <- CA(res_CA)

# Outra forma 
grafico <- plot(res.ca.invest)
grafico + theme(panel.grid.major = element_blank(),
                plot.title=element_text(size=10, color="blue"),
                axis.title = element_text(size=10, color="red")) + ggtitle("")
