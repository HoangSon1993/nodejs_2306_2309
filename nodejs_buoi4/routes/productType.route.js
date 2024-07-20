const express = require('express')
const router = express.Router();
const productTypesController = require('../controller/productTypes.controller')

router.get('/', productTypesController.index)
router.get('/create',productTypesController.showFormCreate)
router.post('/create',productTypesController.handleCreate)

module.exports = router;