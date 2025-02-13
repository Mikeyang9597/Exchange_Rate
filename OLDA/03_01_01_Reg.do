local main "$mydir\clean_ex\main_index.dta"

use `main' , clear

drop if year < 1999
drop if year > 2019

gen ch_index = (xrate_ch/8.278285)*100
gen in_index = (xrate_in/41.35611)*100
gen kr_index = (xrate_kr/1400.404)*100
gen b_index = (xrate_b/1.04171)*100


reghdfe international_ch ch_index
eststo r1

reghdfe international_in in_index
eststo r2

reghdfe international_kr kr_index
eststo r3

reghdfe international b_index
eststo r4

esttab r1 r2 r3 r4 , se
