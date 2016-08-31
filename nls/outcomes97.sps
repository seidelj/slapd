file handle pcdat/name='outcomes97.dat' /lrecl=75.
data list file pcdat free /
  R0000100 (F4)
  R0536300 (F2)
  R0536401 (F2)
  R0536402 (F4)
  R1204500 (F6)
  R1204900 (F4)
  R1235800 (F2)
  R1302600 (F2)
  R1302700 (F2)
  R1482600 (F2)
  T8122500 (F3)
  T8129100 (F6)
  T8129200 (F4)
  T8976700 (F6)
  T8978000 (F6)
  Z9083800 (F2)
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
  R1204500  "CV_INCOME_GROSS_YR 1997"
  R1204900  "CV_HH_POV_RATIO 1997"
  R1235800  "CV_SAMPLE_TYPE 1997"
  R1302600  "CV_HGC_RES_DAD 1997"
  R1302700  "CV_HGC_RES_MOM 1997"
  R1482600  "KEY!RACE_ETHNICITY (SYMBOL) 1997"
  T8122500  "R16 RELEASE VERSION NUMBER 2013"
  T8129100  "CV_INCOME_FAMILY 2013"
  T8129200  "CV_HH_POV_RATIO 2013"
  T8976700  "TTL INC WAGES, SALARY PAST YR 2013"
  T8978000  "SP TTL INC WAGES, SALARY PAST YR 2013"
  Z9083800  "CVC_HGC_EVER"
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
 R1204500 
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
    / 
 R1204900 
    (0 thru 0 eq 0)
    (1 thru 99 eq 1)
    (100 thru 199 eq 100)
    (200 thru 299 eq 200)
    (300 thru 399 eq 300)
    (400 thru 499 eq 400)
    (500 thru 599 eq 500)
    (600 thru 699 eq 600)
    (700 thru 799 eq 700)
    (800 thru 899 eq 800)
    (900 thru 999 eq 900)
    (1000 thru 1099 eq 1000)
    (1100 thru 1199 eq 1100)
    (1200 thru 1299 eq 1200)
    (1300 thru 1399 eq 1300)
    (1400 thru 1499 eq 1400)
    (1500 thru 1599 eq 1500)
    (1600 thru 1699 eq 1600)
    (1700 thru 1799 eq 1700)
    (1800 thru 1899 eq 1800)
    (1900 thru 1999 eq 1900)
    (2000 thru 2999 eq 2000)
    (3000 thru 9999 eq 3000)
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
    / 
 T8129200 
    (0 thru 0 eq 0)
    (1 thru 99 eq 1)
    (100 thru 199 eq 100)
    (200 thru 299 eq 200)
    (300 thru 399 eq 300)
    (400 thru 499 eq 400)
    (500 thru 599 eq 500)
    (600 thru 699 eq 600)
    (700 thru 799 eq 700)
    (800 thru 899 eq 800)
    (900 thru 999 eq 900)
    (1000 thru 1099 eq 1000)
    (1100 thru 1199 eq 1100)
    (1200 thru 1299 eq 1200)
    (1300 thru 1399 eq 1300)
    (1400 thru 1499 eq 1400)
    (1500 thru 1599 eq 1500)
    (1600 thru 1699 eq 1600)
    (1700 thru 1799 eq 1700)
    (1800 thru 1899 eq 1800)
    (1900 thru 1999 eq 1900)
    (2000 thru 2999 eq 2000)
    (3000 thru 9999 eq 3000)
    / 
 T8976700 
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
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T8978000 
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
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
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
 R1204500
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
 R1204900
    0 "0"
    1 "1 TO 99: .01-.99"
    100 "100 TO 199: 1.00-1.99"
    200 "200 TO 299: 2.00-2.99"
    300 "300 TO 399: 3.00-3.99"
    400 "400 TO 499: 4.00-4.99"
    500 "500 TO 599: 5.00-5.99"
    600 "600 TO 699: 6.00-6.99"
    700 "700 TO 799: 7.00-7.99"
    800 "800 TO 899: 8.00-8.99"
    900 "900 TO 999: 9.00-9.99"
    1000 "1000 TO 1099: 10.00-10.99"
    1100 "1100 TO 1199: 11.00-11.99"
    1200 "1200 TO 1299: 12.00-12.99"
    1300 "1300 TO 1399: 13.00-13.99"
    1400 "1400 TO 1499: 14.00-14.99"
    1500 "1500 TO 1599: 15.00-15.99"
    1600 "1600 TO 1699: 16.00-16.99"
    1700 "1700 TO 1799: 17.00-17.99"
    1800 "1800 TO 1899: 18.00-18.99"
    1900 "1900 TO 1999: 19.00-19.99"
    2000 "2000 TO 2999: 20.00-29.99"
    3000 "3000 TO 9999: 30.00+"
    /
 R1235800
    1 "Cross-sectional"
    0 "Oversample"
    /
 R1302600
    0 "NONE"
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 R1302700
    0 "NONE"
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 R1482600
    1 "Black"
    2 "Hispanic"
    3 "Mixed Race (Non-Hispanic)"
    4 "Non-Black / Non-Hispanic"
    /
 T8122500
    429 "Month of current release in a continuous month format"
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
 T8129200
    0 "0"
    1 "1 TO 99: .01-.99"
    100 "100 TO 199: 1.00-1.99"
    200 "200 TO 299: 2.00-2.99"
    300 "300 TO 399: 3.00-3.99"
    400 "400 TO 499: 4.00-4.99"
    500 "500 TO 599: 5.00-5.99"
    600 "600 TO 699: 6.00-6.99"
    700 "700 TO 799: 7.00-7.99"
    800 "800 TO 899: 8.00-8.99"
    900 "900 TO 999: 9.00-9.99"
    1000 "1000 TO 1099: 10.00-10.99"
    1100 "1100 TO 1199: 11.00-11.99"
    1200 "1200 TO 1299: 12.00-12.99"
    1300 "1300 TO 1399: 13.00-13.99"
    1400 "1400 TO 1499: 14.00-14.99"
    1500 "1500 TO 1599: 15.00-15.99"
    1600 "1600 TO 1699: 16.00-16.99"
    1700 "1700 TO 1799: 17.00-17.99"
    1800 "1800 TO 1899: 18.00-18.99"
    1900 "1900 TO 1999: 19.00-19.99"
    2000 "2000 TO 2999: 20.00-29.99"
    3000 "3000 TO 9999: 30.00+"
    /
 T8976700
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
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T8978000
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
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 Z9083800
    0 "None"
    1 "1st grade"
    2 "2nd grade"
    3 "3rd grade"
    4 "4th grade"
    5 "5th grade"
    6 "6th grade"
    7 "7th grade"
    8 "8th grade"
    9 "9th grade"
    10 "10th grade"
    11 "11th grade"
    12 "12th grade"
    13 "1st year college"
    14 "2nd year college"
    15 "3rd year college"
    16 "4th year college"
    17 "5th year college"
    18 "6th year college"
    19 "7th year college"
    20 "8th year college or more"
    95 "Ungraded"
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
  (R1204500 = CV_INCOME_GROSS_YR_1997) 
  (R1204900 = CV_HH_POV_RATIO_1997) 
  (R1235800 = CV_SAMPLE_TYPE_1997) 
  (R1302600 = CV_HGC_RES_DAD_1997) 
  (R1302700 = CV_HGC_RES_MOM_1997) 
  (R1482600 = KEY_RACE_ETHNICITY_1997)   /* KEY!RACE_ETHNICITY */
  (T8122500 = VERSION_R16_2013) 
  (T8129100 = CV_INCOME_FAMILY_2013) 
  (T8129200 = CV_HH_POV_RATIO_2013) 
  (T8976700 = YINC_1700_2013)   /* YINC-1700 */
  (T8978000 = YINC_2600_2013)   /* YINC-2600 */
  (Z9083800 = CVC_HGC_EVER_XRND) 
.
  /* *end* */

descriptives all.

*--- Tabulations using reference number variables;
*freq var=R0000100, 
  R0536300, 
  R0536401, 
  R0536402, 
  R1204500, 
  R1204900, 
  R1235800, 
  R1302600, 
  R1302700, 
  R1482600, 
  T8122500, 
  T8129100, 
  T8129200, 
  T8976700, 
  T8978000, 
  Z9083800.

*--- Tabulations using qname variables;
*freq var=PUBID_1997, 
  KEY_SEX_1997, 
  KEY_BDATE_M_1997, 
  KEY_BDATE_Y_1997, 
  CV_INCOME_GROSS_YR_1997, 
  CV_HH_POV_RATIO_1997, 
  CV_SAMPLE_TYPE_1997, 
  CV_HGC_RES_DAD_1997, 
  CV_HGC_RES_MOM_1997, 
  KEY_RACE_ETHNICITY_1997, 
  VERSION_R16_2013, 
  CV_INCOME_FAMILY_2013, 
  CV_HH_POV_RATIO_2013, 
  YINC_1700_2013, 
  YINC_2600_2013, 
  CVC_HGC_EVER_XRND.
