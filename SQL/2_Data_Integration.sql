
USE churnwatch;

DROP TABLE IF EXISTS unified_customer_data;

CREATE TABLE unified_customer_data AS
SELECT
    s.Customer_ID,
    s.Plan,
    s.Geography,
    s.Start_Date,
    s.Tenure_Months,
    s.Monthly_Revenue_INR,
    s.Renewal_Date,
    s.Churn_Date,
    s.Reactivated,

    u.Login_Count_30D,
    u.Sessions_30D,
    u.Usage_Decline_Pct,
    u.Last_Active_Date,
    u.Days_Since_Last_Activity,
    u.Feature_Usage,

    sp.Ticket_Count_90D,
    sp.Unresolved_Ticket_Count,
    sp.Unresolved_Ticket_Days,

    p.Payment_Status,
    p.Failed_Payment_Attempts

FROM subscription_data AS s

LEFT JOIN usage_data AS u
    ON s.Customer_ID = u.Customer_ID

LEFT JOIN support_data AS sp
    ON s.Customer_ID = sp.Customer_ID

LEFT JOIN payment_data AS p
    ON s.Customer_ID = p.Customer_ID;
    
SELECT * FROM unified_customer_data
LIMIT 20;

-- Customer Count
SELECT COUNT(*) AS Total_Customers
FROM unified_customer_data;