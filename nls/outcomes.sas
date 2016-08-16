options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'outcomes.dat' lrecl=24 missover DSD DLM=' ' print;
input
  E8043100
  E8043500
  R0000100
  T8129100
  Z9083900
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

  label E8043100 = "INCARC_TOTNUM";
  label E8043500 = "INCARC_TOT_MONTHS";
  label R0000100 = "PUBID - YTH ID CODE 1997";
  label T8129100 = "CV_INCOME_FAMILY 2013";
  label Z9083900 = "CVC_HIGHEST_DEGREE_EVER";

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
  E8043100 = 'INCARC_TOTNUM_XRND'n
  E8043500 = 'INCARC_TOTMONTHS_XRND'n
  R0000100 = 'PUBID_1997'n
  T8129100 = 'CV_INCOME_FAMILY_2013'n
  Z9083900 = 'CVC_HIGHEST_DEGREE_EVER_XRND'n
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
  0='0: No incarcerations'
  1-2='1 TO 2: incarcerations'
  3-4='3 TO 4: incarcerations'
  5-6='5 TO 6: incarcerations'
  7-8='7 TO 8: incarcerations'
  9-10='9 TO 10: incarcerations'
  11-12='11 TO 12: incarcerations'
  13-14='13 TO 14: incarcerations'
  15-16='15 TO 16: incarcerations'
  17-18='17 TO 18: incarcerations'
  19-20='19 TO 20: incarcerations'
;
value vx1f
  0-3='0 TO 3: months'
  4-6='4 TO 6: months'
  7-9='7 TO 9: months'
  10-12='10 TO 12: months'
  13-18='13 TO 18: months'
  19-24='19 TO 24: months'
  25-36='25 TO 36: months'
  37-48='37 TO 48: months'
  49-999='49 TO 999: months'
;
value vx2f
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
value vx3f
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
value vx4f
  0='None'
  1='GED'
  2='High school diploma (Regular 12 year program)'
  3='Associate/Junior college (AA)'
  4='Bachelor''s degree (BA, BS)'
  5='Master''s degree (MA, MS)'
  6='PhD'
  7='Professional degree (DDS, JD, MD)'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format E8043100 vx0f.;
  format E8043500 vx1f.;
  format R0000100 vx2f.;
  format T8129100 vx3f.;
  format Z9083900 vx4f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format 'INCARC_TOTNUM_XRND'n vx0f.;
  format 'INCARC_TOTMONTHS_XRND'n vx1f.;
  format 'PUBID_1997'n vx2f.;
  format 'CV_INCOME_FAMILY_2013'n vx3f.;
  format 'CVC_HIGHEST_DEGREE_EVER_XRND'n vx4f.;
run;
*/