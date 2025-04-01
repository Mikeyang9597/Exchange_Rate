* 02_00_01 analisys

* data in
local main "$datadir/analysis_data/Main.dta"

*open data
use `main', clear

*make it time series
xtset uni year

* generate variables
g rate = (1-xrate)*100
g log_grad_nra = ln(grad_nra)
g log_grad_us = ln(agg_total_grads)

g log_tuition_out = ln(tuition_out)
g log_cost_supplies = ln(books_supplies)
g log_total_costs = ln(total_costs)

g log_enrollment_nra = ln(enrollment_nra)
g log_cost_room = ln(agg_room_board)
g log_total_enrollment = ln(total_enrollment)

local cost "log_tuition_out log_cost_supplies log_cost_room"
local control "log_total_enrollment"

*model (grad)
xtreg log_grad_nra rate `cost' `control', fe
eststo r1

xtreg log_grad_nra rate `cost' `control' if A1 != 1, fe
eststo r2

xtreg log_grad_nra rate `cost' `control' if A1 == 1, fe
eststo r3

xtreg log_grad_us rate `cost' `control', fe
eststo r4

esttab r1 r2 r3 r4, se


*model (enrollment)
xtreg log_enrollment_nra rate `cost' `control', fe
eststo e1

xtreg log_enrollment_nra rate `cost' `control' if A1 != 1 , fe
eststo e2

xtreg log_enrollment_nra rate `cost' `control' if A1 == 1 , fe
eststo e3

esttab e1 e2 e3, se



