let {check,validationResult,body} = require("express-validator")
function validationLoginUser(req,res,next){
    let errors = validationResult(req)
    if(!errors.isEmpty()){
        return res.render('login',{errors:errors.errors})
    }else{
        next()
    }
    
}

module.exports = validationLoginUser;