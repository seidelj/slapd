file handle pcdat/name='default.dat' /lrecl=61.
data list file pcdat free /
  R0000100 (F4)
  R0536300 (F2)
  R0536401 (F2)
  R0536402 (F4)
  R1482600 (F2)
  T4580600 (F3)
  T4580700 (F2)
  T4581000 (F3)
  T4581100 (F2)
  T7710300 (F3)
  T7710400 (F2)
  T7710700 (F3)
  T7710800 (F2)
  T9112300 (F2)
  T9112400 (F2)
  T9112700 (F2)
  T9112800 (F2)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  R0000100  "PUBID - YTH ID CODE 1997"
  R0536300  "KEY!SEX (SYMBOL) 1997"
  R0536401  "KEY!BDATE M/Y (SYMBOL) 1997"
  R0536402  "KEY!BDATE M/Y (SYMBOL) 1997"
  R1482600  "KEY!RACE_ETHNICITY (SYMBOL) 1997"
  T4580600  "HEA29: CAUSE OF BIO DAD DEATH 2009"
  T4580700  "HEA29: AGE OF BIO DAD AT DEATH 2009"
  T4581000  "HEA29: CAUSE OF BIO MOM DEATH 2009"
  T4581100  "HEA29: AGE OF BIO MOM AT DEATH 2009"
  T7710300  "HEA29: CAUSE OF BIO DAD DEATH 2011"
  T7710400  "HEA29: AGE OF BIO DAD AT DEATH 2011"
  T7710700  "HEA29: CAUSE OF BIO MOM DEATH 2011"
  T7710800  "HEA29: AGE OF BIO MOM AT DEATH 2011"
  T9112300  "HEA29: CAUSE OF BIO DAD DEATH 2013"
  T9112400  "HEA29: AGE OF BIO DAD AT DEATH 2013"
  T9112700  "HEA29: CAUSE OF BIO MOM DEATH 2013"
  T9112800  "HEA29: AGE OF BIO MOM AT DEATH 2013"
.

* Recode continuous values. 
* recode 
 R0000100 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    / 
 T4580700 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
    / 
 T4581100 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
    / 
 T7710400 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
    / 
 T7710800 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
    / 
 T9112400 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
    / 
 T9112800 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
.

* value labels
 R0000100
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    /
 R0536300
    1 "Male"
    2 "Female"
    0 "No Information"
    /
 R0536401
    1 "1: January"
    2 "2: February"
    3 "3: March"
    4 "4: April"
    5 "5: May"
    6 "6: June"
    7 "7: July"
    8 "8: August"
    9 "9: September"
    10 "10: October"
    11 "11: November"
    12 "12: December"
    /
 R1482600
    1 "Black"
    2 "Hispanic"
    3 "Mixed Race (Non-Hispanic)"
    4 "Non-Black / Non-Hispanic"
    /
 T4580600
    1 "Heart Attack/Stroke"
    2 "Accident"
    3 "Cancer"
    4 "Old Age"
    5 "Emphysema"
    6 "OTHER (SPECIFY)"
    7 "OTHER - Recoded to heart disease"
    8 "OTHER - Recoded to stroke"
    9 "OTHER - Recoded to AIDS/HIV"
    10 "OTHER - Recoded to homicide"
    11 "OTHER - Recoded to liver disease"
    12 "OTHER - Recoded to diabetes"
    13 "OTHER - Recoded to septicemia"
    14 "OTHER - Recoded to viral hepatitis"
    15 "OTHER - Recoded to nephritis (kidney disease)"
    17 "OTHER - Recoded to influenza or pneumonia"
    18 "OTHER - Recoded to suicide"
    19 "OTHER - Unspecified Drug/Alcohol related"
    20 "OTHER - Specific cause"
    21 "OTHER - Unspecified cause"
    999 "UNCODABLE"
    /
 T4580700
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
 T4581000
    1 "Heart Attack/Stroke"
    2 "Accident"
    3 "Cancer"
    4 "Old Age"
    5 "Emphysema"
    6 "OTHER (SPECIFY)"
    7 "OTHER - Recoded to heart disease"
    8 "OTHER - Recoded to stroke"
    9 "OTHER - Recoded to AIDS/HIV"
    10 "OTHER - Recoded to homicide"
    11 "OTHER - Recoded to liver disease"
    12 "OTHER - Recoded to diabetes"
    13 "OTHER - Recoded to septicemia"
    14 "OTHER - Recoded to viral hepatitis"
    15 "OTHER - Recoded to nephritis (kidney disease)"
    17 "OTHER - Recoded to influenza or pneumonia"
    18 "OTHER - Recoded to suicide"
    19 "OTHER - Unspecified Drug/Alcohol related"
    20 "OTHER - Specific cause"
    21 "OTHER - Unspecified cause"
    999 "UNCODABLE"
    /
 T4581100
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
 T7710300
    1 "Heart Attack/Stroke"
    2 "Accident"
    3 "Cancer"
    4 "Old Age"
    5 "Emphysema"
    6 "OTHER (SPECIFY)"
    7 "OTHER - Recoded to heart disease"
    8 "OTHER - Recoded to stroke"
    9 "OTHER - Recoded to AIDS/HIV"
    10 "OTHER - Recoded to homicide"
    11 "OTHER - Recoded to liver disease"
    12 "OTHER - Recoded to diabetes"
    13 "OTHER - Recoded to septicemia"
    14 "OTHER - Recoded to viral hepatitis"
    15 "OTHER - Recoded to nephritis (kidney disease)"
    16 "OTHER - Recoded to Alzheimer's disease"
    17 "OTHER - Recoded to influenza or pneumonia"
    18 "OTHER - Recoded to suicide"
    19 "OTHER - Unspecified Drug/Alcohol related"
    20 "OTHER - Specific cause"
    21 "OTHER - Unspecified cause"
    22 "OTHER - Not deceased"
    999 "UNCODABLE"
    /
 T7710400
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
 T7710700
    1 "Heart Attack/Stroke"
    2 "Accident"
    3 "Cancer"
    4 "Old Age"
    5 "Emphysema"
    6 "OTHER (SPECIFY)"
    7 "OTHER - Recoded to heart disease"
    8 "OTHER - Recoded to stroke"
    9 "OTHER - Recoded to AIDS/HIV"
    10 "OTHER - Recoded to homicide"
    11 "OTHER - Recoded to liver disease"
    12 "OTHER - Recoded to diabetes"
    13 "OTHER - Recoded to septicemia"
    14 "OTHER - Recoded to viral hepatitis"
    15 "OTHER - Recoded to nephritis (kidney disease)"
    16 "OTHER - Recoded to Alzheimer's disease"
    17 "OTHER - Recoded to influenza or pneumonia"
    18 "OTHER - Recoded to suicide"
    19 "OTHER - Unspecified Drug/Alcohol related"
    20 "OTHER - Specific cause"
    21 "OTHER - Unspecified cause"
    22 "OTHER - Not deceased"
    999 "UNCODABLE"
    /
 T7710800
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
 T9112300
    1 "Heart Attack"
    2 "Accident"
    3 "Cancer"
    4 "Old Age"
    5 "Emphysema"
    6 "OTHER (SPECIFY)"
    7 "Stroke"
    8 "Added in - Heart Disease"
    9 "Added in - AIDS/HIV"
    10 "Added in - homicide"
    11 "Added in - liver disease"
    12 "Added in - diabetes"
    13 "Added in - septicemia"
    14 "Added in - viral hepatitis"
    15 "Added in - nephritis (kidney disease)"
    16 "Added in - Alzheimer's disease"
    17 "Added in - Influenza or pneumonia"
    18 "Added in - Suicide"
    19 "Added in - Unspecified Drug/Alcohol related"
    20 "Added in - Specific cause"
    21 "Added in - Unspecified cause"
    22 "Added in - Not deceased"
    995 "Supervisor Review"
    999 "Uncodable"
    /
 T9112400
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
 T9112700
    1 "Heart Attack"
    2 "Accident"
    3 "Cancer"
    4 "Old Age"
    5 "Emphysema"
    6 "OTHER (SPECIFY)"
    7 "Stroke"
    8 "Added in - Heart Disease"
    9 "Added in - AIDS/HIV"
    10 "Added in - homicide"
    11 "Added in - liver disease"
    12 "Added in - diabetes"
    13 "Added in - septicemia"
    14 "Added in - viral hepatitis"
    15 "Added in - nephritis (kidney disease)"
    16 "Added in - Alzheimer's disease"
    17 "Added in - Influenza or pneumonia"
    18 "Added in - Suicide"
    19 "Added in - Unspecified Drug/Alcohol related"
    20 "Added in - Specific cause"
    21 "Added in - Unspecified cause"
    22 "Added in - Not deceased"
    995 "Supervisor Review"
    999 "Uncodable"
    /
 T9112800
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */  /* *start* */

