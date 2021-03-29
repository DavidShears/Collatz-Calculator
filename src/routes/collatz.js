var express = require('express');

var CollatzRouter = express.Router();

CollatzRouter.route('/')
    .get(function(req, res){
        res.render('collatz', { 
            nav: req.app.locals.navlinks,
         } );
    });

module.exports = CollatzRouter;