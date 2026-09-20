USE churnwatch;

-- Total Customers 
SELECT
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM unified_customer_data;

-- Churned Customers
SELECT
    COUNT(*) AS Churned_Customers
FROM unified_customer_data
WHERE Churn_Date IS NOT NULL;

-- Churn Rate
SELECT
    ROUND(
        COUNT(
            CASE
                WHEN Churn_Date IS NOT NULL
                THEN 1
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM unified_customer_data;

-- Retention Rate
SELECT
    ROUND(
        100 -
        (
            COUNT(
                CASE
                    WHEN Churn_Date IS NOT NULL
                    THEN 1
                END
            ) * 100.0 / COUNT(*)
        ),
        2
    ) AS Retention_Rate_Percent
FROM unified_customer_data;

-- Total Monthly Revenue
SELECT
    SUM(Monthly_Revenue_INR) AS Total_Monthly_Revenue_INR
FROM unified_customer_data;

-- Average Monthly Revenue
SELECT
    ROUND(
        AVG(Monthly_Revenue_INR),
        2
    ) AS Average_Monthly_Revenue_INR
FROM unified_customer_data;

-- Churn by Plan
SELECT
    Plan,

    COUNT(*) AS Total_Customers,

    SUM(
        CASE
            WHEN Churn_Date IS NOT NULL
            THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn_Date IS NOT NULL
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM unified_customer_data

GROUP BY Plan

ORDER BY Churn_Rate_Percent DESC;

-- Churn by Geography
SELECT
    Geography,

    COUNT(*) AS Total_Customers,

    SUM(
        CASE
            WHEN Churn_Date IS NOT NULL
            THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn_Date IS NOT NULL
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM unified_customer_data

GROUP BY Geography

ORDER BY Churn_Rate_Percent DESC;

-- Churn by Tenure
SELECT
    CASE
        WHEN Tenure_Months <= 3 THEN '0-3 Months'
        WHEN Tenure_Months <= 6 THEN '4-6 Months'
        WHEN Tenure_Months <= 12 THEN '7-12 Months'
        ELSE '12+ Months'
    END AS Tenure_Group,

    COUNT(*) AS Total_Customers,

    SUM(
        CASE
            WHEN Churn_Date IS NOT NULL
            THEN 1
            ELSE 0
        END
    ) AS Churned_Customers

FROM unified_customer_data

GROUP BY Tenure_Group

ORDER BY Total_Customers DESC;

