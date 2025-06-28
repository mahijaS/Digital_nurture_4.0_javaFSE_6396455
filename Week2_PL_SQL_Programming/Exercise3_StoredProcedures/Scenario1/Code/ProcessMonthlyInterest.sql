BEGIN EXECUTE IMMEDIATE 'DROP TABLE Accounts';       EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Employees';      EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/

CREATE TABLE Accounts (
    AccountID    NUMBER PRIMARY KEY,
    CustomerID   NUMBER,
    AccountType  VARCHAR2(20),   
    Balance      NUMBER(12,2)
);

CREATE TABLE Employees (
    EmployeeID   NUMBER PRIMARY KEY,
    Name         VARCHAR2(100),
    Department   VARCHAR2(50),
    Salary       NUMBER(10,2)
);



INSERT INTO Accounts VALUES (101, 1, 'Savings', 5000);
INSERT INTO Accounts VALUES (102, 1, 'Current', 3000);
INSERT INTO Accounts VALUES (103, 2, 'Savings', 10000);
INSERT INTO Accounts VALUES (104, 2, 'Current', 2000);

INSERT INTO Employees VALUES (1, 'John Manager', 'Sales', 50000);
INSERT INTO Employees VALUES (2, 'Jane Lead',    'IT',    60000);
INSERT INTO Employees VALUES (3, 'Tom Analyst',  'IT',    45000);

COMMIT;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance * 1.01
    WHERE AccountType = 'Savings';

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Monthly interest applied to all savings accounts.');
END;
/


BEGIN
    ProcessMonthlyInterest;

    FOR rec IN (SELECT AccountID, Balance FROM Accounts WHERE AccountType = 'Savings') LOOP
        DBMS_OUTPUT.PUT_LINE('Account '||rec.AccountID||' New Balance: '||rec.Balance);
    END LOOP;
END;
/
