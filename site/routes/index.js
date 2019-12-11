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
router.get('/', checkToken, function(req, res) {
    pool.query('Select * from categories', (error, cat_res) => {
        if (error) {
            console.log(error.message);
        } else {
            pool.query(`select 
                products.id as id,
                products.prod_name as name, 
                products.price as price,
                products.weight as weight,
                products.image as image,
                categories.cat_name as category,
                ingredients.name as ingredient
                from products 
                inner join categories
                on products.category_id = categories.id
                inner join product_compositions 
                on products.id = product_compositions.product_id
                inner join ingredients 
                on product_compositions.ingredient_id = ingredients.id`, (error, prod_res) => {
                if (error) {
                    console.log(error.message);
                } else {
                    var j = 0;
                    products = [{
                        id: prod_res.rows[0].id,
                        name: prod_res.rows[0].name,
                        price: prod_res.rows[0].price,
                        weight: prod_res.rows[0].weight,
                        image: prod_res.rows[0].image,
                        category: prod_res.rows[0].category,
                        ingredients: [prod_res.rows[0].ingredient]
                    }];
                    var prev_id = products[j].id;
                    for (var i = 0; i < prod_res.rows.length; i++) {
                        if (prev_id == prod_res.rows[i].id) {
                            products[j].ingredients.push(prod_res.rows[i].ingredient);
                        } else {
                            j++;
                            products.push({
                                id: prod_res.rows[i].id,
                                name: prod_res.rows[i].name,
                                price: prod_res.rows[i].price,
                                weight: prod_res.rows[i].weight,
                                image: prod_res.rows[i].image,
                                category: prod_res.rows[i].category,
                                ingredients: [prod_res.rows[i].ingredient]
                            });
                            prev_id = products[j].id
                        }
                    }
                    res.render('shop/index', {
                        title: 'Basket Market',
                        logined: req.user ? true : false,
                        isAdmin: req.user && req.user.email == "admin@basket-market.com",
                        questions: [],
                        categories: cat_res.rows,
                        products: products
                    });
                }
            });
        }
    });
});

router.get('/add-to-basket/:id', checkToken, (req, res) => {
    pool.query('insert into basket_items (user_id, product_id) values ($1, $2)', [req.user.id, req.params.id],
        (error) => {
            if (error) {
                throw error;
            }
            res.redirect("/");
        });
});
// router.post('/shop/product_add_to_basket', checkToken, (req, res) => {
//     console.log(req.user.id, req.body);
//     // if (req.user == undefined) {
//     //     res.redirect('/user/login');
//     // } else {
//     //     pool.query('INSERT INTO basket(user_id, product_id) VALUES ($1, $2)', [req.user.id, req.body.id], (error, results) => {
//     //         if (error) {
//     //             console.log(error.message);
//     //         }
//     //         console.log(req.user.id, req.body.id);
//     //     });
//     // }
// });

module.exports = router;