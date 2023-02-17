# Manejo de datos
getwd()

df=read_csv('vuelos.csv',
            col_types = cols(
              'DivDistance'=col_number(),
              'DivArrDelay'=col_number()))

dim(df)
write_csv(df,'prueba.csv') # es la manera en la que exportan resultados

sapply(df,typeof)

# operador pipe

df %>%
  filter(Month==1) %>%
  group_by(Reporting_Airline) %>%
  summarize(promedio=mean(CarrierDelay,na.rm=TRUE))

df %>%
  filter(Month==1) %>%
  group_by(Reporting_Airline) %>%
  summarize(promedio=mean(CarrierDelay))


# MISSING
df%>%
  summarize(total=sum(is.na(CarrierDelay)))

map(df,~sum(is.na(.))) # calcular los missing para todas las columnas


# eliminas datos (columnas)
df1= df %>%
  select(-DivDistance,-DivArrDelay)

# eliminar filas (NA)
drop_filas=df%>%
  drop_na(CarrierDelay)


# Reemplazar los NA
df2=df%>%
  replace_na(list(CarrierDelay=0,
                  WeatherDelay=0))


df2%>%
  summarize(total=sum(is.na(WeatherDelay)))

# separar una variable
df = df%>%
  separate(FlightDate,sep='-',into=c('year','mes','dia'))




