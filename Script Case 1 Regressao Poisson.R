
# Oper

# Script - Caso prático 1 - Regressão de Poisson

# Instalação dos pacotes
install.packages('ISwR')
install.packages('AER')

library(ISwR)
require(AER)

# Dados
data(eba1977)

dados = eba1977
colnames(dados) <- c("Cidade", "Idade", "População", "N_casos")

# Medidas resumo
summary(dados)

# Suposição de Equidispersão
mean(dados$N_casos) # media

var(dados$N_casos) # variância

# A média e variância são bem próximas, podemos ajustar o modelo e continuar verificando a equidispersão.

require(stats)
# Ajuste do modelo
modelo <- glm(N_casos ~ Cidade + Idade + offset(log(População)), family = poisson(link = "log"), data = dados)
summary(modelo)

# Uma forma de testar a equidispersão 
dispersiontest(modelo,  alternative = c("two.sided"))

# H0: Equidispersão
# H1: superdispersão e/ou subdispersão


tabela <- cbind(exp(coef(modelo)), 
                exp(summary(modelo)$coeff[,1]-(1.96*summary(modelo)$coeff[,2])),
                exp(summary(modelo)$coeff[,1]+(1.96*summary(modelo)$coeff[,2]))
                )
colnames(tabela) <- c("Exp(Coef)", "L.I", "L.S")

tabela
# 

