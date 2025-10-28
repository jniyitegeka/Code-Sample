# Code-Sample

# Data Analysis & Coding Samples

## Overview
- This repository contains sample scripts in Stata and Python that demonstrate my experience with data analysis, statistical modeling, and machine learning.  
- Each script represents a sample of my work.  

---
### 📌 1️⃣ Project: How Busy Is The MAC?

This project analyzed Harvard’s gym check-in data to identify peak usage times, helping inform facility management decisions.

**Tools:** Python, pandas, matplotlib  
**Data:** 30,000+ anonymized gym check-ins  
**Read the full project:** [How Busy Is The MAC? (HODP)](https://www.hodp.org/project/how-busy-is-the-mac/)

### 📌 2️⃣ Stata Hands-On Modules: Econ 970 (STATA)

#### **Module 1: Quantifying the Determinants of Social Capital using IRS and Facebook Data**
This section explores geocoded administrative data from the Internal Revenue Service (IRS) for 2009–2015 to study the determinants of social capital and volunteering rates. By combining IRS data with newly released Facebook data, this module introduces data construction, cleaning, regression analysis, and visualization.  

**Skills Developed:** dataset building, merging multiple data sources, cleaning data, using SSC commands, running regressions, and creating graphs/maps/tables.  

📌 **[View Script](ps1.do)**  

---

#### **Module 2: Data Wrangling with Geocoded Administrative Data from the IRS**
This module extends the previous exercise by creating a panel dataset (2012–2015) using Stata loops and local macros. It emphasizes techniques to append, merge, and aggregate data while minimizing errors.  

**Skills Developed:** loops and local variables, appending multiple years, merging datasets, collapsing data to higher geographic levels, and working with panel structures.  

📌 **[View Script](Jules_Niyitegeka_ps2.do)**  

---

#### **Module 3: What is the Effect of Wealth on Health?**
Using county-level IRS panel data, this module studies the relationship between health and income, inspired by Pritchett & Summers (1996). It focuses on automating the creation of summary statistics and regression tables for inclusion in research papers.  

**Skills Developed:** generating automated summary statistics and regression tables, exporting results, and improving reproducibility in research workflows.  

📌 **[View Script](ps3.do)**  

---

#### **Module 4: Estimating Causal Effects using Differences-in-Differences**
This module examines how capital gains realizations respond to changes in capital gains tax rates using a differences-in-differences design based on the 2012 American Taxpayer Relief Act.  

**Skills Developed:** implementing DID designs, using quasi-experimental variation, visualizing results with Stata graphics, and evaluating policy impacts.  

📌 **[View Script](pset4.do)**  

---

### **Final Project Data Analysis**

#### **Data Analysis Objective**
This study evaluates whether state-level student loan informational provision bills, aimed at enhancing transparency and borrower awareness, have reduced default rates. The **Callaway and Sant’Anna Difference-in-Differences (CSDID)** method is applied, and the analysis finds no significant impact on default rates as of 2021.

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

### 📌 3️⃣ Python  
#### **Final Project Data Analysis – CS109A: Headline Sentiment Classification & Clickbait Detection**

#### **Objective**
Train and evaluate **machine learning models** that classify **headline sentiment** (positive, neutral, or negative) and detect **clickbait** using engineered text features.

#### **NOTE**
- **Yellow markdown annotations** indicate the code I wrote.

#### **Methodology**
1. **Feature Engineering**
   - Created **sentiment word-based features** (flags, counts, and density ratios).
2. **Model Training**
   - Trained and tested Linear Regression, Decision Tree.

📌 **[View Script](milestone_5.ipynb)**  

---

### 📌 3️⃣ Python  
#### **Final Project Data Analysis – CS109B: Quick, Draw! Image Classification with Vision Transformers**

#### **Objective**
Train and evaluate a **Vision Transformer (ViT)** model to classify **hand-drawn sketches** from the Quick, Draw! dataset using deep learning techniques.

#### **NOTE**
- Group project.

#### **Methodology**
1. **Image Preprocessing**
   - Resized and normalized grayscale sketches.  
   - Converted image files into ViT-compatible format.
2. **Model Training**
   - Fine-tuned a **pretrained Vision Transformer** using Hugging Face’s `transformers` library.  
   - Tuned hyperparameters: learning rate, batch size, optimizer, epochs.  
   - Applied data augmentation to improve model robustness.
3. **Evaluation**
   - Measured model accuracy and validation loss.  
   - Analyzed confusion matrices to assess misclassification patterns.

📌 **[View Script](ms5.ipynb)**  

---
