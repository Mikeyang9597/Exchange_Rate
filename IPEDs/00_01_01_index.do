********************************************************************************
* this do file will import exchange index data and save cleaned index data

* Index
local index_in "$datadir/Index/Broad_Dollar_Indexes.xlsx"

* Out
local index_out "$datadir/intermediate_data/Clean_index.dta"

* Import Dollar Index
import excel `index_in' , firstrow clear

*gen year
gen year = year(Period)

egen xrate_b = mean(RealBroadMonthly/100) , by(year)
egen xrate_d = mean(RealAFEMonthly/100) , by(year)
egen xrate_u = mean(RealEMEMonthly/100) , by(year)

* keep 1 index per year
bysort year :keep if _n==1

destring year, replace

recast double year

*drop
drop RealBroadMonthly
drop RealAFEMonthly
drop RealEMEMonthly
drop Period

save `index_out',replace

********************************************************************************
