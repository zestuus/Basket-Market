var express = require('express');
var router = express.Router();
const jwt = require('jsonwebtoken');

var Pool = require("pg").Pool;
var pool = new Pool({
    user: "basket_market_admin",
    host: "localhost",
    database: "Basket Market",
    password: "basket_market",
    port: 5432
});
const secret = 'basket-market-secret';

function checkToken(req, res, next) {
    const token = req.cookies['checkToken']
    if (token) {
        jwt.verify(token, secret, (err, decoded) => {
            if (err) {
                req.user = undefined;
            } else {
                req.user = decoded;
            }
        });
    }
    next();
};

/* GET home page. */
router.get('/', checkToken, function(req, res, next) {
    pool.query('Select name from categories', (error, cat_res) => {
        if (error) {
            console.log(error.message);
        } else {
            pool.query('Select * from products', (error, prod_res) => {
                if (error) {
                    console.log(error.message);
                } else {
                    res.render('shop/index', {
                        title: 'Basket Market',
                        logined: req.user ? true : false,
                        isAdmin: req.user && req.user.email == "admin@basket-market.com",
                        questions: [],
                        categories: cat_res.rows,
                        products: prod_res.rows
                    });
                }
            });
        }
    });

});

module.exports = router;