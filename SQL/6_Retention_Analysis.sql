USE churnwatch;

-- 1. Intervention Status
SELECT
    Intervention_Status,
    COUNT(*) AS Total_Interventions
FROM intervention_data
GROUP BY Intervention_Status
ORDER BY Total_Interventions DESC;

-- 2. Intervention Outcome
SELECT
    Intervention_Outcome,
    COUNT(*) AS Total_Interventions
FROM intervention_data
GROUP BY Intervention_Outcome
ORDER BY Total_Interventions DESC;

-- 3. Retained Customers
SELECT
    COUNT(*) AS Retained_Customers
FROM intervention_data
WHERE Intervention_Outcome = 'Retained';

-- 4. Intervention Success Rate
SELECT
    ROUND(
        SUM(
            CASE
                WHEN Intervention_Outcome = 'Retained'
                THEN 1
                ELSE 0
            END
        ) * 100.0
        /
        NULLIF(COUNT(*), 0),
        2
    ) AS Intervention_Success_Rate
FROM intervention_data;

-- 5. Revenue at Risk by Risk Band
SELECT
    Risk_Band,
    COUNT(*) AS Customers,
    ROUND(
        SUM(Expected_Revenue_Impact_INR),
        2
    ) AS Total_Revenue_At_Risk
FROM intervention_data
GROUP BY Risk_Band
ORDER BY Total_Revenue_At_Risk DESC;

-- 6. Intervention Performance by Owner
SELECT
    Owner,
    COUNT(*) AS Total_Interventions,
    SUM(
        CASE
            WHEN Intervention_Outcome = 'Retained'
            THEN 1
            ELSE 0
        END
    ) AS Retained_Customers,

    ROUND(
        SUM(
            CASE
                WHEN Intervention_Outcome = 'Retained'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / NULLIF(COUNT(*), 0),
        2
    ) AS Success_Rate
FROM intervention_data
GROUP BY Owner
ORDER BY Success_Rate DESC;

-- 7. Recommended Action Analysis
SELECT
    Recommended_Action,
    COUNT(*) AS Total_Actions,
    SUM(
        CASE
            WHEN Intervention_Outcome = 'Retained'
            THEN 1
            ELSE 0
        END
    ) AS Successful_Retentions
FROM intervention_data
GROUP BY Recommended_Action
ORDER BY Successful_Retentions DESC;