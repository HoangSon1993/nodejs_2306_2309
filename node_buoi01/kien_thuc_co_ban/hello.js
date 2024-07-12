/**
 * Bài này giới thiệu các tạo 1 server bằng hàm có sẵn trong nodejs
 * Tạo 1 đối tượng http từ 'http' của nodejs
 * http.createServer((req, res) => {
 *   res.writeHead()
 *   res.write()
 *   res.end()
 * }).listen(8080,() =>{
 *   console.log("Server is running on port 8080")
 * })
 *
 * **/
const http = require ('http')
//const datetime = require ('./datetime')
const {today,now,timeZome} = require('./datetime')

http.createServer((req,res)=>{
  res.writeHead(200, {
    "Content-Type": "text/html; charset=utf-8",
    })
  res.write("Hello world <br/>")
  res.write(`Múi giờ của bạn là: ${timeZome} <br/>`)
  res.write(`Ngày của bạn là ${today()} <br/>`)
  res.write(`Giờ của bạn là ${now()} <br/>`)
  res.end();
}).listen(8080,()=>{
  console.log('Server đã chạy ở địa chỉ http://localhost:8080');
})
