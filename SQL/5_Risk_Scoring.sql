USE churnwatch;

-- 1. Calculate Risk Score
WITH risk_calculation AS (

    SELECT
        Customer_ID,
        Plan,
        Monthly_Revenue_INR,

        Days_Since_Last_Activity,
        Usage_Decline_Pct,
        Failed_Payment_Attempts,
        Unresolved_Ticket_Count,
        Feature_Usage,
        Renewal_Date,

        (
            CASE
                WHEN Days_Since_Last_Activity > 30
                THEN 25
                ELSE 0
            END

            +

            CASE
                WHEN Usage_Decline_Pct >= 50
                THEN 20
                ELSE 0
            END

            +

            CASE
                WHEN Failed_Payment_Attempts > 0
                THEN 20
                ELSE 0
            END

            +

            CASE
                WHEN Unresolved_Ticket_Count > 0
                THEN 15
                ELSE 0
            END

            +

            CASE
                WHEN Feature_Usage <= 2
                THEN 10
                ELSE 0
            END

            +

            CASE
                WHEN DATEDIFF(
                    Renewal_Date,
                    CURDATE()
                ) BETWEEN 0 AND 30
                THEN 10
                ELSE 0
            END

        ) AS Risk_Score

    FROM unified_customer_data
)

SELECT
    Customer_ID,
    Plan,
    Monthly_Revenue_INR,
    Risk_Score

FROM risk_calculation

ORDER BY Risk_Score DESC;

-- 2. Create Risk Band
WITH risk_calculation AS (

    SELECT
        Customer_ID,

        (
            CASE
                WHEN Days_Since_Last_Activity > 30
                THEN 25 ELSE 0
            END

            +

            CASE
                WHEN Usage_Decline_Pct >= 50
                THEN 20 ELSE 0
            END

            +

            CASE
                WHEN Failed_Payment_Attempts > 0
                THEN 20 ELSE 0
            END

            +

            CASE
                WHEN Unresolved_Ticket_Count > 0
                THEN 15 ELSE 0
            END

            +

            CASE
                WHEN Feature_Usage <= 2
                THEN 10 ELSE 0
            END

            +

            CASE
                WHEN DATEDIFF(Renewal_Date, CURDATE())
                     BETWEEN 0 AND 30
                THEN 10 ELSE 0
            END
        ) AS Risk_Score

    FROM unified_customer_data
)

SELECT
    Customer_ID,
    Risk_Score,

    CASE
        WHEN Risk_Score >= 80 THEN 'Critical'
        WHEN Risk_Score >= 60 THEN 'High'
        WHEN Risk_Score >= 30 THEN 'Medium'
        ELSE 'Low'
    END AS Risk_Band

FROM risk_calculation

ORDER BY Risk_Score DESC;

-- 3. Revenue at Risk
WITH risk_calculation AS (

    SELECT
        Customer_ID,
        Monthly_Revenue_INR,

        (
            CASE
                WHEN Days_Since_Last_Activity > 30
                THEN 25 ELSE 0
            END

            +

            CASE
                WHEN Usage_Decline_Pct >= 50
                THEN 20 ELSE 0
            END

            +

            CASE
                WHEN Failed_Payment_Attempts > 0
                THEN 20 ELSE 0
            END

            +

            CASE
                WHEN Unresolved_Ticket_Count > 0
                THEN 15 ELSE 0
            END

            +

            CASE
                WHEN Feature_Usage <= 2
                THEN 10 ELSE 0
            END

            +

            CASE
                WHEN DATEDIFF(Renewal_Date, CURDATE())
                     BETWEEN 0 AND 30
                THEN 10 ELSE 0
            END
        ) AS Risk_Score

    FROM unified_customer_data
)

SELECT
    Customer_ID,
    Monthly_Revenue_INR,
    Risk_Score,

    ROUND(
        Monthly_Revenue_INR * Risk_Score / 100,
        2
    ) AS Expected_Revenue_Impact_INR

FROM risk_calculation

ORDER BY Expected_Revenue_Impact_INR DESC;

-- 4. Rank At-Risk Customers
WITH risk_calculation AS (

    SELECT
        Customer_ID,
        Monthly_Revenue_INR,

        (
            CASE
                WHEN Days_Since_Last_Activity > 30
                THEN 25 ELSE 0
            END

            +

            CASE
                WHEN Usage_Decline_Pct >= 50
                THEN 20 ELSE 0
            END

            +

            CASE
                WHEN Failed_Payment_Attempts > 0
                THEN 20 ELSE 0
            END

            +

            CASE
                WHEN Unresolved_Ticket_Count > 0
                THEN 15 ELSE 0
            END

        ) AS Risk_Score

    FROM unified_customer_data
)

SELECT
    Customer_ID,
    Risk_Score,

    RANK() OVER (
        ORDER BY Risk_Score DESC
    ) AS Risk_Rank

FROM risk_calculation;

-- 