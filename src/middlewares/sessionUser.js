function userValidation(req,res,next){
    if(req.session.userId === undefined){
        return res.redirect("/users/login")
    }else{
        next()
    }
}

module.exports = userValidation;