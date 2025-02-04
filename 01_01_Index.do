********************************************************************************
*Term Index
import excel “$mydir\raw\termindex_new”,firstrow clear

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\term_index.dta”,replace
********************************************************************************
*Dollar Index
import excel “$mydir\raw\dollar_index”,firstrow clear

*gen index by year
gen year = year(Period)
egen xrate_b = mean(RealBroadMonthly) , by(year)
egen xrate_d = mean(RealAFEMonthly) , by(year)
egen xrate_u = mean(RealEMEMonthly) , by(year)

* keep 1 index per year
bysort year :keep if _n==1

*drop
drop if year > 2000
drop RealBroadMonthly
drop RealAFEMonthly
drop RealEMEMonthly
drop Period

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\dollar_index.dta”,replace
********************************************************************************