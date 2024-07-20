const express = require("express");
const app = express();
const mysql = require("mysql2");
const e = require("express");
const port = 8080;
const mysqlClient = require("./mysqlClient").create();


app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));

mysqlClient.connect((err) => {
  if (err) {
    console.error("Error connecting to the database:", err.stack);
    return;
  }
  console.log("Connected to the database as id " + mysqlClient.threadId);
});

// ===== Product Types ======
app.get("/product-types", (req, res) => {

  let sql = "SELECT * FROM product_types";
  mysqlClient.query(sql, (error, result) => {
    if (error) throw error;
    res.render("page/product-types/index.ejs", { data: result });
  });
});

app.get("/product-types/add", (req, res) => {
  res.render("page/product-types/add.ejs");
});

app.post("/product-types/add", (req, res) => {
  let sql = "INSERT INTO product_types  (name) VALUES (?)";
  let param = [req.body.name];
  mysqlClient.query(sql, param, (error, result) => {
    if (error) throw error;
    console.log(result);
    if (result.affectedRows == 1) {
      res.redirect("/product-types");
    }
  });
});

app.get("/product-types/detail/:id", (req, res) => {
  let id = req.params.id;
  let sql = `SELECT *
             FROM product_types
             where id = ${id}`;
  mysqlClient.query(sql, (error, result) => {
    if (error) throw error;
    res.render("page/product-types/detail.ejs", { productType: result[0] });
  });
  // var conn = mysql.createConnection({
  //   host: 'localhost',
  //   user: 'root',
  //   password: 'root',
  //   database: 'eshop'
  // });
  // conn.connect(err => {
  //   if(err) throw err;
  //   // language=SQL
  //   let sql = `SELECT * FROM product_types where id = ${id}`;
  //   conn.query(sql, (err, result)=>{
  //     if(err) throw err;
  //     res.render('page/product-types/detail.ejs',{productType:result[0]})
  //   })
  // })
});

app.get('/product-types/edit/:id', (req, res)=>{
  let param = [req.params.id];
   let sql = 'SELECT * FROM product_types where id = ?'
  mysqlClient.query(sql, param, (error, result)=>{
      if(error) throw error;
    res.render('page/product-types/edit.ejs',{"productType":result[0]})
  })
})

app.post('/product-types/edit',(req, res)=>{
  console.log(req.body);
  let param = [req.body.name, req.body.status, req.body.id]
  let sql = 'UPDATE product_types set name = ? where id = ?'
  mysqlClient.query(sql,param,(error, result)=>{

  })
})

app.post("/product-types/add", (req, res) => {

  let sql = `INSERT INTO product_types (name)
             values ('${req.body.name}')`;
  mysqlClient.query(sql, (error, result) => {
    if (error) throw error;
    if (result.afterRows == 1) {
      res.redirect("/product-types");
    }
  });

});

// ===== End Product Types ======

// ===== Log in ======

app.get("/login", (req, res) => {

  res.render("page/user/login.ejs");
});

app.post("/login", (req, res) => {

  sql = "SELECT COUNT(*) AS COUNT FROM accounts where username = ? AND password = ?";
  const param = [req.body.username, req.body.password];

  mysqlClient.query(sql, param, (error, result) => {
    if (error) throw error;
    if (result[0].COUNT > 0) {
      res.redirect("/product-types");
    } else {
      res.redirect("/login");
    }
  });
});


// ===== End Login======


app.get("/students", (req, res) => {
  let students = [
    { id: 1, name: "Nguyen Van An", gpa: "5.2" },
    { id: 2, name: "Tran Thi Binh", gpa: "4.9" },
    { id: 3, name: "Vo Hoai Chuong", gpa: "7.3" }
  ];
  res.render("page/student/index.ejs", { students });
});

// Đóng kết nối khi ứng dụng kết thúc
process.on("exit", () => {
  mysqlClient.end();
});


app.listen(port, () => {
  console.log(`Server đang chạy trên http://localhost:${port}`);
});