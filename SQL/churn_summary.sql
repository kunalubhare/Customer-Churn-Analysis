-- Customer Churn Analysis SQL Queries

-- Churn Summary

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS Active_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers;

-- Churn by Contract Type

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customers
GROUP BY Contract
ORDER BY Churned_Customers DESC;

-- Churn by Internet Service

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customers
GROUP BY InternetService
ORDER BY Churned_Customers DESC;

-- Churn by Payment Method

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customers
GROUP BY PaymentMethod
ORDER BY Churned_Customers DESC;

-- Average Monthly Charges by Churn Status

SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges
FROM customers
GROUP BY Churn;

-- Churn by Gender

SELECT
    gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customers
GROUP BY gender;

-- Churn by Senior Citizen

SELECT
    SeniorCitizen,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customers
GROUP BY SeniorCitizen;

-- Churn by Partner Status

SELECT
    Partner,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customers
GROUP BY Partner;

-- Average Tenure by Churn Status

SELECT
    Churn,
    ROUND(AVG(tenure), 2) AS Average_Tenure
FROM customers
GROUP BY Churn;

-- Top 5 Payment Methods with Highest Churn

SELECT
    PaymentMethod,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM customers
GROUP BY PaymentMethod
ORDER BY Churned_Customers DESC
LIMIT 5;