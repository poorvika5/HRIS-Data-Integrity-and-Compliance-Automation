# HRIS Data Integrity and Compliance Project  

## Overview  
This project focuses on optimizing HR data management and compliance by automating audits, analyzing workforce trends, and visualizing key HR metrics. The goal is to enhance HR data integrity, improve recruitment efficiency, and ensure compliance with federal and state regulations. The project utilizes **Python** for data processing, **SQL** for HR data queries, and **Power BI** for data visualization.

## Project Structure  

### **1. Python Scripts**  
- **`hris_audit.py`** – Audits HRIS data for discrepancies in I-9 verification, Workday entries, and document storage.  
- **`recruitment_tracking.py`** – Automates recruitment tracking and candidate data extraction from Workday and Monday.  
- **`employee_turnover_analysis.py`** – Analyzes employee turnover trends to provide insights for HR strategies.  
- **`hr_performance_dashboard.py`** – Generates data visualizations for workforce analytics.  

### **2. Data Files**  
- **`HRIS_Audit_Report.csv`** – Contains employee records with compliance discrepancies.  
- **`employee_data.csv`** – Includes HR details such as hire dates, terminations, and performance scores.  
- **`recruitment_data.csv`** – Stores recruitment metrics, including job postings and candidate pipeline data.  
- **`turnover_trends.csv`** – Aggregated data used for analyzing employee turnover.  

### **3. Visualizations and Dashboards**  

#### **Python Visualizations:**  
- **Employee Turnover Trends** – A line chart showing employee retention rates over time.  
- **Recruitment Efficiency** – A bar chart tracking the number of job postings, applications, and hires.  
- **HRIS Compliance Check** – A dashboard identifying discrepancies in employee records.  

#### **Power BI Dashboards:**  
1. **HR Compliance Dashboard**  
   - Data: `HRIS_Audit_Report.csv`  
   - **Visualizations:**  
     - Compliance Rate Over Time  
     - Employees with Missing I-9 Verification  
     - Workday Entry Discrepancies  

2. **Recruitment Insights Dashboard**  
   - Data: `recruitment_data.csv`  
   - **Visualizations:**  
     - Applications vs. Hires  
     - Time-to-Hire Analysis  
     - Job Posting Trends  

3. **Employee Turnover Dashboard**  
   - Data: `turnover_trends.csv`  
   - **Visualizations:**  
     - Monthly Employee Retention Rates  
     - Key Factors Contributing to Attrition  
     - Department-wise Turnover Trends  

---

## **4. SQL Queries**  
These SQL queries help extract relevant HR insights from your database.

### **Turnover Analysis:**  
Retrieve turnover rates in the past year:  
```sql
SELECT COUNT(*) AS Terminated_Employees, 
       COUNT(*) / (SELECT COUNT(*) FROM HRIS_Employee_Data) * 100 AS Turnover_Rate
FROM HRIS_Employee_Data
WHERE Termination_Date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
```

### **Compliance Checks:**  
Identify employees with missing I-9 verification:  
```sql
SELECT Employee_ID, Name 
FROM HRIS_Employee_Data 
WHERE I-9_Verified = 0;
```

### **Recruitment Data Analysis:**  
Get the number of job postings and hires over the past 6 months:  
```sql
SELECT Job_Title, COUNT(*) AS Total_Postings, 
       SUM(CASE WHEN Status = 'Hired' THEN 1 ELSE 0 END) AS Hires
FROM recruitment_data
WHERE Posting_Date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY Job_Title;
```

---

## **How to Run the Project**  

### **Prerequisites**  
Ensure you have the following Python packages installed:  
- `pandas`  
- `matplotlib`  
- `seaborn`  
- `scipy`  
- `sqlalchemy`  

Install them using:  
```bash
pip install pandas matplotlib seaborn scipy sqlalchemy
```

### **Running the Scripts**  

#### **1. Run the HRIS Data Audit**  
This script checks for missing I-9 verifications, Workday entries, and document discrepancies.  
```bash
python hris_audit.py
```

#### **2. Analyze Employee Turnover**  
This script analyzes employee turnover trends and generates reports.  
```bash
python employee_turnover_analysis.py
```

#### **3. Automate Recruitment Tracking**  
This script extracts and tracks candidate pipeline data.  
```bash
python recruitment_tracking.py
```

#### **4. Generate HR Dashboards**  
This script processes HR data and creates visual reports.  
```bash
python hr_performance_dashboard.py
```

---

## **Reviewing Results**  
- **Check `HRIS_Audit_Report.csv`** for compliance discrepancies.  
- **Load `recruitment_data.csv` into Power BI** for insights on hiring trends.  
- **Use `turnover_trends.csv`** for workforce retention analysis.
