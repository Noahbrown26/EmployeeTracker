USE employees_db;

INSERT INTO department
    (department_name)
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

SELECT role.id, role.title, role.salary FROM role ORDER BY role.id;

SELECT * FROM employee;

SELECT department.id, department.department_name FROM department ORDER BY department.id;

  SELECT employee.id, employee.first_name, employee.last_name, role.title, department.department_name AS department, role.salary, CONCAT(manager.first_name, ' ', manager.last_name) AS manager
  FROM employee
  LEFT JOIN employee manager on manager.id = employee.manager_id
  INNER JOIN role ON (role.id = employee.role_id)
  INNER JOIN department ON (department.id = role.department_id)
  ORDER BY employee.id;
  
SELECT first_name, last_name, role_id FROM employee WHERE employee.id = 4;