# Laboratorio 10
data("mtcars")
library(tidyverse)
library(ggplot2)

mtcars = mtcars %>%
mutate(cylfactor=as.factor(cyl))

ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point(aes(color=cylfactor))+
  geom_text(aes(label=rownames(mtcars)))
# grafico con etiqueta que corrige el overlap
ggplot(mtcars,aes(x=wt,y=mpg))+
  geom_point(aes(color=cylfactor))+
  geom_text(aes(label=rownames(mtcars)),
check_overlap=TRUE,hjust='inward')


x=median(mtcars$mpg)

ggplot(mtcars,aes(x=mpg))+
  geom_histogram(bins=10)+
  labs(x='Millas x galon',
       y='Distribucion',
       title='Grafico con anotacion')+
  geom_vline(aes(xintercept=19.2),
             color='red')+
  annotate(geom='text',
           label='Mediana 19.2',
           x=21,
           y=8,
           hjust=0,
           color='red')

# Dividir graficos por tipo de variable
ggplot(mtcars,aes(x=mpg))+
  geom_histogram()+
  facet_wrap(.~cyl)

ggplot(mtcars,aes(cyl))+geom_bar()+theme_dark()
ggplot(mtcars,aes(cyl))+geom_bar()+theme_gray() 
ggplot(mtcars,aes(cyl))+geom_bar()+theme_linedraw()
ggplot(mtcars,aes(cyl))+geom_bar()+theme_void()
ggplot(mtcars,aes(cyl))+geom_bar()+theme_bw()
#minimal, light, classic


# Paletas de colores
#ACCENT, SET1,PAIRED,DARK2, BLUES,BuGn,Greens, Greys
ggplot(mtcars,aes(x=cylfactor,fill=cylfactor))+
  geom_bar()+
  scale_fill_brewer(palette='Dark2')


install.packages('ggthemes')
library(ggthemes)

# PREGUNTA 1

x=ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point()+
  xlab('Caballos de fuerza')+
  ylab('Millas x galon')+
  ggtitle('Grafico de dispersion')


x+theme_economist()+scale_color_economist()

x+theme_clean()+scale_color_colorblind()

# Otros graficos

data("mtcars")
install.packages('corrplot')
library(corrplot)


df=mtcars[,-c(8,9)] # quitamos variables dicotomica

corrplot(cor(df))
heatmap(abs(cor(df)),Rowv=NA,Colv=NA,revC = TRUE)


# Grafico barras horizontal
mtcars=mtcars%>%
  mutate(cylfactor=as.factor(cyl))
ggplot(mtcars,aes(x=cylfactor,y=cyl))+
  geom_bar(stat='identity')+
  coord_flip()


# criterios
nombre = c('A','B','C','A','B','C')
tipo= c(rep('Yes',3),rep('No',3)) (YES,YES,YES,NO,NO,NO)
valor= c(1,3,2,3,2,4)

df=data.frame(nombre=nombre,tipo=tipo,valor=valor)
ggplot()+
  geom_bar(data=df,aes(x=nombre,y=valor,fill=tipo),
           stat='identity',position='dodge')+
  coord_flip()


# GRAFICO ALFILER
grupo=factor(c('A','B','C','D','E','F',
              'G','H','I','J'))
valor=c(8,4,2,3,2,5,6,7,1,9)

df=data.frame(grupo=grupo,valor=valor)

ggplot()+
  geom_point(data=df,aes(x=valor,y=grupo,color=grupo),size=4)+
  geom_segment(data=df,aes(x=0,y=grupo,xend=valor,
                           yend=grupo,color=grupo),size=1)+
  theme(legend.position = 'none',
        axis.text.x=element_text(angle=0,vjust=0.5,hjust=0.5))+
  labs(x='valores',
       y='grupos',
       title='grafico alfiler')
  
# QUEDA PENDIENTE EL GRAFICO ALFILER VERSION 2

# GRAFICO DE AREAS
tipo = c('A','A','A','A','A',
         'B','B','B','B','B',
         'C','C','C','C','C')

year=c(2000:2004,2000:2004,2000:2004)
valor=rnorm(15,25,10)

df=data.frame(tipo=tipo,year=year,valor=valor)

ggplot(df,aes(x=year,y=valor))+
  geom_area(aes(fill=tipo))


# Grafico de burbujas
tipo=c('A','B','C','D','E','F','G','H')
x=rnorm(8,25,10)
y=rnorm(8,25,10)
size=rnorm(8,20,10)


color=c(rep('blue',2),rep('red',2),rep('orange',2),rep('yellow',2))

df=data.frame(tipo=tipo,x=x,y=y,size=size,color=color)


ggplot(df,aes(x=x,y=y,label=tipo))+
  geom_point(aes(size=size,colour=color))+
  geom_text(hjust=1,size=2)





data()


df %>% 
  filter(Month == 1) %>%
  group_by(Reporting_Airline) %>%
  summarize(prom = mean(CarrierDelay, na.rm = TRUE),
            ed = sd(CarrierDelay, na.rm = TRUE),
            count = sum(Reporting_Airline))

