

const mysqlClient = require("./mysqlClient");

const getAll = async () => {
  let sql ="SELECT * FROM product_types"
  return await  mysqlClient.query(sql);
}

const getById = async (id)=>{

  let sql ="SELECT * FROM product_types WHERE id = ?"
  let param = [id]
  let result = await mysqlClient.query(sql, param)
  return result[0];
}

const add = async (obj)=>{
  let sql = "INSERT INTO product_types (name) VALUES  (?)";
  let param =[obj.name]

  return await mysqlClient.query(sql, param);
}

const update =async (item) => {
  let sql = "UPDATE product_types SET name = ?, status = ? WHERE id = ?";
  let param = [item.name, item.status,item.id]
  return await mysqlClient.query(sql,param);
}

//
// let data = [];
// function getData(result) {
//   data = result;
// }
//
//
// let conn = mysqlClient.create();
// conn.connect();
// let sql = "SELECT * FROM product_types";
//
//
// conn.query(sql, (error, result) => {
//   if (error) throw error;
//   getData(result);
// });
// // conn.close();
//
// const getAll = () => data;
// const getById = (id) => data.filter(x => x.id === id);
// const add = (obj) =>{
//   let sql ='INSERT INTO product_types (name) VALUES  (?)'
//   let params = [obj.name];
//   let conn = mysqlClient.create();
//   conn.connect();
//
//   conn.query(sql, params,(err, result)=>{
//     if(err) throw  err;
//     obj={id:result.insertId,...obj };
//     data.push(obj)
//   })
//
//
// }
//
module.exports = {
  getAll,
  getById,
  add,
  update
};