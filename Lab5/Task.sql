--1. Find all customer names and their cities who have a loan but not an account.

SELECT CUSTOMER_NAME,CUSTOMER_CITY
FROM customer
where CUSTOMER_NAME IN (SELECT CUSTOMER_NAME FROM BORROWER)
AND CUSTOMER_NAME NOT IN (SELECT CUSTOMER_NAME FROM DEPOSITOR);


--2. Find all customer names who have an account as well as a loan.

SELECT CUSTOMER_NAME,CUSTOMER_CITY
FROM customer
where CUSTOMER_NAME IN (SELECT CUSTOMER_NAME FROM BORROWER)
AND CUSTOMER_NAME IN (SELECT CUSTOMER_NAME FROM DEPOSITOR);

--3. Show the count of accounts that were opened in each month along with the month.

SELECT to_char(to_date(extract(month from acc_opening_date) , 'MM') , 'month')
AS MONTH , COUNT(*) AS COUNT
FROM  ACCOUNT
GROUP BY EXTRACT(MONTH FROM ACC_OPENING_DATE)
ORDER BY 
COUNT DESC;

--4. Find the months between the last acc_opening_date and last loan_date of customer ’Smith’.





--5. Find the average loan amount at each branch. Do not include any branch which is located in a that has the substring, ’Horse’ in its name.

SELECT branch_name , avg(amount) as avg_loan_amount
FROM loan
WHERE branch_name in(
    SELECT branch_name from branch
    WHERE
    branch_city not like '%a%'
    and branch_name not like '%horse%'
) 
group by branch_name;


--6. Find the customer name and account number of the account that has the highest balance.

SELECT customer_name , account_number
FROM depositor
WHERE account_number in(
    SELECT account_number
    FROM account
    WHERE balance = (SELECT max(balance) FROM account)
);


--7. For each branch city, find the average amount of all the loans opened in a branch located in that branch city. Do not include any branch city in the result where the average amount of all loans opened in a branch located in that city is less than 1500.



--8. Show all the name of the customer with the suffix ’Eligible’ who has at least one loan that can be paid off by his/her total balance.

SELECT customer_name || ' Eligible' as customer_name
FROM depositor
WHERE account_number in(
    SELECT account_number
    FROM account
    WHERE balance >= (SELECT sum(amount) FROM loan)
);


--9.Show all the branch names with suffixes ’Elite’ that have a total account balance greater than the (average total balance + 500), ’Moderate’ that have a total account balance in between (average total balance + 500) to (average total balance - 500), else ’Poor’.

SELECT
    BRANCH_NAME,
    CASE
        WHEN TOTAL_BALANCE > (AVG_TOTAL_BALANCE + 500) THEN
            'ELITE'
        WHEN TOTAL_BALANCE BETWEEN (AVG_TOTAL_BALANCE + 500) AND (AVG_TOTAL_BALANCE - 500) THEN
            'MODERATE'
        ELSE
            'POOR'
    END AS BRANCH_STATUS 
FROM
    (
        SELECT
            BRANCH_NAME,
            SUM(BALANCE) AS TOTAL_BALANCE,
            AVG(BALANCE) AS AVG_TOTAL_BALANCE
        FROM
            ACCOUNT
        GROUP BY
            BRANCH_NAME
    );

--10. Find the branch information for cities where at least one customer lives who does not have any account or any loans. The branch must have given some loans and has accounts opened by other customers.

SELECT
    BRANCH_NAME,
    BRANCH_CITY
FROM
    BRANCH
WHERE
    BRANCH_CITY IN (
        SELECT
            CUSTOMER_CITY
        FROM
            CUSTOMER
        WHERE
            CUSTOMER_NAME NOT IN (
                SELECT
                    CUSTOMER_NAME
                FROM
                    DEPOSITOR
            )
            AND CUSTOMER_NAME NOT IN (
                SELECT
                    CUSTOMER_NAME
                FROM
                    BORROWER
            )
    )
    AND BRANCH_NAME IN (
        SELECT
            BRANCH_NAME
        FROM
            LOAN
    )
    AND BRANCH_NAME IN (
        SELECT
            BRANCH_NAME
        FROM
            ACCOUNT
        WHERE
            ACCOUNT_NUMBER IN (
                SELECT
                    ACCOUNT_NUMBER
                FROM
                    DEPOSITOR
            )
    );

-- 11.Create a new customer_new table using a similar structure to the customer table.

CREATE TABLE customer_new AS
SELECT * FROM customer
where customer_name = 'ron';

-- 12. In the customer_new table insert only those customers who have either an account or a loan.

INSERT INTO customer_new
SELECT * FROM customer
where customer_name in
(
    select customer_name from depositor
)
or
customer_name in
(
    select customer_name from borrower
);


-- 13.Add a new column Status in customer_new table of varchar2(15) type.

ALTER TABLE customer_new
ADD status VARCHAR2(15);

--14. For each customer if his/her total balance is greater than the total loan then set the status ’In savings’, if the vise versa then ’In loan’, lastly if both of the amounts are the same then ’In Breakeven’.

