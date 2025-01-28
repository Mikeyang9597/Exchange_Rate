********************************************************************************
*clean OLDA data
********************************************************************************
*clean enrollment data
local main_in “$mydir\raw\enrollments_AY98_AY23.dta”
use `main_in’, clear

* Keep only Undergrad
keep if admission_area_code == “UND”

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\clean_main.dta”,replace

********************************************************************************
*clean personal level data
local race “$mydir\raw\person_AY98_AY23.dta”
use `race’, clear

keep if inlist(sex, "F", "M")
bysort person_key : keep if _n == 1

* Generate international tag
gen international = 0
replace international = 1 if country_of_origin != "99" & country_of_origin != "98" & country_of_origin ! = "US"

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\clean_race.dta”,replace

********************************************************************************
