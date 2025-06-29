-- Savings Accounts
CREATE TABLE savings_accounts (
  account_id   NUMBER PRIMARY KEY,
  customer_id  NUMBER,
  balance      NUMBER
);
-- Employees
CREATE TABLE employees (
  emp_id       NUMBER PRIMARY KEY,
  name         VARCHAR2(50),
  department   VARCHAR2(30),
  salary       NUMBER
);
-- Accounts (for transfers)
CREATE TABLE accounts (
  account_id   NUMBER PRIMARY KEY,
  customer_id  NUMBER,
  balance      NUMBER
);
-- Sample data
INSERT INTO savings_accounts VALUES (1, 1001, 10000);
INSERT INTO savings_accounts VALUES (2, 1002, 15000);

INSERT INTO employees VALUES (1, 'Alice', 'Sales', 50000);
INSERT INTO employees VALUES (2, 'Bob', 'IT', 60000);
INSERT INTO employees VALUES (3, 'Charlie', 'Sales', 55000);

INSERT INTO accounts VALUES (101, 1001, 5000);
INSERT INTO accounts VALUES (102, 1002, 2000);

COMMIT;

--Scenario 1: Process Monthly Interest on Savings Accounts
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  UPDATE savings_accounts
  SET balance = balance + (balance * 0.01);

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('✔ Monthly interest applied to all savings accounts.');
END;
/

--Scenario 2: Update Employee Bonus by Department
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  p_department     VARCHAR2,
  p_bonus_percent  NUMBER  -- Pass 10 for 10%
) IS
BEGIN
  UPDATE employees
  SET salary = salary + (salary * (p_bonus_percent / 100))
  WHERE department = p_department;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('✔ Bonus applied to employees in department: ' || p_department);
END;
/

--Scenario 3: Transfer Funds Between Accounts
CREATE OR REPLACE PROCEDURE TransferFunds (
  p_from_account   NUMBER,
  p_to_account     NUMBER,
  p_amount         NUMBER
) IS
  v_balance NUMBER;
BEGIN
  -- Step 1: Get the balance of the source account
  SELECT balance INTO v_balance
  FROM accounts
  WHERE account_id = p_from_account;

  -- Step 2: Check if the balance is sufficient
  IF v_balance < p_amount THEN
    RAISE_APPLICATION_ERROR(-20001, '❌ Insufficient funds in source account.');
  END IF;

  -- Step 3: Deduct from source account
  UPDATE accounts
  SET balance = balance - p_amount
  WHERE account_id = p_from_account;

  -- Step 4: Add to destination account
  UPDATE accounts
  SET balance = balance + p_amount
  WHERE account_id = p_to_account;

  -- Step 5: Commit the transaction
  COMMIT;

  -- Step 6: Show success message
  DBMS_OUTPUT.PUT_LINE('✔ Transferred ' || p_amount || 
                       ' from account ' || p_from_account || 
                       ' to account ' || p_to_account);
END;
/
