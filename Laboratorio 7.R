# crear un vector

peliculas <- c('Toy Story','El club de la pelea','Dia de entrenamiento') # se puede usar =
peliculas


# verificar elementos

peliculas == 'Argo'
peliculas == 'El club de la pelea'
peliculas == 'el club de la pelea' #significa que la escritura debe ser exacta

# Extraer elementos por su posicion
peliculas[1]
peliculas[2]

estrenos = c(1995,1985,1999)

# add elementos a la lista
peliculas[4]='Magallanes'
peliculas[5]='La ultima tarde'
peliculas[6]='Retablo'


peliculas

estrenos = c(1995,1985,1999,2015:2017) # add valores sucesivos

estrenos

length(estrenos)  # esta lista tiene 6 elementos


dcu=c('The batman','El hombre de acero','Suicide Squad','The Flash',
      'Watchmen','Justice League','Justice League X','Aquaman','Shazam')

head(dcu) # devuelve los primeros 6 elementos u observaciones
tail(dcu) # devuelve los ultimos 6 elementos u observaciones

head(dcu,2)
tail(dcu,2)

# Ordenar
sort(dcu) #  lo ordena de A-Z (creciente)
sort(dcu,decreasing=TRUE)  # lo ordena de Z-A (decreciente)

menciones = c(599948,229547,178552,135419,85844)
min(menciones)
max(menciones)


names(menciones)= c('The Batman','Doctor Strange','Thor','Spiderman',
                    'Black Panther')
menciones

menciones[c('The Batman','Spiderman')]

 # le estoy sumando a un elemento en particular
menciones [3]= menciones[3]+100000
menciones

# para todos los elementos

menciones = menciones + 45000
menciones



summary(menciones) # detalle estadistico de su lista

# PREGUNTITAS
estrenos
# actualizar el valor de 1999 a 2000
estrenos[3]= estrenos[3]+1
estrenos
estrenos[3]=2001
estrenos


estrenos [c(2,5)] # ESTO EXTRAE SOLO LOS ELEMENTOS 2 Y 5
  
estrenos[2:5] # ESTO EXTRAE ELEMENTOS DEL 2 AL 5

estrenos[c(2:4)]
length(menciones)

menciones[-5] # me muestra todos los elementos menos el quinto
menciones[-1]

menciones[-5:-3]  

restricciones = c(14,12,10,NA,14,NA)
is.na(restricciones) # me dara como resultado la posicion en la que se encuentra los NA

peliculas[7]='Volver al futuro'
peliculas[8]='El padrino'

genero=c('Animacion','Comedia','Accion','Comedia','Drama','Drama','Ficcion',
         'Drama')

genero=as.factor(genero)



levels(genero) # nos muestra los valores unicos o categorias
summary(genero) # el resumen o recuento de cada elemento

sort(summary(genero),decreasing=TRUE)


# listas
lista1=list('Retablo',2017,c('Drama','Ficcion','Historica'))
lista1[2]
lista1[2:3]



pelis=list(name='Volver al futuro',year='1995',
           genero=c('Drama','Ficcion','Historia'))

pelis


pelis$name
pelis$genero
pelis$year


pelis$genero[2]


pelis[2:3]


class(pelis$genero)

pelis[['restriccion']]=5 # nuevo elemento en la lista
pelis

pelis[['restriccion1']]=6
pelis

pelis[['restriccion1']]=NULL # para eliminar
pelis


# concatenar doslistas

peli1=list(name='Gol')
peli2=list(year=2003,genero=c('Ficcion','Drama','Deporte'))

peli=c(peli1,peli2)
peli



# DATAFRAME

pelis= data.frame(pelicula=c('Toy Story','Breakfast club','Pulp fiction',
                             'Be cool','Ciudad de dios','Dias de Santiago',
                             'Goodfellas'),year=c(1995,1985,1999,2017,1980,
                                                  2005,1984),
                  stringsAsFactors = F)

pelis

# PREGUNTITAS


pelis$pelicula # es la manera para extraer toda variable del df
pelis$year



pelis[1,2] # elemento de la fila 1 y columna 2
pelis[,2] # todos los elementos de la 2da columna
pelis[1,] # todos los elementos de la primera fila

head(pelis)
tail(pelis)

# Crear un filtro o condicion
seleccion=pelis['pelicula']=='Goodfellas' 

x=pelis[seleccion,c('pelicula','year')]

x

pelis['duracion']=c(80,110,120,180,90,130,170)
pelis


pelis=rbind(pelis,c(pelicula='El conjuro',year='2013',
                    duracion=100))
pelis

getwd()

data=read.csv('movies.csv',header=TRUE,sep=',')


# CONDICIONALES

year=2002
if (year>2000){
  print ('La peli fue desarrollada dsps de los 90s')
}

year=1997
if (year<2000 & year>1990) {
  print ('La peli fue desarrollada en los 90s')
}


# iteracion
years=data['Year']
for (val in years){
  print (val)
}


i=1

while (i<=5){
  print (data[i,]$Film) 
  i=i+1
}

# Funciones

calif = function(calificacion, umbral = 70){
  if (calificacion<umbral){
    return ('NO LA VEAS!')
    }else{
      return ('MIRALA, ES BUENA PELI')
    }
}

calif(87)

data
recomendacion = function(datos,pelicula){
  C=datos[datos['Film']==pelicula,'Rotten.Tomatoes..']
  return(calif(C))
}

recomendacion(data,'WALL-E')






getwd()
setwd()






