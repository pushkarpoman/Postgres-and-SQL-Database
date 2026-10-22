-- this consist of the what transaction is in sql
-- The Traction means either the statement written inside should totally run(all should run) or none of the statement should run
-- if any statement fails then all the statements should be rolled back

CREATE TABLE IF NOT EXISTS accounts (
    account_id INT PRIMARY KEY,
    "balance" DECIMAL(10,2) NOT NULL
);


BEGIN;

    -- Example of a transaction
    INSERT INTO accounts (account_id, balance) VALUES (1, 1000);
    INSERT INTO accounts (account_id, balance) VALUES (2, 2000);
    -- If the second insert fails, the first insert will also be rolled back    
    INSERT INTO accounts (account_id, balance) VALUES (3, 3000);

COMMIT;
-- this will commit the transaction, making all changes permanent