# 
## Oper

## Script - Análise de Correspondência Simples

## Caso II

# --------------------------------------

# Instalação dos pacotes
install.packages('FactoMineR')
install.packages('factoextra')
install.packages('tidyverse')
install.packages('ggplot2')
install.packages('readr')

require(FactoMineR)
require(factoextra)
require(tidyverse)
require(ggplot2)
require(readr)

# --------------------------------------

# Dados

# Leitura da base de dados

dados_mg1 <- readRDS("dados_mg1.rds")
head(dados_mg1)

--------------------------------------

## Análise de Correspondência Simples 

# Selecionando as variáveis
df_mg1 <- dados_mg1 %>%
  select(tpraca,tpescola)
# 
head(df_mg1)

# CA
res_ca01 <- table(df_mg1$tpraca, df_mg1$tpescola)


# Biplot
res.ca <- CA(res_ca01)

# Outra forma de obter o Biplot
grafico <- plot(res.ca)
grafico + theme(panel.grid.major = element_blank(),
           plot.title=element_text(size=10, color="blue"),
           axis.title = element_text(size=10, color="red")) + ggtitle("")
