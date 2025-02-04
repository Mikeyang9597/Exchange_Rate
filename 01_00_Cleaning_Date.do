********************************************************************************
*clean OLDA data
********************************************************************************

*clean personal level data
local race “$mydir\raw\person_AY98_AY23.dta”
use `race’, clear

keep if nonresident_alien_flag == "Y"
keep if academic_intention_code == "XX"
drop if country_of_origin == "98"

bysort person_key: keep if _n == 1

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\clean_race.dta”,replace

********************************************************************************

*Clean main enrollment data
local main_in “$mydir\raw\enrollments_AY98_AY23.dta”
use `main_in’, clear

*keep only grad students
keep if admission_area_code == “GRD”
keep if student_rank_desc == “Doctoral Student”
drop if campus_code != institution_code

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\clean_main.dta”,replace

********************************************************************************