-- Query to retrieve active employees
SELECT Employee_ID, Name, Hire_Date
FROM HRIS_Employee_Data
WHERE Termination_Date IS NULL;

-- Query to find employees with missing I-9 verification
SELECT Employee_ID, Name
FROM HRIS_Employee_Data
WHERE I-9_Verified = 0;

-- Query to generate a report of newly hired employees in the last 6 months
SELECT Employee_ID, Name, Hire_Date
FROM HRIS_Employee_Data
WHERE Hire_Date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- Query to find records with missing Workday entries
SELECT Employee_ID, Name
FROM HRIS_Employee_Data
WHERE Workday_Entry = 0;

-- Query to check discrepancies in employee records
SELECT Employee_ID, Name
FROM HRIS_Employee_Data
WHERE I-9_Verified = 0 OR Workday_Entry = 0 OR Document_Stored = 0;
