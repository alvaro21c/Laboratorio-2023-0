# Laboratorio 9

# PREGUNTAS EN CLASE
# GRAFICO DE BARRAS COMPLETO 
library(ggplot2)
data("mtcars")
# QPLOT
qplot(data=mtcars,x=gear,geom='bar',fill=I('steelblue'),
      colour=I('black'))
# GGPLOT
ggplot(mtcars,aes(x=gear)) + geom_bar()

    

# Grafico de linea
?EuStockMarkets
data("EuStockMarkets")

ggplot(EuStockMarkets,aes(x='DATE',y='DAX')) + geom_line()

df=as.data.frame(EuStockMarkets) # para convertirlo en df
df$date=as.numeric(time(EuStockMarkets)) # este es el tipo de dato que nos conviene


ggplot(df,aes(x=date,y=DAX)) + geom_line()
ggplot(df,aes(x=date,y=DAX)) + geom_line(size=0.2,color='red')

# Muchas lineas
library(tidyverse)
ggplot(df,aes(x=date))+
  geom_line(aes(y=DAX),color='blue')+
  geom_line(aes(y=SMI),color='red')+
  scale_color_manual(name='SERIES',
                     values=c('DAX'='darkblue',
                              'SMI'='red'))


# Grafico de bajas/boxplot/grafico bigote
install.packages('plotly')
library(plotly)

x=ggplot(mtcars,aes(y=mpg))+geom_boxplot()
ggplotly(x)


ggplot(mtcars,aes(y=mpg))+geom_boxplot()

mtcars= mtcars%>%
  mutate(cylfactor=as.factor(cyl))

ggplot(mtcars,aes(x=cylfactor,y=mpg))+geom_boxplot()

# Grafico con titulo
ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point(aes(color=cylfactor))+
  labs(x='Caballos de fuerza',
       y='Millas x galon',
       color='Cilindros',
       title='Distribucion',
       subtitle='Fuente:Revista USA de 1974')


ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point(aes(color=cylfactor))+
  geom_text(aes(label=rownames(mtcars)))
















