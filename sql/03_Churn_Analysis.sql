use db_churn;

#1 Total number of customers

select count(*) from customers_raw;

#2 Count churned customers

select count(*) from customers_raw
where Customer_Status = "churned";

#3 Percentage of customers who left.

select sum(Customer_Status = "churned")/count(*) * 100
as Churn_Rate from customers_raw;

#4 Count customers by gender

select Gender,count(*) 
from customers_raw
group by Gender;

#5 Count customers by contract type

Select contract, count(*) from customers_raw 
group by Contract;

#6 Average monthly charges

select avg(Monthly_Charge) 
from customers_raw;

#7 Average total revenue

select avg(Total_Revenue) 
from customers_raw;

#8 Count customers by Internet Service

select Internet_Type,count(*) from customers_raw
group by Internet_Type;

#9 Top reasons why customers left.

select Churn_Reason, count(*) from customers_raw
group by Churn_Reason
order by count(*) desc;

#10 Revenue lost due to churned customers 

select  sum(Total_Revenue) as Lost_Revenue
from customers_raw
where Customer_Status = "churned";

#11 churn by internet type 

select Internet_Type,count(*)  as Churned_Customers
from customers_raw
where Customer_Status = "churned"
group by Internet_Type
order by count(*) desc;


#12 High-value churn customers

select * from customers_raw
where Customer_Status = "churned"
and Total_Revenue > (select avg(Total_Revenue) from customers_raw)
order by Total_Revenue;

#13 Churn by state

select State, count(*) as Churn_Count
from customers_raw
where Customer_Status = "churned"
group by State
order by count(*) desc;

#14 Customers with Internet but no security add-ons

Select * from customers_raw
where Internet_Service ="Yes"
and (Online_Security = 'No' OR Online_Backup = 'No' OR Device_Protection_Plan = 'No');

#15  Average revenue by contract type

select Contract, avg(Total_Revenue) 
from customers_raw
group by Contract;

# Long-term customers generate more or not.

#16 Churned customers according to tenure 

select 
case when Tenure_in_Months < 12 then "0-12 Months"
when Tenure_in_Months < 24 then "1-2 Years"
when Tenure_in_Months < 36 then "2-3 Years"
Else "3+ Years"
end as Tenure_Group, 
count(*) as Customers, 
sum(case when Customer_Status = "Churned" then 1 end) as churned,
(sum(case when Customer_Status = "Churned" then 1 end)/ count(*) * 100) as Percent_Churned
from customers_raw
group by Tenure_Group;


# 17 Monthly Charges vs Churned 

select 
case 
when Monthly_Charge < 40 then "Low"
when Monthly_Charge < 40-80 then "Midium"
Else "High"
end as Spending_Category, 
count(*) as Customers, 
sum(case when Customer_Status = "Churned" then 1 end) as churned,
(sum(case when Customer_Status = "Churned" then 1 end)/ count(*) * 100) as Percent_Churned
from customers_raw
group by Spending_Category;


#18 Top Reasons why customers left 

select Churn_Reason,count(*) 
from customers_raw
where Customer_Status = "churned"
group by Churn_Reason
order by count(*) desc;

# 19 Duplicate Customers check 

SELECT customer_id, COUNT(*)
FROM customers_raw
GROUP BY customer_id
HAVING COUNT(*) > 1;

# 20 Create Tenure Group as a categorical Feature for ML and Power Bi

Alter table customers_raw 
add column Tenure_Group varchar(20);

update customers_raw
set Tenure_Group = 
CASE
    WHEN Tenure_in_Months < 12 THEN 'New'
    WHEN Tenure_in_Months < 24 THEN '1-2 Years'
    WHEN Tenure_in_Months < 36 THEN '2-3 Years'
    ELSE '3+ Years'
END;

# 21 Create Monthly Charges as a categorical Feature for ML and Power Bi\

alter table customers_raw
add column Monthly_Charges Varchar(10);

update customers_raw
set Monthly_Charges = 
case 
when Monthly_Charge < 40 then "Low"
when Monthly_Charge < 40-80 then "Midium"
Else "High"
end;







