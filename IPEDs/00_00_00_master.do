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
	global 	codedir 	"/Users/mikeyang/Documents/Exchange_Rate/IPEDs"
}	

else if "`user'" == "lucas" {
	global 	datadir "C:\Users\vkbostwick\Dropbox\DoubleMajor_Data"
	global 	codedir 	"C:\Users\vkbostwick\Documents\GitHub\Returns-to-Double-Majors"
}	

****Eventually put all do files in order here so whole project can run from this one file:****

do "$codedir/00_00_01_clean_tuition.do"
do "$codedir/00_00_02_clean_grad.do"
do "$codedir/00_01_01_index.do"
do "$codedir/01_01_01_merge.do"
