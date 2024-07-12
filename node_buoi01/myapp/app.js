/**
 * Tạo server với thư viện express
 * Sử dụng view engine ejs
 * Truyền - nhận - render dữ liệu
 * **/
const express = require('express')
const app = express();
const port = 8080;

app.set('view engine','ejs')



app.get('/',(req,res)=>{
  let students = [
    {id: 1, name: "Nguyen Van An", gpa: 7.9},
    {id: 2, name: "Nguyen Thi Binh", gpa: 5.9},
    {id: 3, name: "Le Hoang Cuong", gpa: 6.9}
  ]
  res.render('index',{title:"Trang chủ", students: students})
})

app.listen(port,()=>{
  console.log(`Server đang chạy trên http://localhost:${port}`);
})