library(rvest)
library(tidyverse)
library(xlsx)
#> Loading required package: xml2

# especificar fecha scrapeo

fecha = c("21/01/2022")

#barrio SUR

barrio1 = c("Distrito Sur")
sur <- character()

for(reviews_pages1 in 1:1){
  
  Link = paste0("https://www.idealista.com/alquiler-viviendas/castellon-de-la-plana-castello-de-la-plana/sur/pagina-", reviews_pages1,".htm")
  
  pages1 = read_html(Link)

  nombre <- pages1 %>% html_nodes(".item-link") %>% html_text()
  id <- pages1 %>% html_nodes(".item-link") %>% html_attr("href")
  precio <- pages1 %>% html_nodes(".h2-simulated") %>% html_text()
  metros <- pages1 %>% html_nodes(".item-detail:nth-child(4)") %>% html_text()
  habitaciones <- pages1 %>% html_nodes(".price-row+ .item-detail") %>% html_text()
  
  gsub("€/mes","", precio)
  
  sur = rbind(sur, data.frame(nombre, id, precio, metros, habitaciones, barrio1, fecha))
  
  print("Scraping idealista in progress")  
}


#barrio NORTE

barrio2 = c("Distrito Norte")

norte <- character()

for(reviews_pages2 in 1:1){
  
  Link = paste0("https://www.idealista.com/alquiler-viviendas/castellon-de-la-plana-castello-de-la-plana/norte/pagina-", reviews_pages2,".htm")
  
  pages2 = read_html(Link)
  
  nombre <- pages2 %>% html_nodes(".item-link") %>% html_text()
  id <- pages2 %>% html_nodes(".item-link") %>% html_attr("href")
  precio <- pages2 %>% html_nodes(".h2-simulated") %>% html_text()
  metros <- pages2 %>% html_nodes(".item-detail:nth-child(4)") %>% html_text()
  habitaciones <- pages2 %>% html_nodes(".price-row+ .item-detail") %>% html_text()
  
  norte = rbind(norte, data.frame(nombre, id, precio, metros, habitaciones, barrio2, fecha))
  
  print("Scraping idealista in progress")  
}

#barrio CENTRO

barrio3 = c("Distrito Centro")

centro <- character()

for(reviews_pages3 in 1:2){
  
  Link = paste0("https://www.idealista.com/alquiler-viviendas/castellon-de-la-plana-castello-de-la-plana/centro/pagina-", reviews_pages3,".htm")
  
  pages3 = read_html(Link)
  
  nombre <- pages3 %>% html_nodes(".item-link") %>% html_text()
  id <- pages3 %>% html_nodes(".item-link") %>% html_attr("href")
  precio <- pages3 %>% html_nodes(".h2-simulated") %>% html_text()
  metros <- pages3 %>% html_nodes(".item-detail:nth-child(4)") %>% html_text()
  habitaciones <- pages3 %>% html_nodes(".price-row+ .item-detail") %>% html_text()
  
  centro = rbind(centro, data.frame(nombre, id, precio, metros, habitaciones, barrio3, fecha))
  
  print("Scraping idealista in progress")  
}

#barrio OESTE

barrio4 = c("Distrito Oeste")

oeste <- character()

for(reviews_pages4 in 1:1){
  
  Link = paste0("https://www.idealista.com/alquiler-viviendas/castellon-de-la-plana-castello-de-la-plana/oeste/pagina-", reviews_pages4,".htm")
  
  pages4 = read_html(Link)
  
  nombre <- pages4 %>% html_nodes(".item-link") %>% html_text()
  id <- pages4 %>% html_nodes(".item-link") %>% html_attr("href")
  precio <- pages4 %>% html_nodes(".h2-simulated") %>% html_text()
  metros <- pages4 %>% html_nodes(".item-detail:nth-child(4)") %>% html_text()
  habitaciones <- pages4 %>% html_nodes(".price-row+ .item-detail") %>% html_text()
  
  oeste = rbind(oeste, data.frame(nombre, id, precio, metros, habitaciones, barrio4, fecha))
  
  print("Scraping idealista in progress")  
}

#barrio ESTE

barrio5 = c("Distrito Este")

este <- character()

for(reviews_pages5 in 1:1){
  
  Link = paste0("https://www.idealista.com/alquiler-viviendas/castellon-de-la-plana-castello-de-la-plana/este/pagina-", reviews_pages5,".htm")
  
  pages5 = read_html(Link)
  
  nombre <- pages5 %>% html_nodes(".item-link") %>% html_text()
  id <- pages5 %>% html_nodes(".item-link") %>% html_attr("href")
  precio <- pages5 %>% html_nodes(".h2-simulated") %>% html_text()
  metros <- pages5 %>% html_nodes(".item-detail:nth-child(4)") %>% html_text()
  habitaciones <- pages5 %>% html_nodes(".price-row+ .item-detail") %>% html_text()
  
  este = rbind(este, data.frame(nombre, id, precio, metros, habitaciones, barrio5, fecha))
  
  print("Scraping idealista in progress")  
}

#barrio GRAO

barrio6 = c("Distrito Grao")

grao <- character()

for(reviews_pages6 in 1:1){
  
  Link = paste0("https://www.idealista.com/alquiler-viviendas/el-grau-de-castello-castellon/")
  
  pages6 = read_html(Link)
  
  nombre <- pages6 %>% html_nodes(".item-link") %>% html_text()
  id <- pages6 %>% html_nodes(".item-link") %>% html_attr("href")
  precio <- pages6 %>% html_nodes(".h2-simulated") %>% html_text()
  metros <- pages6 %>% html_nodes(".item-detail:nth-child(4)") %>% html_text()
  habitaciones <- pages6 %>% html_nodes(".price-row+ .item-detail") %>% html_text()
  
  grao = rbind(grao, data.frame(nombre, id, precio, metros, habitaciones, barrio6, fecha))
  
  print("Scraping idealista in progress")  
}

#Cambiar nombre columna barrio en cada Rframe
names(sur)[names(sur) == 'barrio1'] <- 'distrito'

names(norte)[names(norte) == 'barrio2'] <- 'distrito'

names(centro)[names(centro) == 'barrio3'] <- 'distrito'

names(oeste)[names(oeste) == 'barrio4'] <- 'distrito'

names(este)[names(este) == 'barrio5'] <- 'distrito'

names(grao)[names(grao) == 'barrio6'] <- 'distrito'

bruto <- character()
bruto <- rbind(norte, sur, centro, oeste, este, grao)

print("Proceso terminado, FUCK IDEALISTA") 

#limpiar data frame
bruto$id = gsub("/inmueble/","",bruto$id)
bruto$metros = gsub(" m²","",bruto$metros)
bruto$id = gsub("/","",bruto$id)
bruto$precio = gsub("€/mes","",bruto$precio)
bruto$habitaciones = gsub("hab.","",bruto$habitaciones)


write.csv(bruto, "idealista21012022b.csv", fileEncoding = "UTF-8")
