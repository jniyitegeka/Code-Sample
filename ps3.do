* Jules Niyitegeka
* PSET3
* Econ 970
version 18
clear all
capture log close
cd "/Users/jules/Downloads/ps3"

log using "output/ps3.log", replace


**Q2: loading dataset with bin variable restrictions

use "rawdata/irssoi_county.dta" if bin == "All" | bin == "$100,000 under $200,000" | bin == "$200,000 or more"
sort CountyFIPS

**Q3: creating summary statistics table 1 using outreg2
outreg2 using "output/table1.xls", sum(detail) eqkeep(N mean std min max) title("Table 1 Summary Statistics Pooling All Data") replace 

**Q4: using bysort and esttab to create table 2 

bysort incomebin: eststo: estpost sum agi_per_return contrib_per_return cg_per_return wages_per_return capital_per_return business_per_return ///
partnership_per_return anycg anywages anybusiness anypartnership anycharitabl [aw=returns]
esttab using "output/table2.doc", main (mean) aux(sd) rtf replace label varwidth(30) title ("Table 2: Composition of Income by Size of Adjusted Gross Income") ///
mtitle ("All" "$100K-$200K" ">$200K") nonotes  addnotes("NOTE: Table reports weighted averages with standard deviations in parentheses by size of AGI in 2009-15.") b(%9.2f)


**Q5: merging two datasets

/*
I reshaped wide the irssoi_county.dta so that I could have it in the same format as the health dataset. Merged two datasets on County. Reshaped the final dataset in long format again for the final tasks

*/
reshape wide returns capital_share salary_share business_share partnership_share agi_per_return contrib_per_return cg_per_return wages_per_return capital_per_return business_per_return partnership_per_return anycg anywages anybusiness anypartnership anycharitable, i(CountyFIPS CountyName StateFIPS State bin incomebin) j(year)
destring  StateFIPS ,replace ignore(", **, .")
save "output/merge_", replace

frame create health
frame health: use "rawdata/health_county_2024.dta"
frame change health
sort CountyFIPS
merge 1:m CountyFIPS using "output/merge_"

reshape long healthy_days returns capital_share salary_share business_share partnership_share agi_per_return contrib_per_return cg_per_return wages_per_return capital_per_return business_per_return partnership_per_return anycg anywages anybusiness anypartnership anycharitable, i(CountyFIPS CountyName StateFIPS State bin incomebin) j(year)
save "output/irssoi_county_healthdays", replace

**Q6: replicating the 3rd table using regression and reghdfe

*Regression 1
sum healthy_days
gen mean_heath_days = r(mean)

reg healthy_days wages_per_return capital_per_return if bin == "All" [aw=returns], vce(cluster CountyFIPS)
outreg2 using "output/table3.doc", ctitle("Healthy Days") nocons title("Table 3. The Effect of Wealth on Health") label sdec(3) bdec(3) addtext(Adjusted R-squared, `: di %9.3f e(r2_a)', Year fixed effects, No, County fixed effects, No) addstat("Mean of Dep.Var.(weighted)", mean_heath_days) nonot nor2 addn(NOTE--Table reports regression coefficients with standard errors clustered by county in parentheses. The dependent variable in each regression is the average number of healthy days per month. Columns 2 and 3 include year fixed effects. Column 3 includes year fixed effects and county fixed effects. All regressions are weighted by the number of tax returns in each county. Data are at the county level. The years are 2009-15. Capital income includes interest income, capital gains, and dividends. Wage and capital income are taken from IRS form 1040. *** p<0.01, ** p<0.05, * p<0.1) replace  

*Regression 2
reghdfe healthy_days wages_per_return capital_per_return if bin == "All" [aw=returns], absorb(year) vce(cluster CountyFIPS)
outreg2 using "output/table3.doc", keep(wages_per_return capital_per_return)  ctitle("Healthy Days") nocons label sdec(3) bdec(3) addtext(Adjusted R-squared, `: di %9.3f e(r2_a)', Year fixed effects, Yes, County fixed effects, No) addstat("Mean of Dep.Var.(weighted)", mean_heath_days) nor2 
 
*Regression 3
reghdfe healthy_days wages_per_return capital_per_return if bin == "All" [aw=returns], absorb(year CountyFIPS) vce(cluster CountyFIPS)
outreg2 using "output/table3.doc", keep(wages_per_return capital_per_return) ctitle("Healthy Days") nocons label sdec(3) bdec(3) addtext(Adjusted R-squared, `: di %9.3f e(r2_a)', Year fixed effects, Yes, County fixed effects, Yes) addstat("Mean of Dep.Var.(weighted)", mean_heath_days) nor2  

tab treat


