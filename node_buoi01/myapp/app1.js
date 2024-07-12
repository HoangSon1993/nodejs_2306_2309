/**
 * Bài này sử dụng thư viện express để tạo app1
 * từ đó sử dụng app1 xuyên suốt ứng dụng
 * '/users/:id' ===> let id = req.params.id;
 * '/products/search' ===> let min = req.query.min;  let max = req.query.max;
 *
 * **/

const express = require('express')
const app1 = express()
const port = 8080;



app1.get('/login', (req,res)=>{
  res.send("<h1>Đây là trang Login</h1>")
})
app1.get('/users/:id', (req,res)=>{
  let id = req.params.id;
  res.send(`<h1>Thông tin người dùng có Id: ${id}</h1>`)
})
app1.get('/products/search', (req,res)=>{
  let min = req.query.min;
  let max = req.query.max;
  res.send(`<h1>Khoảng giá min = ${min} -> max = ${max}</h1>`)
})


app1.listen(port, () => {
  console.log(`Server đang chạy trên http://localhost:${port}`);
})