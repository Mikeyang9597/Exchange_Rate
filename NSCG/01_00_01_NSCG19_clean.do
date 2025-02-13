*NSCG *2019 *Exchange_rage
clear

* This do file will clean up the raw NSCG19 data and save cleaned NSCG19 files for the main analysis and robustness checks.

* Specify name for input files (Raw ACS data in)
local NSCG19_raw_in "$datadir/raw_data/epcg19.sas7bdat"

*Import 2021 NSCG DATA
import sas using `NSCG19_raw_in'

tab FNCCD CTZDUAL

