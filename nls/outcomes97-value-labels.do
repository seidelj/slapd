label define vlR0000100   0 "0"
label values R0000100 vlR0000100
label define vlR0536300   1 "Male"  2 "Female"  0 "No Information"
label values R0536300 vlR0536300
label define vlR0536401   1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December"
label values R0536401 vlR0536401
label define vlR1204500   0 "0"
label values R1204500 vlR1204500
label define vlR1204900   0 "0"
label values R1204900 vlR1204900
label define vlR1235800   1 "Cross-sectional"  0 "Oversample"
label values R1235800 vlR1235800
label define vlR1302600   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302600 vlR1302600
label define vlR1302700   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302700 vlR1302700
label define vlR1482600   1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic"
label values R1482600 vlR1482600
label define vlT8122500   429 "Month of current release in a continuous month format"
label values T8122500 vlT8122500
label define vlT8129100   0 "0"
label values T8129100 vlT8129100
label define vlT8129200   0 "0"
label values T8129200 vlT8129200
label define vlT8976700   0 "0"
label values T8976700 vlT8976700
label define vlT8978000   0 "0"
label values T8978000 vlT8978000
label define vlZ9083800   0 "None"  1 "1st grade"  2 "2nd grade"  3 "3rd grade"  4 "4th grade"  5 "5th grade"  6 "6th grade"  7 "7th grade"  8 "8th grade"  9 "9th grade"  10 "10th grade"  11 "11th grade"  12 "12th grade"  13 "1st year college"  14 "2nd year college"  15 "3rd year college"  16 "4th year college"  17 "5th year college"  18 "6th year college"  19 "7th year college"  20 "8th year college or more"  95 "Ungraded"
label values Z9083800 vlZ9083800
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */
/*
  rename R0000100 PUBID_1997 
  rename R0536300 KEY!SEX_1997 
  rename R0536401 KEY!BDATE_M_1997 
  rename R0536402 KEY!BDATE_Y_1997 
  rename R1204500 CV_INCOME_GROSS_YR_1997 
  rename R1204900 CV_HH_POV_RATIO_1997 
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1302600 CV_HGC_RES_DAD_1997 
  rename R1302700 CV_HGC_RES_MOM_1997 
  rename R1482600 KEY!RACE_ETHNICITY_1997 
  rename T8122500 VERSION_R16_2013 
  rename T8129100 CV_INCOME_FAMILY_2013 
  rename T8129200 CV_HH_POV_RATIO_2013 
  rename T8976700 YINC_1700_2013   // YINC-1700
  rename T8978000 YINC_2600_2013   // YINC-2600
  rename Z9083800 CVC_HGC_EVER_XRND 
*/
  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */
