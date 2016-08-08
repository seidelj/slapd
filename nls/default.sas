options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'default.dat' lrecl=61 missover DSD DLM=' ' print;
input
  R0000100
  R0536300
  R0536401
  R0536402
  R1482600
  T4580600
  T4580700
  T4581000
  T4581100
  T7710300
  T7710400
  T7710700
  T7710800
  T9112300
  T9112400
  T9112700
  T9112800
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
  label R1482600 = "KEY!RACE_ETHNICITY (SYMBOL) 1997";
  label T4580600 = "HEA29: CAUSE OF BIO DAD DEATH 2009";
  label T4580700 = "HEA29: AGE OF BIO DAD AT DEATH 2009";
  label T4581000 = "HEA29: CAUSE OF BIO MOM DEATH 2009";
  label T4581100 = "HEA29: AGE OF BIO MOM AT DEATH 2009";
  label T7710300 = "HEA29: CAUSE OF BIO DAD DEATH 2011";
  label T7710400 = "HEA29: AGE OF BIO DAD AT DEATH 2011";
  label T7710700 = "HEA29: CAUSE OF BIO MOM DEATH 2011";
  label T7710800 = "HEA29: AGE OF BIO MOM AT DEATH 2011";
  label T9112300 = "HEA29: CAUSE OF BIO DAD DEATH 2013";
  label T9112400 = "HEA29: AGE OF BIO DAD AT DEATH 2013";
  label T9112700 = "HEA29: CAUSE OF BIO MOM DEATH 2013";
  label T9112800 = "HEA29: AGE OF BIO MOM AT DEATH 2013";

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
  R1482600 = 'KEY!RACE_ETHNICITY_1997'n
  T4580600 = 'YHEA29-180_2009'n
  T4580700 = 'YHEA29-190_2009'n
  T4581000 = 'YHEA29-220_2009'n
  T4581100 = 'YHEA29-230_2009'n
  T7710300 = 'YHEA29-180_2011'n
  T7710400 = 'YHEA29-190_2011'n
  T7710700 = 'YHEA29-220_2011'n
  T7710800 = 'YHEA29-230_2011'n
  T9112300 = 'YHEA29-180_2013'n
  T9112400 = 'YHEA29-190_2013'n
  T9112700 = 'YHEA29-220_2013'n
  T9112800 = 'YHEA29-230_2013'n
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
  1='Black'
  2='Hispanic'
  3='Mixed Race (Non-Hispanic)'
  4='Non-Black / Non-Hispanic'
;
value vx5f
  1='Heart Attack/Stroke'
  2='Accident'
  3='Cancer'
  4='Old Age'
  5='Emphysema'
  6='OTHER (SPECIFY)'
  7='OTHER - Recoded to heart disease'
  8='OTHER - Recoded to stroke'
  9='OTHER - Recoded to AIDS/HIV'
  10='OTHER - Recoded to homicide'
  11='OTHER - Recoded to liver disease'
  12='OTHER - Recoded to diabetes'
  13='OTHER - Recoded to septicemia'
  14='OTHER - Recoded to viral hepatitis'
  15='OTHER - Recoded to nephritis (kidney disease)'
  17='OTHER - Recoded to influenza or pneumonia'
  18='OTHER - Recoded to suicide'
  19='OTHER - Unspecified Drug/Alcohol related'
  20='OTHER - Specific cause'
  21='OTHER - Unspecified cause'
  999='UNCODABLE'
;
value vx6f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
value vx7f
  1='Heart Attack/Stroke'
  2='Accident'
  3='Cancer'
  4='Old Age'
  5='Emphysema'
  6='OTHER (SPECIFY)'
  7='OTHER - Recoded to heart disease'
  8='OTHER - Recoded to stroke'
  9='OTHER - Recoded to AIDS/HIV'
  10='OTHER - Recoded to homicide'
  11='OTHER - Recoded to liver disease'
  12='OTHER - Recoded to diabetes'
  13='OTHER - Recoded to septicemia'
  14='OTHER - Recoded to viral hepatitis'
  15='OTHER - Recoded to nephritis (kidney disease)'
  17='OTHER - Recoded to influenza or pneumonia'
  18='OTHER - Recoded to suicide'
  19='OTHER - Unspecified Drug/Alcohol related'
  20='OTHER - Specific cause'
  21='OTHER - Unspecified cause'
  999='UNCODABLE'
;
value vx8f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
value vx9f
  1='Heart Attack/Stroke'
  2='Accident'
  3='Cancer'
  4='Old Age'
  5='Emphysema'
  6='OTHER (SPECIFY)'
  7='OTHER - Recoded to heart disease'
  8='OTHER - Recoded to stroke'
  9='OTHER - Recoded to AIDS/HIV'
  10='OTHER - Recoded to homicide'
  11='OTHER - Recoded to liver disease'
  12='OTHER - Recoded to diabetes'
  13='OTHER - Recoded to septicemia'
  14='OTHER - Recoded to viral hepatitis'
  15='OTHER - Recoded to nephritis (kidney disease)'
  16='OTHER - Recoded to Alzheimer''s disease'
  17='OTHER - Recoded to influenza or pneumonia'
  18='OTHER - Recoded to suicide'
  19='OTHER - Unspecified Drug/Alcohol related'
  20='OTHER - Specific cause'
  21='OTHER - Unspecified cause'
  22='OTHER - Not deceased'
  999='UNCODABLE'
;
value vx10f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
value vx11f
  1='Heart Attack/Stroke'
  2='Accident'
  3='Cancer'
  4='Old Age'
  5='Emphysema'
  6='OTHER (SPECIFY)'
  7='OTHER - Recoded to heart disease'
  8='OTHER - Recoded to stroke'
  9='OTHER - Recoded to AIDS/HIV'
  10='OTHER - Recoded to homicide'
  11='OTHER - Recoded to liver disease'
  12='OTHER - Recoded to diabetes'
  13='OTHER - Recoded to septicemia'
  14='OTHER - Recoded to viral hepatitis'
  15='OTHER - Recoded to nephritis (kidney disease)'
  16='OTHER - Recoded to Alzheimer''s disease'
  17='OTHER - Recoded to influenza or pneumonia'
  18='OTHER - Recoded to suicide'
  19='OTHER - Unspecified Drug/Alcohol related'
  20='OTHER - Specific cause'
  21='OTHER - Unspecified cause'
  22='OTHER - Not deceased'
  999='UNCODABLE'
;
value vx12f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
value vx13f
  1='Heart Attack'
  2='Accident'
  3='Cancer'
  4='Old Age'
  5='Emphysema'
  6='OTHER (SPECIFY)'
  7='Stroke'
  8='Added in - Heart Disease'
  9='Added in - AIDS/HIV'
  10='Added in - homicide'
  11='Added in - liver disease'
  12='Added in - diabetes'
  13='Added in - septicemia'
  14='Added in - viral hepatitis'
  15='Added in - nephritis (kidney disease)'
  16='Added in - Alzheimer''s disease'
  17='Added in - Influenza or pneumonia'
  18='Added in - Suicide'
  19='Added in - Unspecified Drug/Alcohol related'
  20='Added in - Specific cause'
  21='Added in - Unspecified cause'
  22='Added in - Not deceased'
  995='Supervisor Review'
  999='Uncodable'
;
value vx14f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
value vx15f
  1='Heart Attack'
  2='Accident'
  3='Cancer'
  4='Old Age'
  5='Emphysema'
  6='OTHER (SPECIFY)'
  7='Stroke'
  8='Added in - Heart Disease'
  9='Added in - AIDS/HIV'
  10='Added in - homicide'
  11='Added in - liver disease'
  12='Added in - diabetes'
  13='Added in - septicemia'
  14='Added in - viral hepatitis'
  15='Added in - nephritis (kidney disease)'
  16='Added in - Alzheimer''s disease'
  17='Added in - Influenza or pneumonia'
  18='Added in - Suicide'
  19='Added in - Unspecified Drug/Alcohol related'
  20='Added in - Specific cause'
  21='Added in - Unspecified cause'
  22='Added in - Not deceased'
  995='Supervisor Review'
  999='Uncodable'
;
value vx16f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format R0000100 vx0f.;
  format R0536300 vx1f.;
  format R0536401 vx2f.;
  format R1482600 vx4f.;
  format T4580600 vx5f.;
  format T4580700 vx6f.;
  format T4581000 vx7f.;
  format T4581100 vx8f.;
  format T7710300 vx9f.;
  format T7710400 vx10f.;
  format T7710700 vx11f.;
  format T7710800 vx12f.;
  format T9112300 vx13f.;
  format T9112400 vx14f.;
  format T9112700 vx15f.;
  format T9112800 vx16f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format 'PUBID_1997'n vx0f.;
  format 'KEY!SEX_1997'n vx1f.;
  format 'KEY!BDATE_M_1997'n vx2f.;
  format 'KEY!RACE_ETHNICITY_1997'n vx4f.;
  format 'YHEA29-180_2009'n vx5f.;
  format 'YHEA29-190_2009'n vx6f.;
  format 'YHEA29-220_2009'n vx7f.;
  format 'YHEA29-230_2009'n vx8f.;
  format 'YHEA29-180_2011'n vx9f.;
  format 'YHEA29-190_2011'n vx10f.;
  format 'YHEA29-220_2011'n vx11f.;
  format 'YHEA29-230_2011'n vx12f.;
  format 'YHEA29-180_2013'n vx13f.;
  format 'YHEA29-190_2013'n vx14f.;
  format 'YHEA29-220_2013'n vx15f.;
  format 'YHEA29-230_2013'n vx16f.;
run;
*/