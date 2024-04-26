## Statplace

## Script - Análise de Correspondência Múltipla

## Caso I - Publishers e os gêneros de games nas plataformas

# Instalação dos pacotes
install.packages('FactoMineR')
install.packages('factoextra')
install.packages('ggplot2')
# 
require(FactoMineR)
require(factoextra)
require(ggplot2)


# Dados

# Variáveis Plataforma, Gênero e Publicadora/Empresa
# Plataformas PS4 e PS3 (Playstation) & Xbox One e Xbox 360 (Microsoft)
# Publisher Microsoft e Sony

base_vdg <- read.csv("base_vdg.csv")

base_vdg <- base_vdg[,-1] # retirando a variável ID

## Análise de Correspondência Múltipla

# MCA
res_mca <- MCA(base_vdg, graph = FALSE)

# Scree-plot
fviz_screeplot(res_mca, addlabels = TRUE, ylim = c(0, 40))

# Gráfico das variáveis
fviz_mca_var(res_mca, choice = "mca.cor", 
             repel = TRUE, # retirar sobreposição 
             ggtheme = theme_minimal()) + labs(title = "MCA - Variáveis")


# Gráfico das categorias
fviz_mca_var(res_mca, col.var="black", shape.var = 1,
             repel = TRUE)

# Cos2 
# Representa a qualidade da representação das variáveis no mapa de fatores.
# Mede o grau de associação entre as categorias de variáveis e um determinado eixo.
fviz_cos2(res_mca, choice = "var", axes = 1:2) + labs(x="",y = "", title = "")

# Contribuição
# Os valores da contribuição para a definição das dimensões.
fviz_contrib(res_mca, choice = "var", axes = 1:2, top = 15, ggtheme = theme_minimal(base_size = 18)) + labs(y="Contribuições (%)",title="")


# Gráfico de Correspondência - pontos e elipses
fviz_mca_biplot(res_mca, 
                geom.ind = "point",   # add pontos
                habillage = 3,        # colorir os pontos de acordo com os grupos
                addEllipses = TRUE,   # elipses
                col.var = "Black",     # cor das categorias das variáveis
                palette = c("green","blue"), # cores a serem usadas para representar os grupos
                title = "",                 # titulo
                legend.title = "Publisher",  # titulo dos grupos (legenda)
                mean.point = FALSE,           # retira centroide das elipses
                repel = TRUE                 # evita sobreposição
)

