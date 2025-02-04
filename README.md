# Code-Sample

# Data Analysis & Coding Samples

## Overview
- This repository contains sample scripts in Stata and Python that demonstrate my experience with data analysis, statistical modeling, and machine learning.
Each script represents a sample of my work.
- **_Yellow markdown annotations in python code_** to clarify my contributions since I was not the sole contributor

---

### 📌 1️⃣ Stata
**Final Project Data Analysis - Econ 970 (STATA)**  

#### **Data Analysis Objective**  
This study evaluates whether state-level student loan informational provision bills, aimed at enhancing transparency and borrower awareness, have reduced default rates. The **Callaway and Sant’Anna Difference-in-Differences (CSDID)** method is applied, and the analysis finds no significant impact on default rates as of 2021.

#### **Overview**
- This file contains the **analysis code** for my **final project**, which uses the **College Scorecard dataset (2011-2022)** to evaluate institutional performance and the factors influencing student outcomes.
- Focuses on **institution-level** data, including **costs, student demographics, graduation rates, and 3-year student loan default rates**, primarily for institutions participating in **federal Title IV financial aid programs**.
- **Data sources**: **IPEDS, NSLDS, and federal tax records** to track institutional performance over time.

#### **Sections**
1. **Cleaning**
   - Addressing data limitations (e.g., discontinuation of the 2-year default rate after 2011).
   - Aggregating **student loan data** and calculating **proxies like average family income**.
2. **Exploratory Data Analysis (EDA)**
   - Generating **summary statistics** and **visualizing institutional trends**.
3. **Analysis**
   - Applying **Callaway and Sant’Anna’s Difference-in-Differences (DID)** to assess policy impact.
   - Examining how **demographic and financial variables** influence **student loan default rates**.

📌 **[View Script](score.do)**

---

### 📌 2️⃣ Python
**Headline Sentiment Classification & Clickbait Detection**  

#### **Objective**  
Train and evaluate **machine learning models** that classify **headline sentiment** (positive, neutral, or negative) and detect **clickbait** using engineered text features.

#### **Overview**
- Dataset consists of **news headlines** with **sentiment scores** (classified as negative ≤ -0.2, neutral -0.2 to 0.4, positive ≥ 0.4).
- **Feature engineering**
- **Yellow markdown annotations** indicate the code I wrote.

#### **Methodology**
1. **Feature Engineering**
   - Created **sentiment word-based features** (flags, counts, and density ratios).
2. **Model Training**
   - Trained and tested Linear Regression, Decision Tree
📌 **[View Script](milestone_5.ipynb)**

---
