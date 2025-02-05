********************************************************************************
*Term Index
import excel “$mydir\raw\termindex_new”,firstrow clear

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\term_index.dta”,replace
********************************************************************************
*Dollar Index
import excel “$mydir\raw\dollar_index”,firstrow clear

*gen index by year
destring Period, replace
gen year_ = substr(Period, -2, .)

gen year = ""
replace year = "20" + year_ if real(year_) < 20
replace year = "19" + year_ if real(year_) > 20

egen xrate_b = mean(RealBroadMonthly) , by(year)
egen xrate_d = mean(RealAFEMonthly) , by(year)
egen xrate_u = mean(RealEMEMonthly) , by(year)

* keep 1 index per year
bysort year :keep if _n==1

destring year, replace

recast double year

*drop
drop RealBroadMonthly
drop RealAFEMonthly
drop RealEMEMonthly
drop Period
drop year_

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\dollar_index.dta”,replace
********************************************************************************
