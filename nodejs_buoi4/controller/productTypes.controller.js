const productTypes = require("../model/productTypes.model");

const index = (req, res) => {
  let data = productTypes.getAll();
  res.render("productTypes/index.ejs", { data });
};

const details = (req, res, id) => productTypes.getAll(id);
const showFormCreate = (req, res) => {
  res.render("productTypes/create.ejs");
};

const handleCreate = (req, res) => {
  console.log(req);
  //productTypes.add(obj)
 // res.redirect("/productTypes")
};

module.exports = {
  index,
  details,
  showFormCreate,
  handleCreate
};