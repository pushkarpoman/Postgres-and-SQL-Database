-- this is the ezample of a right join


CREATE TABLE IF NOT EXISTS accounts (
    account_id INT PRIMARY KEY,
    "balance" DECIMAL(10,2) NOT NULL
);  

CREATE TABLE IF NOT EXISTS addresses(
    address_id INT PRIMARY KEY,
    account_id INT,
    street VARCHAR(100),
    city VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
        ON DELETE CASCADE
);

INSERT INTO accounts (account_id, balance) VALUES (1, 1000);
INSERT INTO accounts (account_id, balance) VALUES (2, 2000);

INSERT INTO addresses (address_id, account_id, street, city)
VALUES  
(1, 1, '123 Main St', 'Springfield'),
(2, 1, '456 Elm St', 'Shelbyville'),
(3, 2, '789 Oak St', 'Capital City'),
(4, NULL, 'No Account St', 'Unknown City'); -- Address without an account


-- Now to perform a RIGHT JOIN
SELECT a.account_id, a.balance, ad.street, ad.city
FROM addresses ad
RIGHT JOIN accounts a ON ad.account_id = a.account_id;

-- This will return all addresses with their associated accounts, including addresses without an account


-- output will be:

-- account_id | balance | street        | city
-- -----------+---------+---------------+-------------
-- 1          | 1000.00 | 123 Main St   | Springfield
-- 1          | 1000.00 | 456 Elm St    | Shelbyville
-- 2          | 2000.00 | 789 Oak St    | Capital City
-- NULL       | NULL    | No Account St | Unknown City
-- The RIGHT JOIN ensures that all addresses are included, even if they do not have a corresponding