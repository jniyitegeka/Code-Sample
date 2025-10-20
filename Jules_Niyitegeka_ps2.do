* Jules Niyitegeka
* PSET2
* Econ 970
version 17
clear all
capture log close
cd "/Users/jules/Downloads/ps2"

log using "output/JulesNiyitegeka_ps2.log", replace

***Q1: importing datasets using forvalues
forvalues i = 2012/2015 {
    clear
    import delimited "rawdata/irs`i'.csv"
    gen irs = `i'
    save "rawdata/irs`i'.dta", replace
}

/*
***Q2: explaining data merging options
- merge is used to add more variables to the master data set from using data. it combines observations that have the same value of an identifier variable or variables, so the result has all the variables from both files
- append is used to add more observations to the master data set from the using data set containing the same kind of the things but not the same things 
- joinby command in Stata forms all pairwise combinations of observations within groups defined by varlist, joining the dataset in memory with a sorted Stata-format dataset on disk, with options to handle unmatched observations, update or replace values, specify a merge marker, and manage value labels.

- many-to-many merge is a bad idea because Stata pairs it with all matching observations in the other dataset, which leads to an exponential increase in the number of observations. This often results in duplicated or misleading data, making it difficult to interpret and analyze the results accurately

*/

***Q3: adding observations in my dataset using append option
forvalues i = 2012/2014 {
    append using "rawdata/irs`i'.dta"
	save "rawdata/appended_irs.dta", replace
}

***Q4 running another do file from within the dataset to label the variables
run "dofiles/label_irsdata.do"

***Q5: destringing all other variables except year, zip5, bin, incomebin, and state.
*drop variables i will not need on later questions to speed up destring process
keep year state zip5 bin incomebin returns agi wages_number wages_amount interest_amount 

ds year zip5 bin incomebin state, not
destring `r(varlist)',replace ignore(", **, .")


***Q6: compressing datasets and saving it
compress 
save "output/irssoi_20122015.dta", replace

***Q7: using frame to access another datasets
frame create crosswalk
frame crosswalk: use "crosswalk/zips_xwalk.dta"
frame change crosswalk
// variable names are in capital letters and different from master data set for zipcode, and others are numerical
ds PONAME CountyName CZName1990definition State, not
destring `r(varlist)', replace
rename ZIP_CODE zip5
sort zip5
save "output/crosswalk.dta", replace


***Q8: adding variables county and countyname in the master data set

frame change default
sort zip5
merge m:1 zip5 using "output/crosswalk.dta", keepusing(CountyFIPS CountyName)

***Q9: tabulate zip codes that didn't matchin with crosswalk data set
tabulate zip5 if _merge== 1
keep if _merge ==3

// ZIP codes are around 1,427 and it is contains counties with less than 100 returns and those identified as a single building or nonresidential ZIP code were categorized as "other" (99999) so these zip codes correspond doesn't to "real" places.

***Q10: collapsing
collapse (sum) returns agi wages_number wages_amount interest_amount, by(CountyFIPS CountyName bin incomebin year)

***Q11:
egen id_code = group(CountyFIPS incomebin)

// isid checks whether the specified variables uniquely identify the observations. isid might help us to know whetner our id_code uniquely identify the CountyFIPS and incomebin observations.It might fail in this case because the same id might have multiple different observations in different years.

***Q12: declaring data to be panel dataset
xtset id_code year
xtdescribe

***Q13: lag operator for three year growth in number of returns
gen d3logreturns = log(returns) - log(L3.returns)
label variable d3logreturns "3 year growth in returns (natural logs)"

***Q14: 
// gsort -d3logreturns
// list CountyName agi d3logreturns if agi > 200000 in 1/5
keep if agi > 200000
gsort -d3logreturns 

list CountyName agi d3logreturns in 1/5


//I hypothesize that the economic growth in those five counties significantly outpaced the rest between 2012 and 2015. Over that time, residents in these counties experienced steadily increasing incomes, leading to a more rapid rise in tax revenues compared to other counties. To validate this hypothesis, I would need data on GDP growth rates for the same period (2012-2015) as well as employment data to evaluate job creation and employment levels during that time. Additionally, I would conduct an econometric analysis to determine whether the growth in these counties was statistically significant compared to other cities and do regression analysis assessing the relationship between high-income job creation and the growth in tax returns.
