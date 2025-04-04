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
g log_grad_total = ln(agg_total_grads)
g grad_us = (agg_total_grads - grad_nra)
g log_grad_us = ln(grad_us)

g log_tuition_out = ln(tuition_out)
g log_cost_supplies = ln(books_supplies)
g log_total_costs = ln(total_costs)
g log_cost_room = ln(agg_room_board)

g log_enrollment_nra = ln(enrollment_nra)
g enrollment_us = (total_enrollment - enrollment_nra)
g log_enrollment_us = ln(enrollment_us)
g log_enrollment_total = ln(total_enrollment)

local cost "log_tuition_out log_cost_supplies log_cost_room"
local control "log_enrollment_total"

*model (grad)
xtreg log_grad_nra rate `cost' `control' if A1 != 1, fe
eststo r2

xtreg log_grad_us rate `cost' `control' if A1 != 1, fe
eststo r3

xtreg agg_total_grads rate `cost' `control' if A1 != 1, fe
eststo r4

esttab r2 r3 r4, se


*model (enrollment)
xtreg enrollment_nra rate `cost'  if A1 != 1, fe
eststo e1

xtreg enrollment_us rate `cost'  if A1 != 1 , fe
eststo e2

xtreg total_enrollment rate `cost'  if A1 == 1 , fe
eststo e3

esttab e1 e2 e3, se



