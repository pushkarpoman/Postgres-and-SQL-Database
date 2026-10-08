--this is the example for the Inner Joins in SQL


-- suppose we have two tables: employees and departments
-- employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department_id INT
);
-- departments table
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Insert sample data into employees
INSERT INTO employees (id, name, department_id) VALUES
(1, 'John Doe', 1),
(2, 'Jane Smith', 2),
(3, 'Alice Johnson', 1);
-- Insert sample data into departments
INSERT INTO departments (id, name) VALUES
(1, 'Sales'),
(2, 'Marketing');



-- Now, we can perform an INNER JOIN to get employees and their departments
-- This will return only those employees who have a matching department
SELECT 
    employees.name AS employee_name,
    departments.name AS department_name
FROM
    employees
JOIN
    departments ON employees.department_id = departments.id
WHERE
    departments.name = 'Sales';
-- This will return all employees who work in the Sales department

-- output will be:
-- employee_name | department_name
-- ---------------+-----------------
-- John Doe      | Sales
-- from the employees and departments tables where the department is 'Sales'.
-- The JOIN operation combines rows from both tables based on the matching condition
-- else if not found then it will not return any rows
