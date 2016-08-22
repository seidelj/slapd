clear
cd /Users/josephseidel/slapd/nls
infile using outcomes.dct
gen id = "NLS97_" + string(R0000100)
save outcomes.dta, replace

clear
infile using outcomes97.dct
save outcomes97, replace

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

gen age = .
replace age = S1241500 if S1241500 > 0
replace age = S1241600 if S1241600 > 0 & S1241600 < age

count if S1241500 != -4 & COD_MOTHER == 2 | COD_MOTHER == 10

count if S1241600 != -4 & COD_FATHER == 2 | COD_FATHER == 10


count if S1241500 != -4 & COD_MOTHER != 2 & COD_MOTHER != 10
count if S1241600 != -4 & COD_FATHER != 2 & COD_FATHER != 10

merge 1:1 R0000100 using outcomes97
drop if _merge != 3
drop _merge


keep R0000100 R0536300 R0536401 R0536402 R1482600 S1241500 S1241600 COD_MOTHER COD_FATHER R1204500 R1204900 T8129200 T8976700 T8978000 age

gen trt = .
replace trt = 1 if COD_MOTHER == 2 | COD_MOTHER == 10 | COD_FATHER == 2 | COD_FATHER == 10
replace trt = 0 if COD_MOTHER != 2 & COD_MOTHER != 10 & COD_FATHER != 2 & COD_FATHER != 10


rename R0536300 gender
rename R1482600 race
gen id = "NLS97_" + string(R0000100)

rename T8976700 wages
rename T8978000 wages_sp

merge 1:1 id using outcomes

drop if _merge != 3
drop _merge

gen incarc = 0
replace incarc = 1 if E8043100 > 0

rename T8129100 grossinc
rename Z9083900 edu
rename R1204500 grossinc_youth
rename T8129200 pov_rat
rename R1204900 pov_rat_youth

replace pov_rat = . if pov_rat < 0
replace pov_rat_youth = . if pov_rat_youth < 0

gen pov = .
replace pov = 1 if pov_rat <= 1
replace pov = 0 if pov_rat > 1

gen pov_youth = .
replace pov_youth = 1 if pov_rat_youth <= 1
replace pov_youth = 0 if pov_rat_youth > 1

replace grossinc = . if grossinc < 0
replace grossinc_youth = . if grossinc < 0

gen faminc = .
replace faminc = grossinc * .9 if grossinc <= 8925 & faminc == .
replace faminc = grossinc * .85 if grossinc <= 36250 & faminc == .
replace faminc = grossinc * .75 if grossinc <= 87850 & faminc == .
replace faminc = grossinc * .72 if grossinc <= 183250 & faminc == .
replace faminc = grossinc * .67 if grossinc <= 398350 & faminc == .
replace faminc = grossinc * .65 if grossinc <= 400000 & faminc == .
replace faminc = grossinc * .604 if grossinc > 400000 & faminc == .

gen faminc_youth = .
replace faminc_youth = grossinc_youth * .9 if grossinc_youth <= 8925 & faminc_youth == .
replace faminc_youth = grossinc_youth * .85 if grossinc_youth <= 36250 & faminc_youth == .
replace faminc_youth = grossinc_youth * .75 if grossinc_youth <= 87850 & faminc_youth == .
replace faminc_youth = grossinc_youth * .72 if grossinc_youth <= 183250 & faminc_youth == .
replace faminc_youth = grossinc_youth * .67 if grossinc_youth <= 398350 & faminc_youth == .
replace faminc_youth = grossinc_youth * .65 if grossinc_youth <= 400000 & faminc_youth == .
replace faminc_youth = grossinc_youth * .604 if grossinc_youth > 400000 & faminc_youth == .


keep id trt race gender incarc faminc faminc_youth pov pov_youth edu wages wages_sp age

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
rename R0217910 pov_youth
rename R0217900 faminc_youth
rename T4112500 pov
rename T3977400 wages
rename T3987600 wages_sp
rename R0000600 age

replace race = 4 if race == 3

gen incarc = 0
foreach var of varlist R0402800 R0612100 R0828400 R1075700 R1451400 R1798600 R2160200 R2369100 R2500000 R2900000 R3100000 R3500000 R3700000 R4100300 R4500300 R5200300 R5800200 R6530300 R7090700 R7800600 T0001000 T1200800 T2260700 T3195700 {
	replace incarc = 1 if `var' == 5
	}
	

gen id = "NLS79_" + string(R0000100)
keep id trt race gender incarc faminc faminc_youth edu pov_youth pov wages wages_sp age

merge 1:1 id using main
drop _merge

replace faminc = . if faminc < 0
replace edu = . if edu < 0

gen hs = 1 if edu >= 12
replace hs = 0 if edu < 12

replace pov_youth = . if pov_youth < 0
replace pov = . if pov < 0

replace faminc_youth = . if faminc_youth < 0
replace wages = 0 if wages == -5
replace wages = . if wages < 0
replace wages_sp = 0 if wages == -5
replace wages_sp = . if wages_sp < 0

gen college = 1 if edu >= 16
replace college = 0 if edu < 16
replace college = . if hs == 0

gen total_wages = .
replace total_wages = wages + wages_sp if wages != . & wages_sp != .
replace total_wages = wages if wages_sp == . & total_wages == .
replace total_wages = wages_sp if wages == . & total_wages == .





