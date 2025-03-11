* clean enrollment data

clear       

*IN
local in_E1990 "$datadir/raw_data/IPEDs_data/ef90_a_data_stata.csv"
*OUT
local out_E1990 "$datadir/intermediate_data/E1990.dta"
            
insheet using `in_E1990', comma clear
label data "dct_ef90_a"
label variable unitid "unitid"
label variable line "Type of student count"
label variable lstudy "Level of study"
label variable section "Attendance status-Part A only"
label variable efrace01 "Non-resident alien men"
label variable efrace02 "Non-resident alien women"
label variable efrace03 "Black non-Hispanic men"
label variable efrace04 "Black non-Hispanic women"
label variable efrace05 "American Indian or Alaskan Native men"
label variable efrace06 "American Indian or Alaskan Native women"
label variable efrace07 "Asian or Pacific Islander men"
label variable efrace08 "Asian or Pacific Islander women"
label variable efrace09 "Hispanic men"
label variable efrace10 "Hispanic women"
label variable efrace11 "White non-Hispanic men"
label variable efrace12 "White non-Hispanic women"
label variable efrace13 "Race-ethnicity unknown men"
label variable efrace14 "Race-ethnicity unknown women"
label variable efrace15 "Total men"
label variable efrace16 "Total women"

label define label_line 1 "Full-time undergraduate degree-seeking 1st-time fr" 
label define label_line 10 "Full-time first-professional all other", add 
label define label_line 11 "Full-time graduate degree-seeking first-time", add 
label define label_line 12 "Full-time graduate degree-seeking other", add 
label define label_line 13 "Full-time graduate non-degree-seeking", add 
label define label_line 14 "Total full-time post-baccalaureate", add 
label define label_line 15 "Part-time undergraduate degree-seeking 1st-time fr", add 
label define label_line 16 "Part-time undergraduate degree-seeking other 1st y", add 
label define label_line 17 "Part-time undergraduate degree-seeking 2nd year", add 
label define label_line 18 "Part-time undergraduate degree-seeking 3rd year", add 
label define label_line 19 "Part-time undergraduate degree-seeking 4th year an", add 
label define label_line 2 "Full-time undergraduate degree-seeking other 1st y", add 
label define label_line 20 "Part-time undergraduate degree-seeking unclassifie", add 
label define label_line 21 "Part-time undergraduate non-degree seeking", add 
label define label_line 22 "Total part-time undergraduates", add 
label define label_line 23 "Part-time first-professional first-time", add 
label define label_line 24 "Part-time first-professional all other", add 
label define label_line 25 "Part-time graduate degree-seeking first-time", add 
label define label_line 26 "Part-time graduate degree-seeking other", add 
label define label_line 27 "Part-time graduate non-degree-seeking", add 
label define label_line 28 "Total part-time post-baccalaureate", add 
label define label_line 29 "Grand total of all students", add 
label define label_line 3 "Full-time undergraduate degree-seeking 2nd year", add 
label define label_line 4 "Full-time undergraduate degree-seeking 3rd year", add 
label define label_line 5 "Full-time undergraduate degree-seeking 4th year an", add 
label define label_line 6 "Full-time undergraduate degree-seeking unclassifie", add 
label define label_line 7 "Full-time undergraduate non-degree seeking", add 
label define label_line 8 "Total full-time undergraduates", add 
label define label_line 9 "Full-time first-professional first-time", add 
label values line label_line
label define label_lstudy 1 "Undergraduate students" 
label define label_lstudy 2 "First-professional students", add 
label define label_lstudy 3 "Graduate students", add 
label define label_lstudy 4 "All post-baccalaureate students", add 
encode lstudy, generate(lstudy_num)
label values lstudy_num label_lstudy
label define label_section 1 "Full-time students" 
label define label_section 2 "Part-time students", add 
label values section label_section

save `out_E1990', replace
