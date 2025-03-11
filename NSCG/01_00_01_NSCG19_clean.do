*IPED *Exchange_rage
clear

* This do file will clean up the raw IPEDs data and save cleaned IPEDs files for the main analysis and robustness checks.

* Specify name for input files (Raw ACS data in)
local IPEDs "$datadir/raw_data/IPEDs_data/ef90_hd_data_stata.csv"

*Import IPEDs DATA
import delimited `IPEDs', clear


tab FNCCD CTZDUAL

