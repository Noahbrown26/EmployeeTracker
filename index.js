const mysql = require("mysql2");
const inquirer = require('inquirer');
require("console.table");
require("dotenv").config();

// initial message //
console.log("")
console.log(" ========================================")
console.log("           EMPLOYEE TRACKER")
console.log(" ========================================")
console.log("")

// setup connection to the database // 
const connection = mysql.createConnection({
    host: "localhost",
    port: "3306",
    user: "root",
    password: process.env.DB_PASSWORD,
    database: "employees_db",
  });
  
  connection.connect(function (err) {
    if (err) throw err;
    console.log("Connected to employees_db as " + connection.threadId + "\n");
    start();
  });
  
  // initial inquirer prompts //
  function start() {
    inquirer.prompt([

        // navigation options //
        {
            type: "list",
            name: "nav",
            message: "What would you like to do?",
            choices: [
                "View All Employees",
                "View All Roles",
                "View All Departments",
                "View All Employees By Department",
                "Add Employee",
                "Add Department",
                "Add Role",
                "Update Employee Role",
                "Quit",
            ],
        },
    ])
    .then(function (data) {

        // switch statement to run functions depending on user selection //
        switch (data.nav) {
          case "View All Employees":
            viewAllEmployees();
            break;
          case "View All Roles":
            viewAllRoles();
            break;
          case "View All Departments":
            viewAllDepartments();
            break;
          case "View All Employees By Department":
            viewEmployeeDepartment();
            break;
          case "Add Employee":
            addEmployee();
            break;
          case "Add Department":
            addDepartment();
            break;
          case "Add Role":
            addRole();
            break;
          case "Update Employee Role":
            updateEmployeeRole();
            break;
          case "Quit":
            quit();
            break;
        }
      })
      .catch(function (err) {
        console.log(err);
      });
  }

  // CRUD FUNCTIONS //

  // CREATE //

  