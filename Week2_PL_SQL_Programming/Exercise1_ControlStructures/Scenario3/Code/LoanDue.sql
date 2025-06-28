BEGIN EXECUTE IMMEDIATE 'DROP TABLE Loans';      EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
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
      SELECT l.LoanID, c.Name, l.DueDate
      FROM Loans l JOIN Customers c ON l.CustomerID = c.CustomerID
      WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30;
BEGIN
   FOR r IN cur LOOP
      DBMS_OUTPUT.PUT_LINE('Reminder: Dear '||r.Name||
                           ', your loan (ID: '||r.LoanID||
                           ') is due on '||TO_CHAR(r.DueDate,'DD-Mon-YYYY'));
   END LOOP;
END;
/
