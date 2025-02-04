********************************************************************************
* Summy stat of OLDA data
********************************************************************************
* Show number of international student change by year

local main “$mydir\clean_ex\main_merged.dta”

* open main data
use `main’ , clear

* Generate international indicator
gen international = .
replace international = 0 if nonresident_alien_flag == "N"
replace international = 1 if nonresident_alien_flag == "Y"
*tab term_index international if international == 1

* graph 
collapse (count) international if international == 1, by(yr_num)
twoway (line international yr_num, sort)

*tab country_of_origin

********************************************************************************
* Show Exchange_rate change by year

local d_index “$mydir\clean_ex\dollar_index.dta”

* open d_index data
use `d_index’ , clear

* graph 
twoway (line xrate_b year)
*twoway (line xrate_d year)
*twoway (line xrate_u year)

