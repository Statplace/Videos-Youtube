## Instalando os pacotes ------
install.packages("ggplot2")
install.packages("survival")
install.packages("ggalt")

## Carregando pacotes ------
library(dplyr)
library(ggplot2)
library(ggalt)
library(survival)

## Carregando os dados ----------

## Dados de leucemia mieloide aguda
dados <- aml


# Ajuste um modelo de sobrevivência de Kaplan-Meier
km_fit <- survfit(Surv(time, status) ~ 1, data = dados)

summary(km_fit)



# Crie um data frame com os resultados do Kaplan-Meier
km_df <- data.frame(
  time = km_fit$time,
  surv = km_fit$surv,
  lower = km_fit$lower,
  upper = km_fit$upper
)

# Crie o gráfico com geom_ribbon() para intervalos de confiança
ggplot(km_df, aes(x = time, y = surv)) +
  geom_line(color = "black") +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "skyblue", alpha = 0.3) +
  labs(
    title = "Curva de Kaplan-Meier com Intervalo de Confiança",
    x = "Tempo",
    y = "Probabilidade de Sobrevivência"
  ) +
  theme_bw(12)

## Usando a função stat_stepribbon() para o cálculo da faixa
## Intervalos com formato de escada
ggplot(km_df, aes(x = time, y = surv)) +
  geom_line(color = "black") +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "skyblue" , stat = "stepribbon", alpha = .3, size = .1) +
  labs(
    title = "Curva de Kaplan-Meier com Intervalo de Confiança",
    x = "Tempo",
    y = "Probabilidade de Sobrevivência"
  ) +
  theme_bw(12)
