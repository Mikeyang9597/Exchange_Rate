** Master Do File for Double Major project **
**  + set current/working directories (all other directories relative)
********************

cls
clear
set more off

*======= Define user and useful macros ========*

local user mike

** Declare directories **

if "`user'" == "mike" {
	global 	datadir "/Users/mikeyang/Dropbox/Exchange_Rate"
	global 	codedir 	"/Users/mikeyang/Documents/Exchange_Rate"
}	

else if "`user'" == "lucas" {
	global 	datadir "C:\Users\vkbostwick\Dropbox\DoubleMajor_Data"
	global 	codedir 	"C:\Users\vkbostwick\Documents\GitHub\Returns-to-Double-Majors"
}	

****Eventually put all do files in order here so whole project can run from this one file:****

*do "$codedir/data_cleaning_acs.do"
