BEGIN EXECUTE IMMEDIATE 'DROP TABLE Loans';      EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;Add commentMore actions
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Customers';  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
CREATE TABLE Customers (
   CustomerID NUMBER PRIMARY KEY,
   Name       VARCHAR2(100),
   Age        NUMBER,
   Balance    NUMBER(10,2),
   IsVIP      CHAR(1) DEFAULT 'N'
);
CREATE TABLE Loans (
   LoanID       NUMBER PRIMARY KEY,
   CustomerID   NUMBER REFERENCES Customers(CustomerID),
   InterestRate NUMBER(5,2),
   DueDate      DATE
);
INSERT INTO Customers VALUES (1,'John Smith',45,15000,'N');
INSERT INTO Customers VALUES (2,'Mary Johnson',62, 8000,'N');
INSERT INTO Customers VALUES (3,'Arjun Patel', 68,12000,'N');
INSERT INTO Customers VALUES (4,'Mei Chen',    35, 5000,'N');
INSERT INTO Customers VALUES (5,'Carlos Lopez',59,30000,'N');
INSERT INTO Customers VALUES (6,'Anita Singh', 72, 9500,'N');
INSERT INTO Loans VALUES (101,1,8.5,SYSDATE+15);
INSERT INTO Loans VALUES (102,2,7.2,SYSDATE+25);
INSERT INTO Loans VALUES (103,3,9.0,SYSDATE+45);
INSERT INTO Loans VALUES (104,4,8.0,SYSDATE+5);
INSERT INTO Loans VALUES (105,5,7.5,SYSDATE+60);
INSERT INTO Loans VALUES (106,6,8.5,SYSDATE+10);
COMMIT;
SET SERVEROUTPUT ON;


DECLARE
   CURSOR cur IS
      SELECT LoanID FROM Loans l JOIN Customers c ON l.CustomerID = c.CustomerID WHERE c.Age > 60;
BEGIN
   FOR r IN cur LOOP
      UPDATE Loans SET InterestRate = InterestRate - 1 WHERE LoanID = r.LoanID;
   END LOOP;
   COMMIT;
   FOR r IN (
      SELECT l.LoanID, c.Name, l.InterestRate
      FROM Loans l JOIN Customers c ON l.CustomerID = c.CustomerID
      WHERE c.Age > 60
   ) LOOP
      DBMS_OUTPUT.PUT_LINE('Updated Loan '||r.LoanID||
                           ' | '||r.Name||
                           ' | New Rate '||r.InterestRate||'%');
   END LOOP;
END;
/
