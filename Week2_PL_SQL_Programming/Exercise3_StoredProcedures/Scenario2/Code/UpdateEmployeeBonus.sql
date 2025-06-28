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


CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department IN VARCHAR2,
    p_bonus_pct  IN NUMBER
) IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus_pct / 100)
    WHERE Department = p_department;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Bonus applied to department: ' || p_department);
END;
/


BEGIN
    UpdateEmployeeBonus('IT', 10);

    FOR rec IN (SELECT Name, Salary FROM Employees WHERE Department = 'IT') LOOP
        DBMS_OUTPUT.PUT_LINE(rec.Name || ' new salary: ' || rec.Salary);
    END LOOP;
END;
/
