

local main "$mydir\clean_ex\main_index.dta"

use `main' , clear

drop if year < 1999
drop if year > 2019

local absorption ", absorb(year)"

reg international xrate_b year

eststo r1

esttab r1, se
