********************************************************************************
* this do file will import exchange index data and save cleaned index data

* Index
local index_in "$datadir/Index/RealBroadDollarIndex_1973-2025.csv"

* Out
local index_out "$datadir/intermediate_data/Clean_index.dta"

* Import Dollar Index
import delimited `index_in', clear

*gen year
gen year = real("19" + substr(date, 5, 2))
replace year = real("20" + substr(date, 5, 2)) if year < 1950

egen xrate = mean(rbdi/100), by (year)

* keep 1 index per year
bysort year :keep if _n==1

destring year, replace

recast double year

drop rbdi

save `index_out',replace

********************************************************************************
