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
**Final Project Data Analysis - CS109B: Headline Sentiment Classification & Clickbait Detection**  

#### **Objective**  
Train and evaluate **machine learning models** that classify **headline sentiment** (positive, neutral, or negative) and detect **clickbait** using engineered text features.

#### **NOTE**
- **Yellow markdown annotations** indicate the code I wrote.

#### **Methodology**
1. **Feature Engineering**
   - Created **sentiment word-based features** (flags, counts, and density ratios).
2. **Model Training**
   - Trained and tested Linear Regression, Decision Tree
     
📌 **[View Script](milestone_5.ipynb)**

---
### 📌 3️⃣ Python  
**Final Project Data Analysis - CS109B: Quick, Draw! Image Classification with Vision Transformers**

#### **Objective**  
Train and evaluate a **Vision Transformer (ViT)** model to classify **hand-drawn sketches** from the Quick, Draw! dataset using deep learning techniques.

#### **NOTE** 
- Group project.

#### **Methodology**  
1. **Image Preprocessing**  
   - Resized and normalized grayscale sketches  
   - Converted image files into ViT-compatible format  

2. **Model Training**  
   - Fine-tuned a **pretrained Vision Transformer** using Hugging Face's `transformers` library  
   - Tuned hyperparameters: learning rate, batch size, optimizer, epochs  
   - Applied data augmentation to improve model robustness  

3. **Evaluation**  
   - Measured model accuracy and validation loss  
   - Analyzed confusion matrices to assess misclassification patterns  

📌 **[View Script](ms5.ipynb)**

---
