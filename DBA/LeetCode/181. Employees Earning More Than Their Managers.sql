-- 181. Employees Earning More Than Their Managers
-- Solved
-- Easy
-- Topics
-- Companies
-- SQL Schema
-- Pandas Schema
-- Table: Employee
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | salary      | int     |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
--
--
-- Write a solution to find the employees who earn more than their managers.
--
-- Return the result table in any order.
--
-- The result format is in the following example.
--
--
--
-- Example 1:
--
-- Input:
-- Employee table:
-- +----+-------+--------+-----------+
-- | id | name  | salary | managerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | Null      |
-- | 4  | Max   | 90000  | Null      |
-- +----+-------+--------+-----------+
-- Output:
-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+
-- Explanation: Joe is the only employee who earns more than his manager.
--
-- my solution
SELECT E.name AS Employee FROM Employee AS E INNER JOIN Employee AS M ON E.managerId = M.id WHERE E.salary >= M.salary
--     Runtime
-- 1186 ms

-- another solution
SELECT name as Employee
FROM Employee E1
WHERE salary > (
    SELECT E2.salary
    FROM Employee E2
    WHERE E2.id = E1.managerId
)
--     Runtime
-- 1186 ms
-- Beats
-- 25.9%

With abc AS (
    SELECT Employees.name AS Employee,
           Employees.salary AS EmployeeSalary,
           Managers.salary AS ManagerSalary
    FROM Employee AS Managers
             JOIN employee AS Employees
                  ON Managers.id=Employees.ManagerID
)
SELECT Employee FROM abc WHERE EmployeeSalary>ManagerSalary
--     Runtime
-- 1186 ms
