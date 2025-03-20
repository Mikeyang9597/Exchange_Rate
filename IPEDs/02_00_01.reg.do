* 02_00_01 analisys

* data in
local main "$datadir/analysis_data/Main.dta"


*open data
use `main', clear

xtset uni year

xtreg grad xrate_b tuition
eststo r1

esttab r1
