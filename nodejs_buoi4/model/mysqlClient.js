const mysql = require("mysql2");

create = (host = "localhost",
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

exports.query = (sql, params= []) =>{
  return new Promise((resolve, reject)=>{
      let conn = create();
      conn.connect();
      conn.query(sql, params,(err, result)=>{
          if(err) reject(err)
          resolve(result)
      })
  })
}