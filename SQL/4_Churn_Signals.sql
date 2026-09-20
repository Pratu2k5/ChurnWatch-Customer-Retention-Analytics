USE churnwatch;

-- 1. Inactivity Signal
SELECT
    Customer_ID,
    Days_Since_Last_Activity,

    CASE
        WHEN Days_Since_Last_Activity > 30
        THEN 'Inactivity Signal'
        ELSE 'No Signal'
    END AS Inactivity_Signal

FROM unified_customer_data;

-- 2. Usage Decline Signal
SELECT
    Customer_ID,
    Usage_Decline_Pct,

    CASE
        WHEN Usage_Decline_Pct >= 50
        THEN 'High Usage Decline'
        WHEN Usage_Decline_Pct >= 25
        THEN 'Moderate Usage Decline'
        ELSE 'Normal'
    END AS Usage_Signal

FROM unified_customer_data;

-- 3. Failed Payment Signal
SELECT
    Customer_ID,
    Failed_Payment_Attempts,

    CASE
        WHEN Failed_Payment_Attempts > 0
        THEN 'Payment Risk'
        ELSE 'No Payment Risk'
    END AS Payment_Signal

FROM unified_customer_data;

-- 4. Support Signal
SELECT
    Customer_ID,
    Unresolved_Ticket_Count,
    Unresolved_Ticket_Days,

    CASE
        WHEN Unresolved_Ticket_Count >= 2
        THEN 'High Support Risk'

        WHEN Unresolved_Ticket_Count = 1
        THEN 'Support Risk'

        ELSE 'No Support Risk'
    END AS Support_Signal

FROM unified_customer_data;

-- 5. Combined Churn Signals
SELECT
    Customer_ID,

    Days_Since_Last_Activity,
    Usage_Decline_Pct,
    Failed_Payment_Attempts,
    Unresolved_Ticket_Count,

    CASE
        WHEN Days_Since_Last_Activity > 30
        THEN 1
        ELSE 0
    END AS Inactivity_Flag,

    CASE
        WHEN Usage_Decline_Pct >= 50
        THEN 1
        ELSE 0
    END AS Usage_Decline_Flag,

    CASE
        WHEN Failed_Payment_Attempts > 0
        THEN 1
        ELSE 0
    END AS Payment_Flag,

    CASE
        WHEN Unresolved_Ticket_Count > 0
        THEN 1
        ELSE 0
    END AS Support_Flag

FROM unified_customer_data;