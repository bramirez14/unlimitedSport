var express = require('express');
var router = express.Router();
var controller = require('../controllers/sportController')
var methodOverride = require('method-override')// para put y delete
var multer= require('multer');// para subir archivo fotos o videos 
var path=require('path');
var redirigirUsuario = require('../middlewares/redirigirUsuario');

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/images/products')
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now()+ path.extname(file.originalname))
  }
})
 
var upload = multer({ storage: storage })


/* HOME PAGE */
router.get('/', controller.home);

/*LISTADO DE PRODUCTOS*/
router.get('/products',controller.product)

/* CREAR UN PRODUCTO*/
router.get('/products/create',controller.create)
router.post('/products/create',upload.any(),controller.created)

/* DETALLE DE PRODUCTO */
router.get('/products/:id',controller.detail)

/* EDITAR UN PRODUCTO */
router.get('/products/edit/:id',controller.edit)
router.put('/products/edit/:id',controller.edited)

/* ELIMINAR UN PRODUCTO */
router.delete('/products/delete/:id', controller.delete)

/* CHECKOUT */
router.get('/check', redirigirUsuario, controller.checkOut);
router.post('/checkData/:id',controller.checkOutData);




module.exports = router;
