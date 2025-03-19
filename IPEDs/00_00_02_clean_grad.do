* Open IPEDs merged file and Clean for analysis

* In
local IPEDs_in "$datadir/intermediate_data/IPEDS_merged.dta"

* Out
local IPEDs_out "$datadir/intermediate_data/Clean_grad.dta"

* Open IPEDs data
use `IPEDs_in', clear

* Rename variables
rename School_ID uni
rename Non_resident_alien_graduations grad
rename Year year

* Keep only tuiton data
keep uni grad year
drop if grad == .
bysort uni year (grad): keep if _n == 1

* Reshape it
reshape wide grad, i(uni) j(year)

* save cleaned tuiton data
save `IPEDs_out', replace
