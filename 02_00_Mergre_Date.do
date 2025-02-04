********************************************************************************
* Merge OLDA data
********************************************************************************
local main “$mydir\clean_ex\clean_main.dta”
local race “$mydir\clean_ex\clean_race.dta”
local term_index “$mydir\clean_ex\term_index.dta”

* open race data
use `main’ , clear

* merge main with race
merge m:1 person_key using `race’
keep if _merge == 3
drop _merge

* merge main and Index
rename fiscal_year yr_num
rename term term_code
merge m:1 yr_num term_code using `term_index'
keep if _merge == 3
drop _merge

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\main_merged.dta”,replace
********************************************************************************
