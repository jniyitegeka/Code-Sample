* Jules Niyitegeka
* PSET1
* Econ 970
version 17
clear all
capture log close
cd "/Users/jules/Downloads/ps1"

log using "output/ps1.log", replace

**1 loading datasets
import delimited "rawdata/irs2015.csv", clear
sort zip5
**2 reporting number of observations and variables
describe

//Observations: 191,387 and Variables: 136 

**3 keeping variables of interest
keep year state zip5 cz cz_name bin returns agi wages_amount interest_amount dividends_ordinary_amount dividends_qualified_amount capgains_amount contrib_amount

**4 labeling the variables of interest_amount
label variable year "Year"
label variable state "State"
label variable zip5 "Zip code"
label variable cz "Commuting zone"
label variable cz_name "Commuting zone name"
label variable bin "Size of adjusted gross income"
label variable returns "Number of returns"
label variable agi "Adjusted gross income (AGI) in $1000s"
label variable wages_amount "Salaries and wages in AGI Amount ($1000s)"
label variable interest_amount "Taxable interest Amount ($1000s)"
label variable dividends_ordinary_amount "Ordinary dividends Amount ($1000s)"
label variable dividends_qualified_amount "Qualified dividends Amount ($1000s)"
label variable capgains_amount "Net capital gain (less loss) in AGI Amount ($1000s)"
label variable contrib_amount "Contributions Amount ($1000s)"

**5 using tabulate to report the number (and proportion) of your sample that has each value of the variable bin.
tabulate bin 

**6 cleaning the datasets 
destring agi wages_amount interest_amount dividends_ordinary_amount dividends_qualified_amount capgains_amount contrib_amount returns, replace ignore(",**")
describe agi wages_amount interest_amount dividends_ordinary_amount dividends_qualified_amount capgains_amount contrib_amount returns

**7 creating new variable called agi_per_return
gen agi_per_return = agi/returns
label variable agi_per_return "Amount of adjusted gross income per return ($1000)"
summarize agi_per_return if state == "or" & bin == "All"

//agi_per_return for oregon state with bin with All is around $56,409.79

**8 keeping observations if bin is equal to All
drop if bin != "All"

**9 repeating question number 7 with 2 other variables (wages_amount & contrib_amount)
gen wages_amount_per_return = wages_amount/returns
label variable wages_amount_per_return "Amount of wages amount per return ($1000)"
summarize wages_amount_per_return if state == "or" & bin == "All"

//wages_amount_per_return for oregon state with bin with All is around $35,141.59

gen contrib_amount_per_return = contrib_amount/returns
label variable contrib_amount_per_return "Amount of Contributions Amount per returns ($1000)"
summarize contrib_amount_per_return if state == "or" & bin == "All"

//contrib_amount_per_return for oregon state with bin with All is around $943.5961 

save irs2015_clean, replace

**10 loading new dataset and adding new variables in existing datasets

// use "rawdata/socialcapital_facebook.dta", clear
// sort zip5
// save socialcapital_facebook_clean,replace
// duplicates report zip5

merge 1:1 zip5 using socialcapital_facebook_clean.dta
label variable county "County"
label variable volunteering_rate "A group which is likely to volunteer or do activism"

**11 Answering questions about the merging function
// _merge ==1 refers to unmatched observations found only in our  master dataset
// _merge ==2 refers to unmatched observations found only in our dataset we are using to add a new variable, in this case the variable being volunteering_rate
// _merge ==3 refers to matched observations from master dataset and using dataset

// some zip codes might not have data from Facebook because of data privacy concern where the population is very small and could expose individuals identity, etc
// some zip codes might not have data from IRS because the people in that location might not be qualified to file for tax return (in case they are poor)

// Number of observations with data from both facebook and irs is 22,362 
// Number of observations with data from just facebook is 663
// Number of observations with data from just irs is 4,979

**12  Report the mean of agi_per_return for bin == "All" in ZIP codes with above average volunteering_rate.
summarize volunteering_rate if _merge==3
summarize agi_per_return if bin=="All" & volunteering > .0769089 & _merge == 3

// The mean of agi_per_return for bin == "All" in ZIP codes with above average volunteering_rate is $66,009.9 

**13 saving the final dataset as a stata data file in the "output" folder.

save "output/IRS_Facebook_dataset.dta", replace

**14 Estimating regression of volunteering_rate on agi_per_return
regress volunteering_rate agi_per_return if _merge == 3

//The household with high income have high volunteering rate because with $1000 there is  0.00435 percentage points increase in the volunteering rate holding other variable constant
// Moreover, since our confidence interval 0.0000335 to 0.0000535) does not include zero, we conclude that the coefficient for agi_per_return is statistically significant. This means there is strong evidence to suggest that agi_per_return (income) has an impact on the volunteering rate (volunteering_rate).

**15 Add the variables you created in question 9 to the regression.
regress volunteering_rate agi_per_return wages_amount_per_return contrib_amount_per_return if _merge == 3 

//The positive coefficient of 0.0003979 indicates that for every additional $1,000 in adjusted gross income per return, the volunteering rate increases by approximately 0.04 percentage points, holding other factors constant. Since the 95% confidence interval [0.0003594, 0.0004364] does not include zero, the impact of agi_per_return is statistically significant at the 5% level. 

**16 saving my do.file



