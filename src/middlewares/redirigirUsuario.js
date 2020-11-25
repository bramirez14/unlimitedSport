function redirigirUsuario(req, res, next) {
    if(req.session.userId || req.cookies.userId){
        req.session.userId ? req.session.userId : req.cookies.userId;
        next();
    } else {
        res.redirect('/users/login');
    }
    
}

module.exports = redirigirUsuario;