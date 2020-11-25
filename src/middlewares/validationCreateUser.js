let {check,validationResult,body} = require("express-validator")
function validationCreateUser(req,res,next){
    let errors = validationResult(req)
    if(!errors.isEmpty()){
        return res.render('createUser',{errors:errors.errors})
    }else{
        next()
    }
    
}

module.exports = validationCreateUser;