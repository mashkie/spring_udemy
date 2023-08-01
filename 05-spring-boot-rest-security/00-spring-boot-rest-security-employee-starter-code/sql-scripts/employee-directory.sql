-- Drop the table if it exists (Optional in PostgreSQL)
DROP TABLE IF EXISTS employee_direectory.employee;

-- Create the table for `employee`
CREATE TABLE employee_direectory.employee (
  id SERIAL PRIMARY KEY,
  first_name varchar(45),
  last_name varchar(45),
  email varchar(45)
);

-- Data for table `employee`
INSERT INTO employee_direectory.employee (first_name, last_name, email)
VALUES
  ('Leslie', 'Andrews', 'leslie@luv2code.com'),
  ('Emma', 'Baumgarten', 'emma@luv2code.com'),
  ('Avani', 'Gupta', 'avani@luv2code.com'),
  ('Yuri', 'Petrov', 'yuri@luv2code.com'),
  ('Juan', 'Vega', 'juan@luv2code.com');