file handle pcdat/name='outcomes.dat' /lrecl=24.
data list file pcdat free /
  E8043100 (F2)
  E8043500 (F3)
  R0000100 (F4)
  T8129100 (F6)
  Z9083900 (F2)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  E8043100  "INCARC_TOTNUM"
  E8043500  "INCARC_TOT_MONTHS"
  R0000100  "PUBID - YTH ID CODE 1997"
  T8129100  "CV_INCOME_FAMILY 2013"
  Z9083900  "CVC_HIGHEST_DEGREE_EVER"
.

* Recode continuous values. 
* recode 
 E8043100 
    (0 thru 0 eq 0)
    (1 thru 2 eq 1)
    (3 thru 4 eq 3)
    (5 thru 6 eq 5)
    (7 thru 8 eq 7)
    (9 thru 10 eq 9)
    (11 thru 12 eq 11)
    (13 thru 14 eq 13)
    (15 thru 16 eq 15)
    (17 thru 18 eq 17)
    (19 thru 20 eq 19)
    / 
 E8043500 
    (0 thru 3 eq 0)
    (4 thru 6 eq 4)
    (7 thru 9 eq 7)
    (10 thru 12 eq 10)
    (13 thru 18 eq 13)
    (19 thru 24 eq 19)
    (25 thru 36 eq 25)
    (37 thru 48 eq 37)
    (49 thru 999 eq 49)
    / 
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
 T8129100 
    (-999999 thru -3000 eq -999999)
    (-2999 thru -2000 eq -2999)
    (-1999 thru -1000 eq -1999)
    (-999 thru -1 eq -999)
    (0 thru 0 eq 0)
    (1 thru 1000 eq 1)
    (1001 thru 2000 eq 1001)
    (2001 thru 3000 eq 2001)
    (3001 thru 5000 eq 3001)
    (5001 thru 10000 eq 5001)
    (10001 thru 20000 eq 10001)
    (20001 thru 30000 eq 20001)
    (30001 thru 40000 eq 30001)
    (40001 thru 50000 eq 40001)
    (50001 thru 65000 eq 50001)
    (65001 thru 80000 eq 65001)
    (80001 thru 100000 eq 80001)
    (100001 thru 150000 eq 100001)
    (150001 thru 200000 eq 150001)
    (200001 thru 999999 eq 200001)
.

* value labels
 E8043100
    0 "0: No incarcerations"
    1 "1 TO 2: incarcerations"
    3 "3 TO 4: incarcerations"
    5 "5 TO 6: incarcerations"
    7 "7 TO 8: incarcerations"
    9 "9 TO 10: incarcerations"
    11 "11 TO 12: incarcerations"
    13 "13 TO 14: incarcerations"
    15 "15 TO 16: incarcerations"
    17 "17 TO 18: incarcerations"
    19 "19 TO 20: incarcerations"
    /
 E8043500
    0 "0 TO 3: months"
    4 "4 TO 6: months"
    7 "7 TO 9: months"
    10 "10 TO 12: months"
    13 "13 TO 18: months"
    19 "19 TO 24: months"
    25 "25 TO 36: months"
    37 "37 TO 48: months"
    49 "49 TO 999: months"
    /
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
 T8129100
    -999999 "-999999 TO -3000: < -2999"
    -2999 "-2999 TO -2000"
    -1999 "-1999 TO -1000"
    -999 "-999 TO -1"
    0 "0"
    1 "1 TO 1000"
    1001 "1001 TO 2000"
    2001 "2001 TO 3000"
    3001 "3001 TO 5000"
    5001 "5001 TO 10000"
    10001 "10001 TO 20000"
    20001 "20001 TO 30000"
    30001 "30001 TO 40000"
    40001 "40001 TO 50000"
    50001 "50001 TO 65000"
    65001 "65001 TO 80000"
    80001 "80001 TO 100000"
    100001 "100001 TO 150000"
    150001 "150001 TO 200000"
    200001 "200001 TO 999999: 200001+"
    /
 Z9083900
    0 "None"
    1 "GED"
    2 "High school diploma (Regular 12 year program)"
    3 "Associate/Junior college (AA)"
    4 "Bachelor's degree (BA, BS)"
    5 "Master's degree (MA, MS)"
    6 "PhD"
    7 "Professional degree (DDS, JD, MD)"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */  /* *start* */

* RENAME VARIABLES
  (E8043100 = INCARC_TOTNUM_XRND) 
  (E8043500 = INCARC_TOTMONTHS_XRND) 
  (R0000100 = PUBID_1997) 
  (T8129100 = CV_INCOME_FAMILY_2013) 
  (Z9083900 = CVC_HIGHEST_DEGREE_EVER_XRND) 
.
  /* *end* */

descriptives all.

*--- Tabulations using reference number variables;
*freq var=E8043100, 
  E8043500, 
  R0000100, 
  T8129100, 
  Z9083900.

*--- Tabulations using qname variables;
*freq var=INCARC_TOTNUM_XRND, 
  INCARC_TOTMONTHS_XRND, 
  PUBID_1997, 
  CV_INCOME_FAMILY_2013, 
  CVC_HIGHEST_DEGREE_EVER_XRND.
