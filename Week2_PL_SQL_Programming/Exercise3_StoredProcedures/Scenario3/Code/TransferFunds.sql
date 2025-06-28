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

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_from_account IN NUMBER,
    p_to_account   IN NUMBER,
    p_amount       IN NUMBER
) IS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_from_account FOR UPDATE;

    IF v_balance < p_amount THEN
        DBMS_OUTPUT.PUT_LINE('Insufficient balance in Account ' || p_from_account);
    ELSE
        UPDATE Accounts SET Balance = Balance - p_amount WHERE AccountID = p_from_account;
        UPDATE Accounts SET Balance = Balance + p_amount WHERE AccountID = p_to_account;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Transferred ' || p_amount || ' from Account ' || p_from_account || ' to Account ' || p_to_account);
    END IF;
END;
/


BEGIN
    TransferFunds(102, 104, 1000);

    FOR rec IN (SELECT AccountID, Balance FROM Accounts WHERE AccountID IN (102, 104)) LOOP
        DBMS_OUTPUT.PUT_LINE('Account '||rec.AccountID||' Balance: '||rec.Balance);
    END LOOP;
END;
/
/
