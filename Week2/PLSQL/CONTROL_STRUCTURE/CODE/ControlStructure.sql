-- Customers table
CREATE TABLE customers (
  customer_id     NUMBER PRIMARY KEY,
  name            VARCHAR2(50),
  age             NUMBER,
  balance         NUMBER,
  is_vip          CHAR(1) DEFAULT 'N'
);

-- Loans table
CREATE TABLE loans (
  loan_id         NUMBER PRIMARY KEY,
  customer_id     NUMBER REFERENCES customers(customer_id),
  interest_rate   NUMBER,       
  due_date        DATE
);

-- Sample data
INSERT INTO customers VALUES (1, 'Alice', 65, 15000, 'N');
INSERT INTO customers VALUES (2, 'Bob', 45, 8000, 'N');
INSERT INTO customers VALUES (3, 'Charlie', 70, 11000, 'N');
INSERT INTO customers VALUES (4, 'David', 30, 9500, 'N');

INSERT INTO loans VALUES (101, 1, 10, SYSDATE + 10);
INSERT INTO loans VALUES (102, 2, 12, SYSDATE + 45);
INSERT INTO loans VALUES (103, 3, 11, SYSDATE + 5);
INSERT INTO loans VALUES (104, 4, 9, SYSDATE + 25);

COMMIT;
--Scenario 1: Apply 1% Interest Discount for Customers Over 60
BEGIN
  FOR cust IN (SELECT customer_id FROM customers WHERE age > 60) LOOP
    UPDATE loans
    SET interest_rate = interest_rate - 1
    WHERE customer_id = cust.customer_id;
  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('✔ 1% discount applied to loans for customers over 60.');
END;
/
--Scenario 2: Promote Customers to VIP if Balance > 10000

BEGIN
  FOR cust IN (SELECT customer_id FROM customers WHERE balance > 10000) LOOP
    UPDATE customers
    SET is_vip = 'Y'
    WHERE customer_id = cust.customer_id;
  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('✔ VIP status updated for high-balance customers.');
END;
/


--Scenario 3: Reminders for Loans Due in Next 30 Days

BEGIN
  FOR loan_rec IN (
    SELECT l.loan_id, c.name, l.due_date
    FROM loans l
    JOIN customers c ON l.customer_id = c.customer_id
    WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan #' || loan_rec.loan_id ||
                         ' for customer ' || loan_rec.name ||
                         ' is due on ' || TO_CHAR(loan_rec.due_date, 'DD-Mon-YYYY'));
  END LOOP;
END;
/