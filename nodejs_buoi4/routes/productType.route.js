const express = require('express')
const router = express.Router();
const productTypesController = require('../controller/productTypes.controller')

router.get('/', productTypesController.index)
router.get('/create',productTypesController.showFormCreate)
router.post('/create',productTypesController.handleCreate)
router.get('/detail/:id',productTypesController.details)
router.get('/edit/:id',productTypesController.showFormEdit);
router.post('/edit/:id', productTypesController.handleEdit);

module.exports = router;