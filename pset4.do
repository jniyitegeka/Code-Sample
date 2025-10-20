* Jules Niyitegeka
* PSET3
* Econ 970
version 17

clear all

capture log close

cd "/Users/jules/Downloads/ps4"
log using "output/ps4.log", replace

*Q3: loading dataset
use "rawdata/irssoi_cz.dta", replace

*Q4: collapsing data so that it contains means of the variable cg_per_return by year, bin, and incomebin.

collapse (mean) cg_per_return [aw=returns], by(year bin incomebin)

save "output/collapsed", replace

*Q5: adding another variable to our dataset using frame and tax dataset
frame create taxrate
frame taxrate: use "rawdata/taxrates_wide.dta", replace
frame change taxrate

reshape long cg_rate, i(bin) j(year)

*Q6 merging the dataset
merge 1:m year bin using "output/collapsed"

/*
14 observations were successfully matched from both datasets. From the taxrate datasets, all observations were matched. In the IRS dataset, 35 obsevations didn't get matched because the observations are 
from non control or treatment bin group. There are 35 unique observations in IRS data and 0 unique observations in Tax rate data set.

*/

*Q7: Panel A plot 
label variable cg_rate "Capital Gains Tax Rate (%)"
label variable year "Year"

graph twoway (scatter cg_rate year if incomebin == 6, msymbol(T) connect(L) mcolor(black)) ///
(scatter cg_rate year if incomebin == 7,  msymbol(S) connect(L) mcolor(red)  lpattern(dash) lcolor(red)) ///
, ylabel(0(5)25) xlabel(2009(1)2015) xline(2012.5, lwidth(thin) lpattern(solid) lcolor(red)) ///
title("(a) Top capital gains tax rate by size of AGI") ///
legend(rows(1) label(1 "[$100K,$200K] (control)") label(2 "> $200K (treatment)") position(6))
graph export "output/figure1.png",replace


*Q8: Panel B Plot

graph twoway (scatter cg_per_return year if incomebin == 6, c(l)  msymbol(T) mcolor(black)) (scatter cg_per_return year if incomebin == 7, c(l)  mcolor(red)  lpattern(dash) lcolor(red) yaxis(2)),ylabel(1.5(0.5)3.5) ylabel(50(10)90, axis(2))  ytitle("Control Group ($1000s)") ytitle("Treatment Group($1000s)", axis(2))  xlabel(2009(1)2015) title("(b) Realized capital gains by size of AGI") xline(2012.5, lwidth(thin) lpattern(solid) lcolor(red))  legend(rows(1) label(1 "[$100K,$200K] (control)") label(2 "> $200K (treatment)") position(6))
graph export "output/figure2.png", replace

*Q9: regression table

frame change default
frame default: use "rawdata/irssoi_cz.dta", replace


gen treat = 0 if incomebin == 6
replace treat = 1 if incomebin == 7

gen post = 0 if year < 2013
replace post = 1 if year >= 2013

reg cg_per_return treat post i.post##i.treat, r
outreg2 using "output/table1.doc", replace keep(treat post 1.post##1.treat)

*Q10: figure and table interpretation
/*
In the first figure the tax between two groups before 2013 is relatively the same. However with the increase 17% capital gains for household with adjusted gross income(AGI) of above $200k the, the treatment group gains increases more, differing from the control group of households with AGI between $100k and $200K. 

In the second figure we see that realized gains for treatment group AGI above $200k had higher than those in control group before the capitalized gains tax was raised, but after this increase the it reversed.

Table interpretation: the regression shows a statistically significant negative coefficient on the interaction term, supporting the hypothesis that higher capital gains tax rates reduce capital gains realizations among high-income taxpayers.

The equation to estimate diff-in-diff looks fine to me but if I was to modify something, I would include other control variables to capture other confounding factors like household characteristics, etc
*/



