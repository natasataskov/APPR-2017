#uvoz
# Funkcija, ki uvozi tabelo pricakovane zivljenjenske dobe iz Eurostata
uvozi.zivljenjska.doba <- function() {
  link <- "http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=demo_mlexpec&lang=en"
  stran <- html_session(link) %>% read_html()
  tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
    .[[1]] %>% html_table(dec = ",")
  colnames(tabela) <- c("drzava", "leto", "spol", "starost")
}