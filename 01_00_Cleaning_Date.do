********************************************************************************
*clean OLDA data
********************************************************************************

*clean personal level data
local race “$mydir\raw\person_AY98_AY23.dta”
use `race’, clear

keep if nonresident_alien_flag == "Y"
keep if academic_intention_code == "XX"
drop if country_of_origin == "98"

sort higher_ed_pseudo_id

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\clean_race.dta”,replace

********************************************************************************
