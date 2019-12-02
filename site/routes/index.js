var express = require('express');
var router = express.Router();
var Pool = require("pg").Pool;
var pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "Basket Market",
    password: "5214789bnm",
    port: 5432
});

/* GET home page. */
router.get('/', function(req, res, next) {
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