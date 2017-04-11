# Analiza podatkov s programom R, 2016/17

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2016/17

## Tematika

V projektu bom analizirala vpliv zdravstvene ureditve v povezavi s pričakovano življenjsko dobo v posameznih državah. Analizirala bom, kako dejavne so posamezne države na posameznih področjih v zdravstvu, kateri so glavni pohudniki zdravstvenih storitev in kakšna je shema financiranja zdravstva v posameznih državah. Cilj projekta je poiskati, kakšna ureditev zdravstvenega sistema je najbolj optimalna za državo.

V prvi tabeli bom imela v stolpcih leto, državo in spol, v vrsticah pa pričakovano življenjsko dobo.

V drugi tabeli bom imela v stolpcih funkcije zdravstvene nege in države, v vrsticah pa koliko posamezna država nameni denarja za določeno zdravstveno funkcijo.

V tretji tabeli bom imela v stolpcih napisane države, leto in ponudnike zdravstvenih storitev, v vrsticah pa koliko denarja različne države namenijo zanje v posameznih letih.

V četrti tabeli bom imela v stolpcih države, čas in finančno shemo, v vrsticah pa vrednosti.

Viri:
http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=demo_mlexpec&lang=en

http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=hlth_sha11_hc&lang=en

http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=hlth_sha11_hp&lang=en

http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=hlth_sha11_hf&lang=en

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
