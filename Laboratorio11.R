# llamamos a la base de datos
df=read.csv('vuelos.csv')

# libreria
library(tidyverse)

# conceptos basicos de agrupamientos

prom_dem=df %>%
  group_by(Reporting_Airline,DayOfWeek) %>%
  summarize(prom=mean(ArrDelayMinutes))
head(prom_dem)

df_ordenado= prom_dem%>%
  arrange(desc(prom))

# Relacion linea entre variables
library(ggplot2)

ggplot(data=df,mapping=aes(x=DepDelayMinutes,y=ArrDelayMinutes))+
  geom_point()+
  geom_smooth(method='lm',na.rm=TRUE)


ggplot(data=df,mapping=aes(x=WeatherDelay,y=ArrDelayMinutes))+
  geom_point()+
  geom_smooth(method='lm',na.rm=TRUE)

cor(df$DepDelayMinutes,df$ArrDelayMinutes)
cor(df$WeatherDelay,df$ArrDelayMinutes,use='complete.obs')


# Correlacion
# crear matriz de correlacion
df %>%
  select(DepDelayMinutes,ArrDelayMinutes) %>%
  cor(method='pearson')

# Correlacion con p value
df %>%
  cor.test(~DepDelayMinutes+ArrDelayMinutes,data=.)

correlacion=df %>%
  select(ArrDelayMinutes,DepDelayMinutes,CarrierDelay,
         WeatherDelay,NASDelay,SecurityDelay,LateAircraftDelay) %>%
  cor(use='pairwise.complete.obs',method='pearson')


correlacion

library(corrplot)
df2=df%>%
  select(ArrDelayMinutes,DepDelayMinutes,CarrierDelay,
         WeatherDelay,NASDelay,SecurityDelay,LateAircraftDelay)

aerolineas_cor=cor(df2,method='pearson',use='pairwise.complete.obs')

colores=colorRampPalette(c('#BB4444','#EE9988','#FFFFFF',
                           '#77AADD','#4477AA'))

corrplot(aerolineas_cor,method='color',col=col(200),
         type='upper',order='hclust',addCoef.col = 'black',
         tl.col='black',tl.srt=45)

corrplot(aerolineas_cor,method='color')


# PRUEBA ANOVA
df3 = df%>%
  select(ArrDelayMinutes,Reporting_Airline)%>%
  filter(Reporting_Airline=='AA'|Reporting_Airline=='AS')

anv=aov(ArrDelayMinutes~Reporting_Airline,data=df3)
summary(anv)


# Regresion lineal
df4=df%>%
  filter(CarrierDelay!="NA",Reporting_Airline!="NA")


rl=lm(ArrDelayMinutes~DepDelayMinutes,data=df4)
summary(rl)


df5= data.frame(DepDelayMinutes=c(12,18,26))

# predecir
pred=predict(r
rl=lm(ArrDelayMinutes~DepDelayMinutes+WeatherDelayl,newdata=df5,interval='confidence')
pred

# y*= 16.5 + 0.86*DepDelayMinutes

,data=df4)
summary(rl)

rl$coefficients

install.packages('MASS')
library(MASS)

robusto=rlm(ArrDelayMinutes~DepDelayMinutes+WeatherDelay,data=df4)
robusto





ggplot(df4,aes(x=DepDelayMinutes,y=ArrDelayMinutes))+
  geom_point()+
  stat_smooth(method='lm',col='red')

df4$predicted=predict(rl)

ggplot(df4,aes(x=DepDelayMinutes,y=ArrDelayMinutes))+
  geom_smooth(method='lm',se=FALSE,color='red')+
  geom_segment(aes(xend=DepDelayMinutes,yend=predicted),alpha=.2)+
  geom_point()+
  geom_point(aes(y=predicted),shape=1)


ggplot(lm(ArrDelayMinutes~DepDelayMinutes,data=df4))+
  geom_point(aes(x=DepDelayMinutes,y=.resid))
