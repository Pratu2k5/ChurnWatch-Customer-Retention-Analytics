-- DATABASE CREATED 
CREATE DATABASE IF NOT EXISTS churnwatch;
USE churnwatch;

-- 1. UNIFIED CUSTOMER DATA
CREATE TABLE `unified_customer_data` (
  `﻿Customer_ID` text,
  `Plan` text,
  `Geography` text,
  `Start_Date` text,
  `Tenure_Months` int DEFAULT NULL,
  `Monthly_Revenue_INR` int DEFAULT NULL,
  `Renewal_Date` text,
  `Login_Count_30D` int DEFAULT NULL,
  `Sessions_30D` int DEFAULT NULL,
  `Usage_Decline_Pct` double DEFAULT NULL,
  `Last_Active_Date` text,
  `Days_Since_Last_Activity` int DEFAULT NULL,
  `Feature_Usage` text,
  `Ticket_Count_90D` int DEFAULT NULL,
  `Unresolved_Ticket_Count` int DEFAULT NULL,
  `Unresolved_Ticket_Days` int DEFAULT NULL,
  `Payment_Status` text,
  `Failed_Payment_Attempts` int DEFAULT NULL,
  `Churn_Date` text,
  `Reactivated` text,
  `Lifecycle_State` text,
  `Risk_Score` int DEFAULT NULL,
  `Risk_Band` text,
  `Expected_Revenue_Impact_INR` int DEFAULT NULL,
  `Recommended_Action` text,
  `Owner` text,
  `SLA_Hours` int DEFAULT NULL,
  `Intervention_Date` text,
  `Intervention_Status` text,
  `Intervention_Outcome` text
);

-- 2. INTERVENTION DATA
CREATE TABLE `intervention_data` (
  `﻿Customer_ID` text,
  `Risk_Score` int DEFAULT NULL,
  `Risk_Band` text,
  `Expected_Revenue_Impact_INR` int DEFAULT NULL,
  `Recommended_Action` text,
  `Owner` text,
  `SLA_Hours` int DEFAULT NULL,
  `Intervention_Date` text,
  `Intervention_Status` text,
  `Intervention_Outcome` text
);

-- 3. PAYMENT DATA
CREATE TABLE `payment_data` (
  `Customer_ID` varchar(15) DEFAULT NULL,
  `Payment_Status` text,
  `Failed_Payment_Attempts` int DEFAULT NULL
);

-- 4. SUBSCRIPTION DATA
CREATE TABLE `subscription_data` (
  `Customer_ID` varchar(15) DEFAULT NULL,
  `Plan` text,
  `Geography` text,
  `Start_Date` text,
  `Tenure_Months` int DEFAULT NULL,
  `Monthly_Revenue_INR` int DEFAULT NULL,
  `Renewal_Date` text,
  `Churn_Date` text,
  `Reactivated` text
);

-- 5. SUPPORT DATA
CREATE TABLE `support_data` (
  `Customer_ID` varchar(15) DEFAULT NULL,
  `Ticket_Count_90D` int DEFAULT NULL,
  `Unresolved_Ticket_Count` int DEFAULT NULL,
  `Unresolved_Ticket_Days` int DEFAULT NULL
);

-- 6. USAGE DATA
CREATE TABLE `usage_data` (
  `Customer_ID` varchar(15) DEFAULT NULL,
  `Login_Count_30D` int DEFAULT NULL,
  `Sessions_30D` int DEFAULT NULL,
  `Usage_Decline_Pct` double DEFAULT NULL,
  `Last_Active_Date` text,
  `Days_Since_Last_Activity` int DEFAULT NULL,
  `Feature_Usage` text
);