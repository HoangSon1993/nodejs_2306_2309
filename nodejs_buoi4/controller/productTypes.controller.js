const productTypes = require("../model/productTypes.model");

const index = (req, res) => {
  productTypes.getAll()
    .then(data => res.render("productTypes/index.ejs", { data }))
    .catch(err => {
      throw err;
    });

};

const details = (req, res) => {
  let id = req.param("id");
  productTypes.getById(id)
    .then(productType => res.render("productTypes/detail", { productType }))
    .catch(error => res.redirect("/product-types"));


};
const showFormCreate = (req, res) => {
  res.render("productTypes/create.ejs");
};

const handleCreate = (req, res) => {
  productTypes.add(req.body);
  res.redirect("/product-types");
};

const showFormEdit = (req, res) => {
  console.log(req.param("id"));
  let id = req.param("id");
  productTypes.getById(id)
    .then(productType => res.render("productTypes/edit", { productType }))
    .catch(err => res.redirect("/product-types"));
};
const handleEdit = async (req, res) => {
  const obj = req.body;
  const oldItem = await productTypes.getById(obj.id);
  if (!oldItem) {
    //

  }
  if(obj.status === undefined){
    obj.status = 0
  }

  const result = await productTypes.update(obj);
  if(result.affectedRows === 1){
    res.redirect("/product-types")
  }
};

module.exports = {
  index,
  details,
  showFormCreate,
  handleCreate,
  showFormEdit,
  handleEdit
};