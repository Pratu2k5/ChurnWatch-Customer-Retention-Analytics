# ChurnWatch – Customer Retention & Churn Risk Analytics

## 📊 Project Overview

ChurnWatch is a customer retention and churn risk analytics project designed to identify customers who are at risk of leaving and provide actionable insights for retention teams.

The project combines customer subscription, usage, support, payment, risk and intervention data to analyze customer behavior and churn patterns.

The dashboard helps answer questions such as:

- How many customers have churned?
- What is the current churn rate?
- Which customer segments show higher churn?
- How does customer tenure relate to churn?
- How does usage decline affect churn?
- Which risk bands contain the highest revenue at risk?
- Which customers require immediate intervention?
- How are retention interventions performing?

---

## 🎯 Project Objectives

- Analyze customer churn and retention trends.
- Identify important churn signals.
- Segment customers based on churn risk.
- Calculate revenue at risk.
- Identify customers requiring intervention.
- Track retention activities and intervention outcomes.
- Provide an interactive dashboard for business decision-making.

---

## 🛠️ Tools & Technologies

- Power BI
- Microsoft Excel
- SQL / MySQL
- Power Query
- DAX

---

## 📁 Dataset

The project uses customer-level data containing information related to:

- Customer subscription
- Customer usage
- Support tickets
- Payment status
- Customer risk
- Intervention activities

Key fields include:

- Customer_ID
- Plan
- Geography
- Tenure
- Monthly Revenue
- Churn Date
- Usage Decline
- Login Activity
- Payment Status
- Risk Score
- Risk Band
- Expected Revenue Impact
- Recommended Action
- Intervention Status
- Intervention Outcome

---

# 📈 Dashboard Pages

## 1. Executive Dashboard

The Executive Dashboard provides a high-level overview of customer churn and retention.

### Key KPIs

- Total Customers
- Churned Customers
- Active Customers
- High/Critical Risk Customers
- Revenue at Risk
- Churn Rate
- Renewal Rate
- Retention Success

### Visualizations

- Daily Churned Customers
- Churn Rate by Plan
- Total Monthly Revenue by Geography

![Executive Dashboard](Dashboard_Screenshots/1_Executive_Dashboard.png)

---

## 2. Churn Signal Analysis

This page analyzes factors associated with customer churn.

### Key Metrics

- Average Days Since Activity
- Average Usage Decline
- High Risk Customers
- Critical Risk Customers

### Analysis

- Churn Rate by Customer Tenure
- Churn Rate by Usage Decline
- Churn Rate by Login Activity
- Revenue at Risk by Risk Band

![Churn Signal Analysis](Dashboard_Screenshots/2_Churn_Signal_Analysis.png)

---

## 3. Churn Risk Dashboard

This page focuses on identifying customers with higher churn risk.

### Analysis

- Payment Status vs Churn Rate
- Risk by Geography
- Risk by Plan
- Risk Distribution
- At-Risk Customer Queue

The customer queue provides information such as:

- Customer ID
- Risk Score
- Risk Band
- Monthly Revenue
- Recommended Action

![Churn Risk Dashboard](Dashboard_Screenshots/3_Churn_Risk_Dashboard.png)

---

## 4. Retention Operations

This page tracks customer retention activities and intervention performance.

### Key Metrics

- Retention Rate
- Total Interventions
- Failed Interventions
- Pending Interventions
- Successful Retentions

### Visualizations

- Retention by Action
- Intervention Outcomes
- Owner Performance
- Pending Intervention Table

![Retention Operations](Dashboard_Screenshots/4_Retention_Operations.png)

---

# 🔍 Key Insights

The dashboard enables analysis of:

- Overall customer churn and retention.
- Differences in churn rates across subscription plans.
- Relationship between customer usage and churn.
- Churn patterns across customer tenure groups.
- Payment-related churn signals.
- Revenue exposure from high-risk customers.
- Geographic distribution of customer risk.
- Retention intervention performance.

---

# 💼 Business Value

ChurnWatch can help retention teams:

1. Identify customers at risk of churn.
2. Prioritize customers based on risk and revenue impact.
3. Understand possible churn signals.
4. Assign recommended retention actions.
5. Track pending interventions.
6. Monitor intervention outcomes.
7. Support data-driven customer retention strategies.

---

# 📂 Project Structure

```text
ChurnWatch-Customer-Retention-Analytics/
│
├── README.md
├── Dashboard/
│   └── ChurnWatch_Dashboard.pbix
├── Data/
│   └── ChurnWatch_Dataset.xlsx
├── SQL/
│   └── SQL analysis files
├── Screenshots/
│   ├── 01_Executive_Dashboard.png
│   ├── 02_Churn_Signal_Analysis.png
│   ├── 03_Churn_Risk_Dashboard.png
│   └── 04_Retention_Operations.png
└── Documentation/
    └── Project_Overview.pdf
