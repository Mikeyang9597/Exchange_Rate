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

gen international_ch = 1 if country_of_origin == "CH"
gen international_in = 1 if country_of_origin == "IN"
gen international_kr = 1 if country_of_origin == "KS"

* graph 
collapse (count) international international_ch international_in international_kr if international == 1, by(year)
*twoway (line international year, sort)

destring year, replace
d year

********************************************************************************
* Show Exchange_rate change by year

local d_index “$mydir\clean_ex\dollar_index.dta”
local d_index_ch “$mydir\clean_ex\dollar_index_ch.dta”
local d_index_in “$mydir\clean_ex\dollar_index_in.dta”
local d_index_kr “$mydir\clean_ex\dollar_index_kr.dta”

* open d_index data

merge 1:1 year using `d_index' 
keep if _merge == 3
drop _merge

* graph 
*twoway (line xrate_b year)
*twoway (line xrate_d year)
*twoway (line xrate_u year)

merge 1:1 year using `d_index_ch' 
keep if _merge == 3
drop _merge

merge 1:1 year using `d_index_in' 
keep if _merge == 3
drop _merge

merge 1:1 year using `d_index_kr' 
keep if _merge == 3
drop _merge

save "\\chrr\vr\profiles\syang\Desktop\clean_ex\main_index.dta",replace
