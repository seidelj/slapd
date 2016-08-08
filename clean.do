clear
cd /Users/josephseidel/slapd/nls

infile using dataset1DEATH.dct

drop if S1240800 != 1 & S1240801 != 1
 
gen COD_MOTHER = .
replace COD_MOTHER = T4581000 if T4581000 > 0
replace COD_MOTHER = T6213300 if T6213300 > 0 
replace COD_MOTHER = T7710700 if T7710700 > 0 
replace COD_MOTHER = T9112700 if T9112700 > 0


gen COD_FATHER = .
replace COD_FATHER = T4580600 if T4580600 > 0
replace COD_FATHER = T6212900 if T6212900 > 0
replace COD_FATHER = T7710300 if T7710300 > 0  
replace COD_FATHER = T9112300 if T9112300 > 0
drop if COD_FATHER == 999

count if S1241500 != -4 & COD_MOTHER == 2 | COD_MOTHER == 10

count if S1241600 != -4 & COD_FATHER == 2 | COD_FATHER == 10


count if S1241500 != -4 & COD_MOTHER != 2 & COD_MOTHER != 10
count if S1241600 != -4 & COD_FATHER != 2 & COD_FATHER != 10
