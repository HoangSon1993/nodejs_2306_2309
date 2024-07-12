/**
 * Ví dụ này vẫn viết thuần bằng nodejs mà không sử dụng framework
 * Viết cơ chế định tuyến route bằng cách tự handle
 * **/
const http = require("http")

http.createServer((req, res)=>{
  console.log(req.url);
  res.writeHead(200, {
    "Content-Type": "text/html; charset=utf-8",
  })
  switch (req.url){
    case "/":
      res.write("Đây là trang chủ <br/>"); break;
    case "/login":
      res.write("Đây là trang login <br/>"); break;
    default:
      res.write("Trang web bạn cần không tồn tại <br/>"); break;
  }

  res.end()
}).listen(8080,()=>{
  console.log('Server đã chạy ở địa chỉ http://localhost:8080');
})