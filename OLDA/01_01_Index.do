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
drop year_

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\dollar_index.dta”,replace
********************************************************************************

*Dollar Index
import excel “$mydir\raw\dollar_index_ch”,firstrow clear

gen year = substr(observation_date, -4, .)

drop observation_date

egen xrate_ch = mean(DEXCHUS) , by(year)

keep year xrate_ch

* keep 1 index per year
bysort year :keep if _n==1

destring year, replace

recast double year

save “\\chrr\vr\profiles\syang\Desktop\clean_ex\dollar_index_ch.dta”,replace
********************************************************************************

import excel “$mydir\raw\dollar_index_in”,firstrow clear

gen year = substr(observation_date, -4, .)

drop observation_date

egen xrate_in = mean(DEXINUS) , by(year)

keep year xrate_in

* keep 1 index per year
bysort year :keep if _n==1

destring year, replace

recast double year
save “\\chrr\vr\profiles\syang\Desktop\clean_ex\dollar_index_in.dta”,replace
********************************************************************************
import excel “$mydir\raw\dollar_index_kr”,firstrow clear

gen year = substr(observation_date, -4, .)

drop observation_date

egen xrate_kr = mean(DEXKOUS) , by(year)

keep year xrate_kr

* keep 1 index per year
bysort year :keep if _n==1

destring year, replace

recast double year
save “\\chrr\vr\profiles\syang\Desktop\clean_ex\dollar_index_kr.dta”,replace
********************************************************************************
