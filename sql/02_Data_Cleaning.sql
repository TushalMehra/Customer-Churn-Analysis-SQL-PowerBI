use DB_churn;

select count(*) from customers_raw;

# preview the data 
select * from customers_raw limit 10;

# Show all columns 
show columns from customers_raw;

describe  customers_raw;


# Checks out the null values in each columns 
SELECT
    SUM(Customer_ID IS NULL) AS Customer_ID_NULLs,
    SUM(Gender IS NULL) AS Gender_NULLs,
    SUM(Age IS NULL) AS Age_NULLs,
    SUM(Married IS NULL) AS Married_NULLs,
    SUM(State IS NULL) AS State_NULLs,
    SUM(Number_of_Referrals IS NULL) AS Number_of_Referrals_NULLs,
    SUM(Tenure_in_Months IS NULL) AS Tenure_in_Months_NULLs,
    SUM(Value_Deal IS NULL) AS Value_Deal_NULLs,
    SUM(Phone_Service IS NULL) AS Phone_Service_NULLs,
    SUM(Multiple_Lines IS NULL) AS Multiple_Lines_NULLs,
    SUM(Internet_Service IS NULL) AS Internet_Service_NULLs,
    SUM(Internet_Type IS NULL) AS Internet_Type_NULLs,
    SUM(Online_Security IS NULL) AS Online_Security_NULLs,
    SUM(Online_Backup IS NULL) AS Online_Backup_NULLs,
    SUM(Device_Protection_Plan IS NULL) AS Device_Protection_Plan_NULLs,
    SUM(Premium_Support IS NULL) AS Premium_Support_NULLs,
    SUM(Streaming_TV IS NULL) AS Streaming_TV_NULLs,
    SUM(Streaming_Movies IS NULL) AS Streaming_Movies_NULLs,
    SUM(Streaming_Music IS NULL) AS Streaming_Music_NULLs,
    SUM(Unlimited_Data IS NULL) AS Unlimited_Data_NULLs,
    SUM(Contract IS NULL) AS Contract_NULLs,
    SUM(Paperless_Billing IS NULL) AS Paperless_Billing_NULLs,
    SUM(Payment_Method IS NULL) AS Payment_Method_NULLs,
    SUM(Monthly_Charge IS NULL) AS Monthly_Charge_NULLs,
    SUM(Total_Charges IS NULL) AS Total_Charges_NULLs,
    SUM(Total_Refunds IS NULL) AS Total_Refunds_NULLs,
    SUM(Total_Extra_Data_Charges IS NULL) AS Total_Extra_Data_Charges_NULLs,
    SUM(Total_Long_Distance_Charges IS NULL) AS Total_Long_Distance_Charges_NULLs,
    SUM(Total_Revenue IS NULL) AS Total_Revenue_NULLs,
    SUM(Customer_Status IS NULL) AS Customer_Status_NULLs,
    SUM(Churn_Category IS NULL) AS Churn_Category_NULLs,
    SUM(Churn_Reason IS NULL) AS Churn_Reason_NULLs
FROM customers_raw;

# Checks out the emptly values in each column
SELECT
    SUM(Customer_ID = '') AS Customer_ID_Empty,
    SUM(Gender = '') AS Gender_Empty,
    SUM(Age = '') AS Age_Empty,
    SUM(Married = '') AS Married_Empty,
    SUM(State = '') AS State_Empty,
    SUM(Number_of_Referrals = '') AS Number_of_Referrals_Empty,
    SUM(Tenure_in_Months = '') AS Tenure_in_Months_Empty,
    SUM(Value_Deal = '') AS Value_Deal_Empty,
    SUM(Phone_Service = '') AS Phone_Service_Empty,
    SUM(Multiple_Lines = '') AS Multiple_Lines_Empty,
    SUM(Internet_Service = '') AS Internet_Service_Empty,
    SUM(Internet_Type = '') AS Internet_Type_Empty,
    SUM(Online_Security = '') AS Online_Security_Empty,
    SUM(Online_Backup = '') AS Online_Backup_Empty,
    SUM(Device_Protection_Plan = '') AS Device_Protection_Plan_Empty,
    SUM(Premium_Support = '') AS Premium_Support_Empty,
    SUM(Streaming_TV = '') AS Streaming_TV_Empty,
    SUM(Streaming_Movies = '') AS Streaming_Movies_Empty,
    SUM(Streaming_Music = '') AS Streaming_Music_Empty,
    SUM(Unlimited_Data = '') AS Unlimited_Data_Empty,
    SUM(Contract = '') AS Contract_Empty,
	SUM(Paperless_Billing = '') AS Paperless_Billing_Empty,
    SUM(Payment_Method = '') AS Payment_Method_Empty,
    SUM(Monthly_Charge = '') AS Monthly_Charge_Empty,
    SUM(Total_Charges = '') AS Total_Charges_Empty,
    SUM(Total_Refunds = '') AS Total_Refunds_Empty,
    SUM(Total_Extra_Data_Charges = '') AS Total_Extra_Data_Charges_Empty,
    SUM(Total_Long_Distance_Charges = '') AS Total_Long_Distance_Charges_Empty,
    SUM(Total_Revenue = '') AS Total_Revenue_Empty,
    SUM(Customer_Status = '') AS Customer_Status_Empty,
    SUM(Churn_Category = '') AS Churn_Category_Empty,
    SUM(Churn_Reason = '') AS Churn_Reason_Empty
