#2. faza: Uvoz podatkov

require("xml2")
require("xlsx")
require("dplyr")
require("readr")

#uvoz 1. tabele: pričakovana življenjska doba
uvozi.zivljenjska.doba <- function(){
  pricakovana.zivljenjska.doba <- read_csv("podatki/zivljenjska.doba.csv",
                                           col_names = c("Čas", "Država", "Spol", "Starost", "Enota", "Vrednost", "Opombe"),
                                           locale = locale(encoding = "Windows-1250"),
                                           skip = 1,
                                           na= c("", ":"))
  pricakovana.zivljenjska.doba$Enota <- NULL
  pricakovana.zivljenjska.doba$Opombe <- NULL
  pricakovana.zivljenjska.doba$Starost <- NULL
  
  
  row.has.na <- apply(pricakovana.zivljenjska.doba, 1, function(x){any(is.na(x))})
  pricakovana.zivljenjska.doba <- pricakovana.zivljenjska.doba[!row.has.na,]
  
  pricakovana.zivljenjska.doba$Država <- as.factor(pricakovana.zivljenjska.doba$Država)
  pricakovana.zivljenjska.doba$Čas <- as.integer(pricakovana.zivljenjska.doba$Čas)
  pricakovana.zivljenjska.doba$Spol <- as.factor(pricakovana.zivljenjska.doba$Spol)
  pricakovana.zivljenjska.doba$Vrednost <- as.numeric(pricakovana.zivljenjska.doba$Vrednost)
  return(pricakovana.zivljenjska.doba)
}

pricakovana.zivljenjska.doba <- uvozi.zivljenjska.doba()


<<<<<<< HEAD
=======
#uvoz 2. tabele: izdatki za posamezne funkcije zdravstvene nege
uvoz.funkcije <- function(){
  funkcije.zdravstvene.nege <- read_csv("podatki/funkcije.csv",
                                        col_names = c("Čas", "Država","Enota", "Funkcija", "Vrednost", "Opombe"),
                                        locale = locale(encoding = "Windows-1250"),
                                        skip = 1,
                                        na= c("", ":"))
  funckije.zdravstvene.nege$Enota <- NULL
  funckije.zdravstvene.nege$Opombe <- NULL
  
  
  row.has.na <- apply(funckije.zdravstvene.nege, 1, function(x){any(is.na(x))})
  funckije.zdravstvene.nege <- funckije.zdravstvene.nege[!row.has.na,]
  
  funckije.zdravstvene.nege$Država <- as.factor(funckije.zdravstvene.nege$Država)
  funckije.zdravstvene.nege$Čas <- as.integer(funckije.zdravstvene.nege$Čas)
  funckije.zdravstvene.nege$Funkcija <- as.factor(funckije.zdravstvene.nege$Funkcija)
  funckije.zdravstvene.nege$Vrednost <- as.numeric(funckije.zdravstvene.nege$Vrednost)
  return(funkcije.zdravstvene.nege)
}

funkcije.zdravstvene.nege <- uvoz.funkcije()

#uvoz 3. tabele: izdatki ponudnikov zdravstvenih storitev
uvoz.ponudniki <- function(){
  ponudniki.zdravstvenih.storitev <- read_csv("podatki/ponudniki.csv",
                                              col_names = c("Čas", "Država","Enota", "Ponudnik", "Vrednost", "Opombe"),
                                              locale = locale(encoding = "Windows-1250"),
                                              skip = 1,
                                              na= c("", ":"))
  ponudniki.zdravstvenih.storitev$Enota <- NULL
  ponudniki.zdravstvenih.storitev$Opombe <- NULL
  
  
  row.has.na <- apply(ponudniki.zdravstvenih.storitev, 1, function(x){any(is.na(x))})
  ponudniki.zdravstvenih.storitev <- ponudniki.zdravstvenih.storitev[!row.has.na,]
  
  ponudniki.zdravstvenih.storitev$Država <- as.factor(ponudniki.zdravstvenih.storitev$Država)
  ponudniki.zdravstvenih.storitev$Čas <- as.integer(ponudniki.zdravstvenih.storitev$Čas)
  ponudniki.zdravstvenih.storitev$Ponudnik <- as.factor(ponudniki.zdravstvenih.storitev$Ponudnik)
  ponudniki.zdravstvenih.storitev$Vrednost <- as.numeric(ponudniki.zdravstvenih.storitev$Vrednost)
  return(ponudniki.zdravstvenih.storitev)
}

ponudniki.zdravstvenih.storitev <- uvoz.ponudniki()

#uvoz 4. tabele: Sheme financiranja zdravstvenih storitev
link <- "http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=hlth_sha11_hf&lang=en"
stran <- html_session(link) %>% read_html()

tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
  .[[1]] %>% html_table(dec = ",")

colnames(tabela) <- c("Čas", "Država", "Enota", "Sheme financiranja", "Vrednost", "Opombe")


>>>>>>> b083c2937f75de93774be16266d88e93aa1af1d6
