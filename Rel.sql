-- Parent table: Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Child table: Orders (depends on Customers)
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
);

-- Insert sample data into Customers
INSERT INTO Customers (customer_id, name)
VALUES (1, 'Alice'), (2, 'Bob');

-- Insert sample data into Orders
INSERT INTO Orders (order_id, customer_id, product_name)
VALUES
(101, 1, 'Laptop'),
(102, 1, 'Mouse'),
(103, 2, 'Keyboard');

-- Now, delete a customer
DELETE FROM Customers WHERE customer_id = 1;

-- Because of ON DELETE CASCADE:
-- Orders with customer_id = 1 will be automatically deleted
