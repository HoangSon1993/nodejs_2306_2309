const mysql = require("mysql2");

exports.create = (host = "localhost",
                  port = "3306",
                  user = "root",
                  password = "root",
                  database = "eshop") => {

  return mysql.createConnection({
    host,
    port,
    user,
    password,
    database});
};