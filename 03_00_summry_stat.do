********************************************************************************
* Summy stat of OLDA data
********************************************************************************

local main “$mydir\clean_ex\main_merged.dta”

* open main data
use `main’ , clear

* Generate international indicator
gen international = .
replace international = 0 if nonresident_alien_flag == "N"
replace international = 1 if nonresident_alien_flag == "Y"

tab yr_num international if international == 1


tab country_of_origin