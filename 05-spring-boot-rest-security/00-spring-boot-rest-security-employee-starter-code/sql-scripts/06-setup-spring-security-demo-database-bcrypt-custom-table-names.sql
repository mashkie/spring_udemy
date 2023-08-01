-- Drop the table if it exists (Optional in PostgreSQL)
DROP TABLE IF EXISTS employee_directory.roles;
DROP TABLE IF EXISTS employee_directory.members;

-- Create the table for `members`
CREATE TABLE employee_directory.members (
  user_id varchar(50) NOT NULL,
  pw char(68) NOT NULL,
  active boolean NOT NULL,
  PRIMARY KEY (user_id)
);

-- Inserting data for table `members`
INSERT INTO employee_directory.members (user_id, pw, active)
VALUES
('john','{bcrypt}$2a$10$qeS0HEh7urweMojsnwNAR.vcXJeXR1UcMRZ2WcGQl9YeuspUdgF.q', true),
('mary','{bcrypt}$2a$10$qeS0HEh7urweMojsnwNAR.vcXJeXR1UcMRZ2WcGQl9YeuspUdgF.q', true),
('susan','{bcrypt}$2a$10$qeS0HEh7urweMojsnwNAR.vcXJeXR1UcMRZ2WcGQl9YeuspUdgF.q', true);


-- Create the table for `roles`
CREATE TABLE employee_directory.roles (
  user_id varchar(50) NOT NULL,
  role varchar(50) NOT NULL,
  CONSTRAINT authorities5_unique_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES employee_directory.members (user_id)
);

-- Inserting data for table `roles`
INSERT INTO employee_directory.roles (user_id, role)
VALUES
('john','ROLE_EMPLOYEE'),
('mary','ROLE_EMPLOYEE'),
('mary','ROLE_MANAGER'),
('susan','ROLE_EMPLOYEE'),
('susan','ROLE_MANAGER'),
('susan','ROLE_ADMIN');