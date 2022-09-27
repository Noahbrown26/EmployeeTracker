DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;

USE employees_db;

CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);

CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

USE employees_db;

INSERT INTO department
    (name)
VALUES
    ('Engineering'),
    ('Finance'),
    ('Legal'),
    ('Sales'),
    ('Service');
INSERT INTO role
    (title, salary, department_id)

VALUES
    ('Sales Lead', 11000000, 4),
    ('Salesperson', 4000000, 4),
    ('Lead Engineer', 15000000, 1),
    ('Software Engineer', 8000000, 1),
    ('Account Manager', 7000000, 2),
    ('Accountant', 3000000, 2),
    ('Legal Team Lead', 45000000, 3),
    ('Lawyer', 25000000, 3);

INSERT INTO employee
    (first_name, last_name, role_id, manager_id)

VALUES
    ('Noah', 'Brown', 1, NULL),
    ('Adam', 'Scott', 2, NULL),
    ('Michael', 'Jordan', 3, 1),
    ('Tom', 'Cruise', 4, NULL),
    ('Tom', 'Hanks', 5, 4),
    ('Jeniffer', 'Aiston', 6, NULL),
    ('Oprah', 'Winfrey', 7, NULL),
    ('Bruce', 'Wayne', 8, 7);
    