* Open IPEDs merged file and Clean for analysis

* In
local IPEDs_in "$datadir/intermediate_data/merged_grouped_IPEDS_mar28.dta"

* Out
local IPEDs_out "$datadir/intermediate_data/Clean_IPEDS.dta"

* Open IPEDs data
use `IPEDs_in', clear

*drop
drop agg_black_grads agg_white_grads agg_asian_grads agg_hispanic_grads black_grad_rate white_grad_rate asian_grad_rate hispanic_grad_rate asian_enrollment black_enrollment white_enrollment hispanic_enrollment


* Rename variables
rename out_state_tuition tuition_out
rename agg_nra_grads grad_nra
rename non_resident_alien_enrollment enrollment_nra


*carnegie
*Doctoral/Research Universities—Extensive
g R1 = 0
replace R1 = 1 if carnegie == 15
*Doctoral/Research Universities—Intensive
g R2 = 0
replace R2 = 1 if carnegie == 16

*Master's Colleges and Universities I
g M1 = 0
replace M1 = 1 if carnegie == 21
*Master's Colleges and Universities II
g M2 = 0
replace M2 = 1 if carnegie == 22

*Baccalaureate Colleges—Liberal Arts
g g1 = 0
replace g1 = 1 if carnegie == 31
*Baccalaureate Colleges—General
g g2 = 0
replace g2 = 1 if carnegie == 32
*Baccalaureate/Associate's Colleges
g g3 = 0
replace g3 = 1 if carnegie == 33

*Associate's Colleges
g A1 = 0
replace A1 = 1 if carnegie == 40

drop if carnegie < 0
drop if carnegie > 50

* drop missing data
drop if tuition_out == 0
drop if grad_nra == 0
drop if enrollment_nra == 0

* save cleaned tuiton data
save `IPEDs_out', replace
