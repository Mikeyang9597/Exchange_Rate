import delimited "102.csv", clear

rename totalpriceforoutofstatestudentsl cost_2022
rename percentofundergraduateenrollment per_2022
rename v5 cost_2021
rename v7 cost_2020
rename v9 cost_2019
rename v11 cost_2018
rename v13 cost_2017
rename v15 cost_2016
rename v17 cost_2015
rename v19 cost_2014
rename v21 cost_2013
rename v23 cost_2012
rename v25 cost_2011
rename v27 cost_2010
rename v29 cost_2009
rename v6 per_2021
rename v8 per_2020
rename v10 per_2019
rename v12 per_2018
rename v14 per_2017
rename v16 per_2016
rename v18 per_2015
rename v20 per_2014
rename v22 per_2013
rename v24 per_2012
rename v26 per_2011
rename v28 per_2010
rename v30 per_2009
drop v45

rename fulltimetotalef2022allstudentsun total_2022

forvalues year = 2009/2021 {
    local oldname = "fulltimetotalef`year'_rvallstudent"
    local newname = "total_`year'"
    rename `oldname' `newname'
}

save "102.dta", replace

reshape long cost_ per_ total_ , i(unitid institutionname) j(year)

rename cost_ cost
rename per_ per
rename total_ total

merge n:1 year using "index"

replace cost = cost*(100/97.44) if year == 2009
replace cost = cost*(100/101.63) if year == 2011
replace cost = cost*(100/104.60) if year == 2012
replace cost = cost*(100/106.27) if year == 2013
replace cost = cost*(100/107.95) if year == 2014
replace cost = cost*(100/107.85) if year == 2015
replace cost = cost*(100/109.34) if year == 2016
replace cost = cost*(100/112.07) if year == 2017
replace cost = cost*(100/114.39) if year == 2018
replace cost = cost*(100/116.16) if year == 2019

gen enrol = (per/100) * total

gen cb = cost*xrate_b/100
gen cd = cost*xrate_d/100
gen cu = cost*xrate_u/100

reghdfe enrol cb , absorb(year)
eststo col1

reghdfe enrol cd, absorb(year)
eststo col2

reghdfe enrol cu , absorb(year)
eststo col3

esttab col1 col2 col3



reghdfe enrol cost xrate_b cb, absorb(year)
eststo col1

reghdfe enrol cost xrate_d cd, absorb(year)
eststo col2

reghdfe enrol cost xrate_u cu, absorb(year)
eststo col3

esttab col1 col2 col3 , se
