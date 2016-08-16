clear
cd /Users/josephseidel/slapd/nls
infile using outcomes.dct
gen id = "NLS97_" + string(R0000100)
save outcomes.dta, replace

clear
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

keep R0000100 R0536300 R0536401 R0536402 R1482600 S1241500 S1241600 COD_MOTHER COD_FATHER

gen trt = .
replace trt = 1 if COD_MOTHER == 2 | COD_MOTHER == 10 | COD_FATHER == 2 | COD_FATHER == 10
replace trt = 0 if COD_MOTHER != 2 & COD_MOTHER != 10 & COD_FATHER != 2 & COD_FATHER != 10


rename R0536300 gender
rename R1482600 race
gen id = "NLS97_" + string(R0000100)
keep id gender race trt

merge 1:1 id using outcomes

drop if _merge != 3
drop _merge

gen incarc = 0
replace incarc = 1 if E8043100 > 0

rename T8129100 grossinc
rename Z9083900 edu
replace grossinc = . if grossinc < 0

gen faminc = .
replace faminc = grossinc * .9 if grossinc <= 8925 & faminc == .
replace faminc = grossinc * .85 if grossinc <= 36250 & faminc == .
replace faminc = grossinc * .75 if grossinc <= 87850 & faminc == .
replace faminc = grossinc * .72 if grossinc <= 183250 & faminc == .
replace faminc = grossinc * .67 if grossinc <= 398350 & faminc == .
replace faminc = grossinc * .65 if grossinc <= 400000 & faminc == .
replace faminc = grossinc * .604 if grossinc > 400000 & faminc == .

keep id trt race gender incarc faminc edu

save main, replace 

clear

infile using death79.dct

drop if R0006700 != 0 & R0008100 != 0 & R0223100 !=0 & R0223500 != 0

gen COD_MOTHER = .
replace COD_MOTHER = H0002500 if H0002500 > 0 & (R0006700 == 0 | R0223100 == 0)
replace COD_MOTHER = H0014800 if H0014800 > 0 & (R0006700 == 0 | R0223100 == 0)

gen COD_FATHER = .
replace COD_FATHER = H0001700 if H0001700 > 0 & (R0223500 == 0 |  R0008100==0)
replace COD_FATHER = H0013700 if H0013700 > 0 & (R0223500 == 0 |  R0008100==0)

drop if COD_FATHER == . & COD_MOTHER == .

gen trt = .
replace trt = 1 if COD_FATHER == 2
replace trt = 1 if COD_MOTHER == 2
replace trt = 0 if COD_FATHER != 2 & COD_MOTHER != 2


rename R0214700 race
rename R0214800 gender 
rename T4112300 faminc
rename T4113000 edu

replace race = 4 if race == 3

gen incarc = 0
foreach var of varlist R0402800 R0612100 R0828400 R1075700 R1451400 R1798600 R2160200 R2369100 R2500000 R2900000 R3100000 R3500000 R3700000 R4100300 R4500300 R5200300 R5800200 R6530300 R7090700 R7800600 T0001000 T1200800 T2260700 T3195700 {
	replace incarc = 1 if `var' == 5
	}
	

gen id = "NLS79_" + string(R0000100)
keep id trt race gender incarc faminc edu

merge 1:1 id using main
drop _merge

replace faminc = . if faminc < 0
replace edu = . if edu < 0

gen hs = 1 if edu >= 12
replace hs = 0 if edu < 12

gen college = 1 if edu >= 16
replace college = 0 if edu < 16
replace college = . if hs == 0






