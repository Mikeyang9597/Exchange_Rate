* Define file paths
local clean_in "$datadir/intermediate_data/Clean_IPEDS.dta"
local index "$datadir/intermediate_data/Clean_index.dta"

* Define output path
local Out "$datadir/analysis_data/Main.dta"

* Open tuition data
use `clean_in', clear

* Merge with graduation data
merge m:1 year using `index', force
keep if _merge == 3
drop _merge

save `Out' , replace
