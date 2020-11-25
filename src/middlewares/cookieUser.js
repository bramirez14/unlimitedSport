function userCookie(req,res,next) {
    if(req.cookies.userCookie || req.session.userId){
        req.session.userId = req.session.userId ? req.session.userId : req.cookies.userCookie
    }
    next()
}

module.exports = userCookie;