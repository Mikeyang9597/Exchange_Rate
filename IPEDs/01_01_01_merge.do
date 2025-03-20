* Define file paths
local tuition "$datadir/intermediate_data/Clean_tuition.dta"
local grad "$datadir/intermediate_data/Clean_grad.dta"
local index "$datadir/intermediate_data/Clean_index.dta"

* Define output path
local Out "$datadir/analysis_data/Main.dta"

* Open tuition data
use `tuition', clear

* Merge with graduation data
merge 1:1 uni year using `grad', force

* Keep only matched observations
keep if _merge == 3
drop _merge

* Merge with graduation data
merge m:1 year using `index', force
keep if _merge == 3
drop _merge

save `Out' , replace
