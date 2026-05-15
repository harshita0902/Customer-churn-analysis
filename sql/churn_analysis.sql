#ALL Customers
SELECT * 
FROM cleaned_churn_data
LIMIT 5;

#Churned customers
SELECT COUNT(*) AS churned_customers
FROM cleaned_churn_data
WHERE Churn = 'Yes';

#Churn rate
SELECT 
ROUND(
100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS churn_rate
FROM cleaned_churn_data;

#Churn by Contract Type
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM cleaned_churn_data
GROUP BY Contract;

#Churn by Tenure
SELECT 
    tenure,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM cleaned_churn_data
GROUP BY tenure;

#Churn by Tech Support
SELECT 
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM cleaned_churn_data
GROUP BY TechSupport;

#Avg Monthly Charges by Churn
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
FROM cleaned_churn_data
GROUP BY Churn;