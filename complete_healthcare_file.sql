-- Q1 : What's the count of patients by gender ?

-- Count of patients by gender
SELECT Gender, COUNT(*) AS Patient_Count
FROM healthcare
GROUP BY Gender;


-- Q2: What's the number of patients in each blood type ?

-- Count of patients by blood typo
SELECT 
    `Blood Type`, 
    COUNT(*) AS Patient_Count 
FROM 
    healthcare 
GROUP BY 
    `Blood Type`;


-- Q3 : How many patients were handled by each doctor, also find the doc with max no. of patients ?

-- Patients handled by each doctor
SELECT Doctor, COUNT(*) AS Patient_Count
FROM healthcare
GROUP BY Doctor
ORDER BY Patient_Count DESC;


-- Q4: How many patients were admitted in which hospitals, also the hospital with max no. of patients?

-- Admissions by hospital
SELECT Hospital, COUNT(*) AS Admissions
FROM healthcare
GROUP BY Hospital
ORDER BY Admissions DESC;


-- Q5: What's the average billing amount by medical condition and which condition takes the most amount?

-- Average billing amount by medical condition
SELECT `Medical Condition`, AVG(`Billing Amount`) AS Avg_Billing
FROM healthcare
GROUP BY `Medical Condition`
ORDER BY Avg_Billing DESC;


-- Q6: What's the Total billing amount by medical condition and which condition takes the most amount?

-- Total billing amount by insurance provider
SELECT `Insurance Provider`, SUM(`Billing Amount`) AS Total_Billing
FROM healthcare
GROUP BY `Insurance Provider`
ORDER BY Total_Billing DESC;


-- Q7: What's the number of admissions type ?

-- Count admissions by type (Emergency, Elective, etc.)
SELECT `Admission Type`, COUNT(*) AS Admission_Count
FROM healthcare
GROUP BY `Admission Type`;


-- Q8: What's the average length of stay by medical condition and which has the highest ?

-- Average length of stay by medical condition
SELECT `Medical Condition`, AVG(DATEDIFF(`Discharge Date`, `Date of Admission`)) AS Avg_Stay
FROM healthcare
GROUP BY `Medical Condition`
ORDER BY `Avg_Stay` DESC;


-- Q9: Whats the most prescribed medication?

-- Most prescribed medications
SELECT Medication, COUNT(*) AS Prescriptions
FROM healthcare
GROUP BY Medication
ORDER BY Prescriptions DESC;


-- Q10: What's the number of admissions by month and which month has the highest?

-- Admissions by month
SELECT 
monthname(`Date of Admission`) AS Admission_Month, COUNT(*) AS Admission_Count
FROM healthcare
GROUP BY Admission_Month
ORDER BY Admission_Count DESC;


-- Q11: Whats the Total billing amount per insurance  provider?

-- Total billing amount per insurance provider
SELECT `Insurance Provider`, SUM(`Billing Amount`) AS Total_Billing
FROM healthcare
GROUP BY `Insurance Provider`
ORDER BY Total_Billing DESC;


-- Q12: What are the top 5 hospitals with the shortest stay for Common conditions (with atleast 10 patients for that disease)?

-- Top 5 Hospitals with the Best Outcomes 
SELECT 
    Hospital, 
    `Medical Condition`, 
    AVG(DATEDIFF(`Discharge Date`, `Date of Admission`)) AS Avg_Stay
FROM healthcare
GROUP BY Hospital, `Medical Condition`
HAVING COUNT(*) >= 10 
ORDER BY Avg_Stay ASC
LIMIT 5;


-- Q13: Whats the seasonal admissions trend ? (Month wise)

-- Seasonal Admission Trends by medical condition
SELECT 
    `Medical Condition`, 
    monthname(`Date of Admission`) AS Admission_Month, 
    COUNT(*) AS Admission_Count
FROM healthcare
GROUP BY `Medical Condition`, Admission_Month
HAVING Admission_Count > 10
ORDER BY Admission_Month, Admission_Count DESC;


-- Q14: How many patients have Complications (multiple medications and Tests) ?

-- Patients with Complications (Medications > 3 and Test >= 3)
SELECT 
    Name, 
    COUNT(DISTINCT Medication) AS Med_Count, 
    COUNT(DISTINCT `Test Results`) AS Test_Count
FROM healthcare
GROUP BY Name
HAVING Med_Count > 3 AND Test_Count >= 3
ORDER BY Med_Count DESC, Test_Count DESC;
