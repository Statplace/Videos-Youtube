## Statplace 

## Caso Prático - Pacote corrmorant

# Matrizes de correlação flexíveis baseadas em ggplot2

# Instalando e carregando pacotes

install.packages('remotes') # pacote remotes necessário para instalar via github
remotes::install_github('r-link/corrmorant') # instalando o pacote via o repositório do github

install.packages('ggplot2')

library(corrmorant)
library(ggplot2)

## Dados

# Drosera: É um pacote de dados que fornece uma alternativa botânica para o famoso conjunto de dados íris de Anderson e Fisher

# Instalando o pacote de dados drosera
remotes::install_github('r-link/drosera')
library(drosera)

drosera
dados <- drosera
head(drosera)

## Exemplo

# Gráfico de correlação com a base de dados "drosera" usando o estilo "light"

# Gráfico de correlação (estilo "light")
corrmorant(drosera, style = 'light')

# Gráfico de correlação (estilo "dark")
corrmorant(drosera, style = 'dark')

# Gráfico de correlação (estilo "blue_red")
corrmorant(drosera, style = "blue_red")

# Observação: Esta ilustração não é ótima porque as três espécies diferentes de Drosera têm morfologias foliares notavelmente diferente

# Gráficos mais complexos com diferentes correlações para diferentes grupos são possíveis com ggcorrm()

ggcorrm(drosera) +
  lotri(geom_point(alpha = 0.5)) +
  utri_corrtext() +
  dia_names(y_pos = 0.15, size = 3) +
  dia_density(lower = 0.3, fill = "grey80", color = 1)

plot1 <- ggcorrm(drosera) +
  lotri(geom_point(alpha = 0.5)) +
  utri_corrtext() +
  dia_names(y_pos = 0.15, size = 4) +
  dia_density(lower = 0.3, fill = "skyblue", color = 1)

# É possível add camadas ggplot2 usando seletores de corrmorant apropriados para restringi-los ao conjunto apropriado
# É possível exibir uma tendência linear
plot1 + lotri(geom_smooth(method = "lm"))

# Espécies sundew 
# Infos sobre 3 espécies em cores diferentes

ggcorrm(drosera, 
        mapping = aes(
          col = species, 
          fill = species)) +
  lotri(geom_smooth(method = "lm")) +
  lotri(geom_point(alpha = 0.5)) +
  utri_corrtext(nrow =2, squeeze = 0.6) +
  dia_names(y_pos = 0.15, size = 3) +
  dia_density(lower = 0.3, color = 1)


# Correlação com heatmap
library(tidyverse)

select(mtcars, mpg, disp:qsec) %>% 
  ggcorrm(rescale = "by_sd") +
  utri_heatmap(alpha = 0.5) +
  lotri_heatcircle(alpha = 0.5, col = 1) +
  utri_corrtext() +
  dia_names(y_pos = 0.15, size = 4) +
  dia_density(lower = 0.3, fill = "#00AFEF", color = 1) +
  scale_fill_corr() 

