
## Statplace

## Script - Análise de Correspondência Múltipla

## Caso II - Dados do ENEM 2018 (MG)


# Instalação dos pacotes
install.packages('FactoMineR')
install.packages('factoextra')
install.packages('tidyverse')
install.packages('ggplot2')
install.packages('readr')

require(FactoMineR)
require(factoextra)
require(ggplot2)
require(readr)
require(tidyverse)

# Dados

# Base de dados ENEM 2018 dos inscritos residentes do estado de Minas Gerais (MG).

# Leitura da base de dados
dados_mg1 <- readRDS("dados_mg1.rds")
head(dados_mg1)

# Selecionando as variáveis
df_mg1 <- dados_mg1 %>%
  select(sex,tpraca,tpescola)

head(df_mg1)

# MCA
mca_teste <- MCA(df_mg1, graph = FALSE)

# Scree-plot 
fviz_screeplot(mca_teste, addlabels = TRUE, ylim = c(0, 45)) + ggtitle("")

# Biplot

# variáveis/categorias
fviz_mca_var(mca_teste, repel = TRUE, col.var = "Black", title = "")

fviz_mca_biplot(mca_teste, 
                geom.ind = "point",
                habillage = 3,
                addEllipses = TRUE,
                col.var = "Black",
                palette = c("#3D7BBD","#57B952", "red", "#daa520"),
                title = "",
                legend.title = "Escola",
                mean.point = FALSE,
                repel = TRUE
)

