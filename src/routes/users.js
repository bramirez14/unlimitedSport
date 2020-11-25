var express = require('express');
var router = express.Router();
var multer = require('multer');
var path = require('path');

/**Validaciones y middlewares de errores */
var {check,validationResult,body} = require("express-validator");
var validationCreateUser = require('../middlewares/validationCreateUser');
var validationLoginUser = require('../middlewares/validationLoginUser');

/**requiriendo el controller y un middleware Session */
let sessionUser = require('../middlewares/sessionUser');
let userController = require ('../controllers/usersController');


var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/images') 
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now()+ path.extname(file.originalname))
  }
})
 
var upload = multer({ storage: storage })


/* User register */
router.get('/register',userController.register);
router.post('/register',upload.any(),[
  check('nombre').isLength({min:2}).withMessage('ingrese su nombre'),
    check('apellido').isLength({min:2}).withMessage('ingrese su apellido'),
    check('email').isEmail().withMessage('ingrese un email'),
    check('contraseña').isLength({min:6}).withMessage('ingrese una contraseña')
],validationCreateUser,userController.store);

/* Log In */
router.get('/login',userController.login);
router.post('/login',[
  check('email','El campo requiere un E-mail').isEmail().isLength(),
  check('password','Debe ingresar su contraseña').isLength({min:3})
],validationLoginUser,userController.auth); 

/* User Profile */
router.get('/profile',sessionUser,userController.profile);


module.exports = router;
