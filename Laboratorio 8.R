mtcars # es un dataset propio de R
data() # es para ver todos los datasets

?mtcars

# Instalar paquete para graficos
install.packages('ggplot2')
library(ggplot2)

# Dos comandos muy importantes qplot y ggplot
# Grafico de barras
qplot(data=mtcars,x=cyl,geom='bar')

recuento=table(mtcars$cyl)
barplot(recuento)

install.packages('ggplot2',dependencies = TRUE)

qplot(data=mtcars,x=cyl,geom='bar')
ggplot(mtcars,aes(x=hp,y=mpg,color=factor(cyl),
                  shape=factor(cyl)))+
  geom_point(size=2)


# continuando con qplot

qplot(data=mtcars,x=cyl,geom='bar') # grafico clasico
qplot(mtcars$cyl,geom='bar',fill=I('blue'),
      colour=I('red'))  # colour es para los bordes

qplot(mtcars$cyl,geom='bar',fill=I('steelblue'))


qplot(mtcars$cyl,geom='bar',fill=I('steelblue'),
      xlab='Cilindros',ylab='Total',
      main='Total de carros por cilindros')

# Grafico de histogramas
qplot(mtcars$hp,geom='histogram') # basico
qplot(mtcars$hp,geom='histogram',binwidth=25)
qplot(mtcars$hp,geom='histogram',binwidth=25,
      colour=I('black'))
qplot(mtcars$hp,geom='histogram',binwidth=25,
      colour=I('black'), xlim=c(80,200))

# PREGUNTITAS
# GRAFICO DE HISTOGRAMA CON NOMBRE DE EJE X, NOMBRE DE EJEY,
# TITULO Y COLOR PARA LAS BARRAS.

qplot(mtcars$hp,geom='histogram',bindwidth=25,
      colour=I('green'),fill=I('yellow'),
      xlab='Caballos de fuerza',ylab='Total',
      main='Total de carros x HP')

# Graficos pastel y variacion del grafico de barras
install.packages('tidyverse')
library(tidyverse)

#%>%
data(mtcars) # para guardar en el environment
mtcars = mtcars %>%
  mutate(cyl_f=as.factor((cyl)))

view(mtcars)

ggplot(data=mtcars,aes(x=cyl_f,
                       fill=cyl_f))+
  geom_bar(position ='dodge')

ggplot(data=mtcars,aes(x='',
                       fill=cyl_f))+
  geom_bar(position ='stack') +
  coord_polar(theta='y') +
  theme_void() # grafico simple

ggplot(data=mtcars,aes(x='',
                       fill=cyl_f))+
  geom_bar(position ='stack') # agrupamiento en una sola barra
  
ggplot(data=mtcars,aes(x='',
                       fill=cyl_f))+
  geom_bar(position ='stack') +
  coord_polar(theta='y') +
  scale_fill_brewer(palette='Dark2')
  theme_minimal()


# Grafico de dispersion
  
qplot(mpg,wt,data=mtcars) # simple
ggplot(mtcars,aes(x=mpg,y=wt))+geom_point() # mismo graf con ggplot
ggplot(mtcars,aes(x=mpg,y=wt))+geom_point(shape=25)
# El shape con indicaciones numericas es hasta el 25


ggplot(mtcars,aes(x=mpg,y=wt,shape=cyl_f))+geom_point()
ggplot(mtcars,aes(x=mpg,y=wt,shape=cyl_f,color=cyl_f))+geom_point()

ggplot(mtcars,aes(x=mpg,y=wt,shape=cyl_f))+geom_point(color='steelblue')


ggplot(mtcars, aes(x=mpg,y=wt,color=cyl_f))+
  geom_point()+
  xlab('Millas por galon')+
  ylab('Peso')+
  labs(colour='Cilindros')+
  ggtitle('Comparacion entre MPG y Peso de los autos')
