* RENAME VARIABLES
  (R0000100 = PUBID_1997) 
  (R0536300 = KEY_SEX_1997)   /* KEY!SEX */
  (R0536401 = KEY_BDATE_M_1997)   /* KEY!BDATE_M */
  (R0536402 = KEY_BDATE_Y_1997)   /* KEY!BDATE_Y */
  (R1482600 = KEY_RACE_ETHNICITY_1997)   /* KEY!RACE_ETHNICITY */
  (T4580600 = YHEA29_180_2009)   /* YHEA29-180 */
  (T4580700 = YHEA29_190_2009)   /* YHEA29-190 */
  (T4581000 = YHEA29_220_2009)   /* YHEA29-220 */
  (T4581100 = YHEA29_230_2009)   /* YHEA29-230 */
  (T7710300 = YHEA29_180_2011)   /* YHEA29-180 */
  (T7710400 = YHEA29_190_2011)   /* YHEA29-190 */
  (T7710700 = YHEA29_220_2011)   /* YHEA29-220 */
  (T7710800 = YHEA29_230_2011)   /* YHEA29-230 */
  (T9112300 = YHEA29_180_2013)   /* YHEA29-180 */
  (T9112400 = YHEA29_190_2013)   /* YHEA29-190 */
  (T9112700 = YHEA29_220_2013)   /* YHEA29-220 */
  (T9112800 = YHEA29_230_2013)   /* YHEA29-230 */
.
  /* *end* */

descriptives all.

*--- Tabulations using reference number variables;
*freq var=R0000100, 
  R0536300, 
  R0536401, 
  R0536402, 
  R1482600, 
  T4580600, 
  T4580700, 
  T4581000, 
  T4581100, 
  T7710300, 
  T7710400, 
  T7710700, 
  T7710800, 
  T9112300, 
  T9112400, 
  T9112700, 
  T9112800.

*--- Tabulations using qname variables;
*freq var=PUBID_1997, 
  KEY_SEX_1997, 
  KEY_BDATE_M_1997, 
  KEY_BDATE_Y_1997, 
  KEY_RACE_ETHNICITY_1997, 
  YHEA29_180_2009, 
  YHEA29_190_2009, 
  YHEA29_220_2009, 
  YHEA29_230_2009, 
  YHEA29_180_2011, 
  YHEA29_190_2011, 
  YHEA29_220_2011, 
  YHEA29_230_2011, 
  YHEA29_180_2013, 
  YHEA29_190_2013, 
  YHEA29_220_2013, 
  YHEA29_230_2013.
