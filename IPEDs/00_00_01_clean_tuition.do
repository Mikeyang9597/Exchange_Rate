* Open IPEDs merged file and Clean for analysis

* In
local IPEDs_in "$datadir/intermediate_data/IPEDS_merged.dta"

* Out
local IPEDs_out "$datadir/intermediate_data/Clean_tuition.dta"

* Open IPEDs data
use `IPEDs_in', clear

* Rename variables
rename School_ID uni
rename In_state_Tuition_and_Fees tuition
rename Year year

* Keep only tuiton data
keep uni tuition year
drop if tuition == .

* save cleaned tuiton data
save `IPEDs_out', replace