FROM customers_raw;

# Converting empty values to null values 
UPDATE customers_raw
SET
    Value_Deal = NULLIF(Value_Deal, ''),
    Multiple_Lines = NULLIF(Multiple_Lines, ''),
    Internet_Type = NULLIF(Internet_Type, ''),
    Online_Security = NULLIF(Online_Security, ''),
    Online_Backup = NULLIF(Online_Backup, ''),
    Device_Protection_Plan = NULLIF(Device_Protection_Plan, ''),
    Premium_Support = NULLIF(Premium_Support, ''),
    Streaming_TV = NULLIF(Streaming_TV, ''),
    Streaming_Movies = NULLIF(Streaming_Movies, ''),
    Streaming_Music = NULLIF(Streaming_Music, ''),
    Unlimited_Data = NULLIF(Unlimited_Data, ''),
    Churn_Category = NULLIF(Churn_Category, ''),
    Churn_Reason = NULLIF(Churn_Reason, '');
    
# Preview all the null values again 
SELECT
    SUM(Customer_ID IS NULL) AS Customer_ID_NULLs,
    SUM(Gender IS NULL) AS Gender_NULLs,
    SUM(Age IS NULL) AS Age_NULLs,
    SUM(Married IS NULL) AS Married_NULLs,
    SUM(State IS NULL) AS State_NULLs,
    SUM(Number_of_Referrals IS NULL) AS Number_of_Referrals_NULLs,
    SUM(Tenure_in_Months IS NULL) AS Tenure_in_Months_NULLs,
    SUM(Value_Deal IS NULL) AS Value_Deal_NULLs,
    SUM(Phone_Service IS NULL) AS Phone_Service_NULLs,
    SUM(Multiple_Lines IS NULL) AS Multiple_Lines_NULLs,
    SUM(Internet_Service IS NULL) AS Internet_Service_NULLs,
    SUM(Internet_Type IS NULL) AS Internet_Type_NULLs,
    SUM(Online_Security IS NULL) AS Online_Security_NULLs,
    SUM(Online_Backup IS NULL) AS Online_Backup_NULLs,
    SUM(Device_Protection_Plan IS NULL) AS Device_Protection_Plan_NULLs,
    SUM(Premium_Support IS NULL) AS Premium_Support_NULLs,
    SUM(Streaming_TV IS NULL) AS Streaming_TV_NULLs,
    SUM(Streaming_Movies IS NULL) AS Streaming_Movies_NULLs,
    SUM(Streaming_Music IS NULL) AS Streaming_Music_NULLs,
    SUM(Unlimited_Data IS NULL) AS Unlimited_Data_NULLs,
    SUM(Contract IS NULL) AS Contract_NULLs,
    SUM(Paperless_Billing IS NULL) AS Paperless_Billing_NULLs,
    SUM(Payment_Method IS NULL) AS Payment_Method_NULLs,
    SUM(Monthly_Charge IS NULL) AS Monthly_Charge_NULLs,
    SUM(Total_Charges IS NULL) AS Total_Charges_NULLs,
    SUM(Total_Refunds IS NULL) AS Total_Refunds_NULLs,
    SUM(Total_Extra_Data_Charges IS NULL) AS Total_Extra_Data_Charges_NULLs,
    SUM(Total_Long_Distance_Charges IS NULL) AS Total_Long_Distance_Charges_NULLs,
    SUM(Total_Revenue IS NULL) AS Total_Revenue_NULLs,
    SUM(Customer_Status IS NULL) AS Customer_Status_NULLs,
    SUM(Churn_Category IS NULL) AS Churn_Category_NULLs,
    SUM(Churn_Reason IS NULL) AS Churn_Reason_NULLs
FROM customers_raw;


# Convert All Numeric Columns to Proper Data Types

alter table customers_raw
MODIFY age int,
MODIFY Number_of_Referrals INT,
MODIFY Tenure_in_Months INT,
MODIFY Monthly_Charge DECIMAL(10,2),
MODIFY Total_Charges DECIMAL(10,2),
MODIFY Total_Refunds DECIMAL(10,2),
MODIFY Total_Extra_Data_Charges DECIMAL(10,2),
MODIFY Total_Long_Distance_Charges DECIMAL(10,2),
MODIFY Total_Revenue DECIMAL(10,2);

SELECT Age FROM customers_raw LIMIT 5;



