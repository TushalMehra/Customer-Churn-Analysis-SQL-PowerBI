/*
File: 01_data_exploration.sql
Purpose: Initial exploration of customer churn dataset
Includes:
- Row counts
- Column overview
- Null and empty value checks
*/


Create database DB_churn;
use DB_churn;

DROP TABLE IF EXISTS customers_raw;

CREATE TABLE customers_raw (
    Customer_ID                        VARCHAR(50),
    Gender                             VARCHAR(20),
    Age                                VARCHAR(10),
    Married                            VARCHAR(10),
    State                              VARCHAR(50),
    Number_of_Referrals                VARCHAR(10),
    Tenure_in_Months                   VARCHAR(10),
    Value_Deal                         VARCHAR(50),
    Phone_Service                      VARCHAR(10),
    Multiple_Lines                     VARCHAR(20),
    Internet_Service                   VARCHAR(20),
    Internet_Type                      VARCHAR(20),
    Online_Security                    VARCHAR(20),
    Online_Backup                      VARCHAR(20),
    Device_Protection_Plan             VARCHAR(20),
    Premium_Support                    VARCHAR(20),
    Streaming_TV                       VARCHAR(20),
    Streaming_Movies                   VARCHAR(20),
    Streaming_Music                    VARCHAR(20),
    Unlimited_Data                     VARCHAR(20),
    Contract                           VARCHAR(30),
    Paperless_Billing                  VARCHAR(10),
    Payment_Method                     VARCHAR(50),
    Monthly_Charge                     VARCHAR(20),
    Total_Charges                      VARCHAR(20),
    Total_Refunds                      VARCHAR(20),
    Total_Extra_Data_Charges           VARCHAR(20),
    Total_Long_Distance_Charges        VARCHAR(20),
    Total_Revenue                      VARCHAR(20),
    Customer_Status                    VARCHAR(30),
    Churn_Category                     VARCHAR(50),
    Churn_Reason                       VARCHAR(255)
);



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_data.csv'
INTO TABLE customers_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



