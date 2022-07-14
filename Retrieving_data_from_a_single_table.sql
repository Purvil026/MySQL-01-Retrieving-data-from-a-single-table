-- RETRIEVING DATA FROM A SINGLE TABLE --

# USE
# SELECT
# FROM
# WHERE
# ORDER BY
# Operations
# AS
# Conditionals
# DISTINCT
# IN, NOT IN
# BETWEEN
# LIKE
# REGEX
# NULL
# ORDER BY
# LIMIT


# USE: clause is used to select the database we want to work on
USE sql_store;

# SELECT: clause is used to select the column
# SELECT *: means it will select all the columns
SELECT customer_id, first_name;

# FROM: is for the name of the table
# WHERE: is used to filter data based on conditionals
# ORDER BY: is used to arrange alphabetically based on attributes
# ; will only come after the FROM clause is completely over i.e after WHERE and ORDER BY
SELECT *
FROM customers
WHERE customer_id = 1
ORDER BY first_name;

# Operations (+, -, /, *, %)
# AS: is used to give alias
SELECT points, points * 10 + 100 AS 'discount factor'
FROM customers;

# DISTINCT: to remove duplicates
SELECT DISTINCT state
FROM customers;

## Q: Return name, unit_price and new_price that is unit_price * 1.1 from products
SELECT 
	name,
    unit_price,
    unit_price * 1.1 AS 'new_price'
FROM products;

# Conditionals (>, <, >=, <=, =, !=, <>)
SELECT *
FROM customers
WHERE points > 3000;

## Q: Get all the orders placed this year
SELECT *
FROM orders
WHERE order_date >= '2022-01-01';

# IN: use to check whether an attribute is present in a list of values
# NOT IN: when it is not present
# always returns a bool
SELECT *
FROM cutomers
WHERE state IN ('VA', 'GA', 'FL');
-- WHERE state NOT IN ('VA', 'GA');

# BETWEEN: gives all the values between a range
SELECT *
FROM customers
-- WHERE points >= 1000 AND points <= 3000;
WHERE points BETWEEN 1000 and 3000;

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

# LIKE: used to retrieve rows that match a specific string pattern
# % represents any no. of characters before or after
# _ represents single character before or after

SELECT *
FROM customers
-- WHERE last_name like 'b%'
-- WHERE last_name like 'appl_'
-- WHERE last_name LIKE '%b%'
-- WHERE last_name NOT LIKE '%b%'
-- WHERE last_name LIKE '_____y'
WHERE last_name LIKE 'b____y';

## Q: Get all the customers whose address contains 'trail' or 'avenue' and phone numbers end with 9
SELECT *
FROM customers
WHERE address LIKE '%trail%' OR address LIKE '%avenue%' AND phone LIKE '%9';

# REGEX Operator
# REGEX: allows to search for more complex strings
SELECT *
FROM customers

-- ^ beginning
-- $ end
-- | logical OR
-- [abcd]
-- [a-f]

# Last name should contain the word 'field'
# '^field' last name must start with field
# 'field$' last name must end with field
-- WHERE last_name REGEXP 'field'
-- WHERE last_name REGEXP '^field'
-- WHERE last_name REGEXP 'field$'

# searching multiple words
# Last name should have either field or mac
-- WHERE last_name REGEXP 'field|mac'
-- WHERE last_name REGEXP 'field$|mac|rose'

# Last name contains e but before that has either g or i or m
-- WHERE last_name REGEXP '[gim]e'
# Last name contains e but after that has either f or m or q
-- WHERE last_name REGEXP 'e[fmq]'

# Getting a range of characters
# last name should have e and before that any letter between a to h
WHERE last_name REGEXP '[a-h]e';

# NULL Operator
SELECT *
FROM customers
WHERE phone IS NULL;

# ORDER BY Operator
# Helps sort data in your sql queries columnwise
# There will always be one default sort column (leftmost), with ORDER BY operator, we can change the default sort column
SELECT *
FROM customers
ORDER BY first_name;

# By default it will sort in ascending order
# To sort in descending order
-- ORDER BY first_name DESC

# Multiple sorting
# First it will sort by state and then by first name
-- ORDER BY state, first_name
# First it will sort by state in descending order and then by first name
-- ORDER by state DESC, first_name

## Q: For order_items having order_id = 2, sort them in descending order based on their total price
Select *, unit_price * quanity AS 'total price'
FROM order_items 
WHERE order_id = 2
ORDER BY 'total price' DESC;

# LIMIT operator
# helps to limit the number of records returned from the query
# Let say a query has output of 7 records but we only want first 3 
SELECT *
FROM customers
LIMIT 3;

# NOTE: This should be the order always (SELECT, FROM, WHERE(optional), ORDER BY, LIMIT)





 



