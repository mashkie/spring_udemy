-- Connect to the database (Assuming you are already connected to the appropriate database)

-- Drop the table if it exists (Optional in PostgreSQL)
DROP TABLE IF EXISTS employee_directory.authorities;
DROP TABLE IF EXISTS employee_directory.users;

-- Create the table for `users`
CREATE TABLE employee_directory.users (
  username varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  enabled boolean NOT NULL,
  PRIMARY KEY (username)
);

-- Inserting data for table `users`
INSERT INTO employee_directory.users (username, password, enabled)
VALUES
  ('john', '{noop}test123', true),
  ('mary', '{noop}test123', true),
  ('susan', '{noop}test123', true);


-- Create the table for `authorities`
CREATE TABLE employee_directory.authorities (
  username varchar(50) NOT NULL,
  authority varchar(50) NOT NULL,
  UNIQUE (username, authority),
  FOREIGN KEY (username) REFERENCES employee_directory.users (username)
);

-- Inserting data for table `authorities`
INSERT INTO employee_directory.authorities (username, authority)
VALUES
  ('john', 'ROLE_EMPLOYEE'),
  ('mary', 'ROLE_EMPLOYEE'),
  ('mary', 'ROLE_MANAGER'),
  ('susan', 'ROLE_EMPLOYEE'),
  ('susan', 'ROLE_MANAGER'),
  ('susan', 'ROLE_ADMIN');