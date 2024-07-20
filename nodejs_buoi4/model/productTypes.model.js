const mysqlClient = require("./mysqlClient");

let data = [];
function getData(result) {
  data = result;
}


let conn = mysqlClient.create();
conn.connect();
let sql = "SELECT * FROM product_types";


conn.query(sql, (error, result) => {
  if (error) throw error;
  getData(result);
});
// conn.close();

const getAll = () => data;
const getById = (id) => data.filter(x => x.id === id);
const add = (obj) =>{
  let sql ='INSERT INTO product_types (name) VALUES  (?)'
  let params = [obj.name];
  let conn = mysqlClient.create();
  conn.connect();
  
  conn.query(sql, params,(err, result)=>{
    if(err) throw  err;
    obj={id:result.insertId,...obj };
    data.push(obj)
  })
  

}

module.exports = {
  getAll,
  getById,
  add
};