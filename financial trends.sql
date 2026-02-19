CREATE DATABASE financedb;
USE FinanceDB;
CREATE TABLE Financial_Behaviour (
    gender VARCHAR(10),
    age INT,
    Investment_Avenues VARCHAR(5),
    Mutual_Funds INT,
    Equity_Market INT,
    Debentures INT,
    Government_Bonds INT,
    Fixed_Deposits INT,
    PPF INT,
    Gold INT,
    Stock_Market VARCHAR(5),
    Factor VARCHAR(50),
    Objective VARCHAR(50),
    Purpose VARCHAR(100),
    Duration VARCHAR(50),
    Invest_Monitor VARCHAR(50),
    Expect VARCHAR(20),
    Avenue VARCHAR(100),
    Savings_Objective VARCHAR(100),
    Reason_Equity VARCHAR(100),
    Reason_Mutual VARCHAR(100),
    Reason_Bonds VARCHAR(100),
    Reason_FD VARCHAR(100),
    Source VARCHAR(100)
);

SET GLOBAL local_infile = 1;

#check total rows
SELECT count(*) FROM Financial_Behaviour;
SELECT * FROM Financial_Behaviour LIMIT 5;

#Null Value Check 
SELECT *
FROM Financial_Behaviour
WHERE age IS NULL;

#Gender Distribution
SELECT gender, count(*)
FROM Financial_Behaviour
GROUP BY gender;
#Gender vs Investment Objective
SELECT gender, objective, COUNT(*) AS total
FROM Financial_Behaviour
GROUP BY gender, objective
ORDER BY gender;

#MIN, MAX and AVERAGE Age
SELECT MIN(age) AS Min_Age,
       MAX(age) AS Max_Age,
       avg(age) as avg_age FROM Financial_Behaviour;
#Average Preference Score
SELECT 
ROUND(AVG(Mutual_Funds),2) AS Avg_Mutual,
ROUND(AVG(Equity_Market),2) AS Avg_Equity,
ROUND(AVG(Debentures),2) AS Avg_Debentures,
ROUND(AVG(Government_Bonds),2) AS Avg_Bonds,
ROUND(AVG(Fixed_Deposits),2) AS Avg_FD,
ROUND(AVG(PPF),2) AS Avg_PPF,
ROUND(AVG(Gold),2) AS Avg_Gold
FROM Financial_Behaviour;

       
#Risk vs Return Mindset
SELECT Factor, COUNT(*) AS Total
FROM Financial_Behaviour
GROUP BY Factor;

# Most Preferred Investment Avenue
SELECT Avenue, COUNT(*) AS Total
FROM Financial_Behaviour
GROUP BY Avenue
ORDER BY Total DESC;

# Expected Return
SELECT Expect, COUNT(*) AS Total
FROM Financial_Behaviour
GROUP BY Expect
ORDER BY Total DESC;

#Duration Analysis
SELECT Duration, COUNT(*) AS Total
FROM Financial_Behaviour
GROUP BY Duration
ORDER BY Total DESC;

#Gender vs Risk
SELECT gender, Factor, COUNT(*) AS Total
FROM Financial_Behaviour
GROUP BY gender, Factor;

#Duration vs Expected Return
SELECT Duration, Expect, COUNT(*) AS Total
FROM Financial_Behaviour
GROUP BY Duration, Expect
ORDER BY Duration;








