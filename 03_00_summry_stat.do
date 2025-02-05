********************************************************************************
* Summy stat of OLDA data
********************************************************************************
* Show number of international student change by year

local main “$mydir\clean_ex\main_merged.dta”

* open main data
use `main’ , clear

rename higher_ed_pseudo_id id

* Generate international indicator
gen international = .
replace international = 0 if nonresident_alien_flag == "N"
replace international = 1 if nonresident_alien_flag == "Y"
*tab term_index international if international == 1

*bysort id : keep if _n == 1

rename yr_num year

* graph 
collapse (count) international if international == 1, by(year)
*twoway (line international year, sort)

destring year, replace
d year
*tab country_of_origin

********************************************************************************
* Show Exchange_rate change by year

local d_index “$mydir\clean_ex\dollar_index.dta”

* open d_index data

merge 1:1 year using `d_index' 
keep if _merge == 3
drop _merge

* graph 
*twoway (line xrate_b year)
*twoway (line xrate_d year)
*twoway (line xrate_u year)

save "\\chrr\vr\profiles\syang\Desktop\clean_ex\main_index.dta",replace
