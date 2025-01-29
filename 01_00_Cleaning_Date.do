********************************************************************************
*clean OLDA data
********************************************************************************
*clean enrollment data
local main_in “$mydir\raw\enrollments_AY98_AY23.dta”
use `main_in’, clear

* Drop
drop term_key
drop if campus_key == 0

* Keep only Undergrad
keep if admission_area_code == “UND”

* Drop non-main campus
drop if main_campus_type_code != "1"

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\clean_main.dta”,replace

********************************************************************************
*clean personal level data
local race “$mydir\raw\person_AY98_AY23.dta”
use `race’, clear

keep higher_ed_pseudo_id ssn_pseudo_id country_of_origin sex race state_of_residency nonresident_alien_flag
keep if inlist(sex, "F", "M")
drop if country_of_origin == ""
*bysort higher_ed_pseudo_id : keep if _n == 1
bysort ssn_pseudo_id : keep if _n == 1

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\clean_race.dta”,replace

********************************************************************************
