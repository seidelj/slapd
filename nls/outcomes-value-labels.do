label define vlE8043100   0 "0: No incarcerations"
label values E8043100 vlE8043100
label define vlR0000100   0 "0"
label values R0000100 vlR0000100
label define vlT8129100   0 "0"
label values T8129100 vlT8129100
label define vlZ9083900   0 "None"  1 "GED"  2 "High school diploma (Regular 12 year program)"  3 "Associate/Junior college (AA)"  4 "Bachelor's degree (BA, BS)"  5 "Master's degree (MA, MS)"  6 "PhD"  7 "Professional degree (DDS, JD, MD)"
label values Z9083900 vlZ9083900
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */
/*
  rename E8043100 INCARC_TOTNUM_XRND 
  rename E8043500 INCARC_TOTMONTHS_XRND 
  rename R0000100 PUBID_1997 
  rename T8129100 CV_INCOME_FAMILY_2013 
  rename Z9083900 CVC_HIGHEST_DEGREE_EVER_XRND 
*/
  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */
