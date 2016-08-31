options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'outcomes97.dat' lrecl=75 missover DSD DLM=' ' print;
input
  R0000100
  R0536300
  R0536401
  R0536402
  R1204500
  R1204900
  R1235800
  R1302600
  R1302700
  R1482600
  T8122500
  T8129100
  T8129200
  T8976700
  T8978000
  Z9083800
;
array nvarlist _numeric_;


*---Recode missing values to SAS custom system missing. See SAS
      documentation for use of MISSING option in procedures, e.g. PROC FREQ;

do over nvarlist;
  if nvarlist = -1 then nvarlist = .R;  /* Refused */
  if nvarlist = -2 then nvarlist = .D;  /* Dont know */
  if nvarlist = -3 then nvarlist = .I;  /* Invalid missing */
  if nvarlist = -4 then nvarlist = .V;  /* Valid missing */
  if nvarlist = -5 then nvarlist = .N;  /* Non-interview */
end;

  label R0000100 = "PUBID - YTH ID CODE 1997";
  label R0536300 = "KEY!SEX (SYMBOL) 1997";
  label R0536401 = "KEY!BDATE M/Y (SYMBOL) 1997";
  label R0536402 = "KEY!BDATE M/Y (SYMBOL) 1997";
  label R1204500 = "CV_INCOME_GROSS_YR 1997";
  label R1204900 = "CV_HH_POV_RATIO 1997";
  label R1235800 = "CV_SAMPLE_TYPE 1997";
  label R1302600 = "CV_HGC_RES_DAD 1997";
  label R1302700 = "CV_HGC_RES_MOM 1997";
  label R1482600 = "KEY!RACE_ETHNICITY (SYMBOL) 1997";
  label T8122500 = "R16 RELEASE VERSION NUMBER 2013";
  label T8129100 = "CV_INCOME_FAMILY 2013";
  label T8129200 = "CV_HH_POV_RATIO 2013";
  label T8976700 = "TTL INC WAGES, SALARY PAST YR 2013";
  label T8978000 = "SP TTL INC WAGES, SALARY PAST YR 2013";
  label Z9083800 = "CVC_HGC_EVER";

/*---------------------------------------------------------------------*
 *  Crosswalk for Reference number & Question name                     *
 *---------------------------------------------------------------------*
 * Uncomment and edit this RENAME statement to rename variables
 * for ease of use.  You may need to use  name literal strings
 * e.g.  'variable-name'n   to create valid SAS variable names, or 
 * alter variables similarly named across years.
 * This command does not guarantee uniqueness

 * See SAS documentation for use of name literals and use of the
 * VALIDVARNAME=ANY option.     
 *---------------------------------------------------------------------*/
  /* *start* */

* RENAME
  R0000100 = 'PUBID_1997'n
  R0536300 = 'KEY!SEX_1997'n
  R0536401 = 'KEY!BDATE_M_1997'n
  R0536402 = 'KEY!BDATE_Y_1997'n
  R1204500 = 'CV_INCOME_GROSS_YR_1997'n
  R1204900 = 'CV_HH_POV_RATIO_1997'n
  R1235800 = 'CV_SAMPLE_TYPE_1997'n
  R1302600 = 'CV_HGC_RES_DAD_1997'n
  R1302700 = 'CV_HGC_RES_MOM_1997'n
  R1482600 = 'KEY!RACE_ETHNICITY_1997'n
  T8122500 = 'VERSION_R16_2013'n
  T8129100 = 'CV_INCOME_FAMILY_2013'n
  T8129200 = 'CV_HH_POV_RATIO_2013'n
  T8976700 = 'YINC-1700_2013'n
  T8978000 = 'YINC-2600_2013'n
  Z9083800 = 'CVC_HGC_EVER_XRND'n
;
  /* *finish* */

run;

proc means data=new_data n mean min max;
run;


/*---------------------------------------------------------------------*
 *  FORMATTED TABULATIONS                                              *
 *---------------------------------------------------------------------*
 * You can uncomment and edit the PROC FORMAT and PROC FREQ statements 
 * provided below to obtain formatted tabulations. The tabulations 
 * should reflect codebook values.
 * 
 * Please edit the formats below reflect any renaming of the variables
 * you may have done in the first data step. 
 *---------------------------------------------------------------------*/

/*
proc format; 
value vx0f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
;
value vx1f
  1='Male'
  2='Female'
  0='No Information'
;
value vx2f
  1='1: January'
  2='2: February'
  3='3: March'
  4='4: April'
  5='5: May'
  6='6: June'
  7='7: July'
  8='8: August'
  9='9: September'
  10='10: October'
  11='11: November'
  12='12: December'
;
value vx4f
  -999999--3000='-999999 TO -3000: < -2999'
  -2999--2000='-2999 TO -2000'
  -1999--1000='-1999 TO -1000'
  -999--1='-999 TO -1'
  0='0'
  1-1000='1 TO 1000'
  1001-2000='1001 TO 2000'
  2001-3000='2001 TO 3000'
  3001-5000='3001 TO 5000'
  5001-10000='5001 TO 10000'
  10001-20000='10001 TO 20000'
  20001-30000='20001 TO 30000'
  30001-40000='30001 TO 40000'
  40001-50000='40001 TO 50000'
  50001-65000='50001 TO 65000'
  65001-80000='65001 TO 80000'
  80001-100000='80001 TO 100000'
  100001-150000='100001 TO 150000'
  150001-200000='150001 TO 200000'
  200001-999999='200001 TO 999999: 200001+'
;
value vx5f
  0='0'
  1-99='1 TO 99: .01-.99'
  100-199='100 TO 199: 1.00-1.99'
  200-299='200 TO 299: 2.00-2.99'
  300-399='300 TO 399: 3.00-3.99'
  400-499='400 TO 499: 4.00-4.99'
  500-599='500 TO 599: 5.00-5.99'
  600-699='600 TO 699: 6.00-6.99'
  700-799='700 TO 799: 7.00-7.99'
  800-899='800 TO 899: 8.00-8.99'
  900-999='900 TO 999: 9.00-9.99'
  1000-1099='1000 TO 1099: 10.00-10.99'
  1100-1199='1100 TO 1199: 11.00-11.99'
  1200-1299='1200 TO 1299: 12.00-12.99'
  1300-1399='1300 TO 1399: 13.00-13.99'
  1400-1499='1400 TO 1499: 14.00-14.99'
  1500-1599='1500 TO 1599: 15.00-15.99'
  1600-1699='1600 TO 1699: 16.00-16.99'
  1700-1799='1700 TO 1799: 17.00-17.99'
  1800-1899='1800 TO 1899: 18.00-18.99'
  1900-1999='1900 TO 1999: 19.00-19.99'
  2000-2999='2000 TO 2999: 20.00-29.99'
  3000-9999='3000 TO 9999: 30.00+'
;
value vx6f
  1='Cross-sectional'
  0='Oversample'
;
value vx7f
  0='NONE'
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx8f
  0='NONE'
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx9f
  1='Black'
  2='Hispanic'
  3='Mixed Race (Non-Hispanic)'
  4='Non-Black / Non-Hispanic'
;
value vx10f
  429='Month of current release in a continuous month format'
;
value vx11f
  -999999--3000='-999999 TO -3000: < -2999'
  -2999--2000='-2999 TO -2000'
  -1999--1000='-1999 TO -1000'
  -999--1='-999 TO -1'
  0='0'
  1-1000='1 TO 1000'
  1001-2000='1001 TO 2000'
  2001-3000='2001 TO 3000'
  3001-5000='3001 TO 5000'
  5001-10000='5001 TO 10000'
  10001-20000='10001 TO 20000'
  20001-30000='20001 TO 30000'
  30001-40000='30001 TO 40000'
  40001-50000='40001 TO 50000'
  50001-65000='50001 TO 65000'
  65001-80000='65001 TO 80000'
  80001-100000='80001 TO 100000'
  100001-150000='100001 TO 150000'
  150001-200000='150001 TO 200000'
  200001-999999='200001 TO 999999: 200001+'
;
value vx12f
  0='0'
  1-99='1 TO 99: .01-.99'
  100-199='100 TO 199: 1.00-1.99'
  200-299='200 TO 299: 2.00-2.99'
  300-399='300 TO 399: 3.00-3.99'
  400-499='400 TO 499: 4.00-4.99'
  500-599='500 TO 599: 5.00-5.99'
  600-699='600 TO 699: 6.00-6.99'
  700-799='700 TO 799: 7.00-7.99'
  800-899='800 TO 899: 8.00-8.99'
  900-999='900 TO 999: 9.00-9.99'
  1000-1099='1000 TO 1099: 10.00-10.99'
  1100-1199='1100 TO 1199: 11.00-11.99'
  1200-1299='1200 TO 1299: 12.00-12.99'
  1300-1399='1300 TO 1399: 13.00-13.99'
  1400-1499='1400 TO 1499: 14.00-14.99'
  1500-1599='1500 TO 1599: 15.00-15.99'
  1600-1699='1600 TO 1699: 16.00-16.99'
  1700-1799='1700 TO 1799: 17.00-17.99'
  1800-1899='1800 TO 1899: 18.00-18.99'
  1900-1999='1900 TO 1999: 19.00-19.99'
  2000-2999='2000 TO 2999: 20.00-29.99'
  3000-9999='3000 TO 9999: 30.00+'
;
value vx13f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx14f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx15f
  0='None'
  1='1st grade'
  2='2nd grade'
  3='3rd grade'
  4='4th grade'
  5='5th grade'
  6='6th grade'
  7='7th grade'
  8='8th grade'
  9='9th grade'
  10='10th grade'
  11='11th grade'
  12='12th grade'
  13='1st year college'
  14='2nd year college'
  15='3rd year college'
  16='4th year college'
  17='5th year college'
  18='6th year college'
  19='7th year college'
  20='8th year college or more'
  95='Ungraded'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format R0000100 vx0f.;
  format R0536300 vx1f.;
  format R0536401 vx2f.;
  format R1204500 vx4f.;
  format R1204900 vx5f.;
  format R1235800 vx6f.;
  format R1302600 vx7f.;
  format R1302700 vx8f.;
  format R1482600 vx9f.;
  format T8122500 vx10f.;
  format T8129100 vx11f.;
  format T8129200 vx12f.;
  format T8976700 vx13f.;
  format T8978000 vx14f.;
  format Z9083800 vx15f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format 'PUBID_1997'n vx0f.;
  format 'KEY!SEX_1997'n vx1f.;
  format 'KEY!BDATE_M_1997'n vx2f.;
  format 'CV_INCOME_GROSS_YR_1997'n vx4f.;
  format 'CV_HH_POV_RATIO_1997'n vx5f.;
  format 'CV_SAMPLE_TYPE_1997'n vx6f.;
  format 'CV_HGC_RES_DAD_1997'n vx7f.;
  format 'CV_HGC_RES_MOM_1997'n vx8f.;
  format 'KEY!RACE_ETHNICITY_1997'n vx9f.;
  format 'VERSION_R16_2013'n vx10f.;
  format 'CV_INCOME_FAMILY_2013'n vx11f.;
  format 'CV_HH_POV_RATIO_2013'n vx12f.;
  format 'YINC-1700_2013'n vx13f.;
  format 'YINC-2600_2013'n vx14f.;
  format 'CVC_HGC_EVER_XRND'n vx15f.;
run;
*/