const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const bcrypt = require("bcryptjs");

const secret = 'basket-market-secret';
var Pool = require("pg").Pool;
var pool = new Pool({
    user: "basket_market_admin",
    host: "localhost",
    database: "Basket Market",
    password: "basket_market",
    port: 5432
});

function checkToken(req, res, next) {
    const token = req.cookies['checkToken'];
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

function encryptPassword(password) {
    return bcrypt.hashSync(password, bcrypt.genSaltSync(5), null);
};

function validPassword(password, stored) {
    return bcrypt.compareSync(password, stored);
};

router.get("/profile", checkToken, (req, res) => {
    if (req.user == undefined) {
        res.redirect('/user/login');
    } else {

        pool.query("select * from users where email=$1", [req.user.email], (err, user_info) => {
            pool.query(`select categories.cat_name,products.prod_name,products.price from basket_items
                        join products on basket_items.product_id=products.id
                        join categories on products.category_id=categories.id
                        where user_id=$1`, [req.user.id], (error, basket_info) => {
                res.render("user/profile", {
                    title: "Profile",
                    user: user_info.rows[0],
                    prod_in_basket: basket_info.rows
                });
            });
        });
    }
});

/* GET users listing. */

//******Register*****
router.get('/signup', checkToken, (req, res) => {
    if (req.user == undefined) {
        res.render('user/signup', { title: 'signup' });
    } else {
        res.redirect('/');
    }
});
router.post('/signup', (req, res) => {
    var user = [
        req.body.username,
        req.body.address,
        req.body.email,
        req.body.psw,
        req.body.psw_repeat
    ]
    try {
        if (req.body.psw == req.body.psw_repeat) {
            pool.query('select email from users where email=$1', [user[2]], (error, results) => {
                if (results.rows.length == 0) {
                    pool.query('Insert into users (username, password, email, address) values ($1, $2, $3, $4);', [user[0], encryptPassword(user[3]), user[2], user[1]], (error, results) => {
                        if (error) {
                            throw error
                        }
                        res.redirect('/user/login');
                    });
                } else res.redirect('/user/signup');
            });
        }
    } catch (error) {
        res.redirect('/user/signup');
    }
});

//*****LogIn*****
router.get('/login', checkToken, (req, res) => {
    if (req.user == undefined) {
        res.render('user/login', { title: 'login' });
    } else {
        res.redirect('/');
    }
});
router.post('/login', (req, res) => {
    try {
        pool.query('Select * from users where email=$1', [req.body.email], (error, results) => {
            if (error) {
                console.log(error.message);
            }
            if (results.rows.length == 0) {
                console.log('wrong email!');
            }
            if (!validPassword(req.body.psw, results.rows[0]['password'])) {
                console.log('wrong password!');
            } else {
                const token = jwt.sign({ email: results.rows[0]['email'], id: results.rows[0]['id'] }, secret);
                res.cookie('checkToken', token);
                res.redirect("/");
            }
        });

    } catch (error) {
        res.redirect('/user/login');
    }
});

router.get('/logout', checkToken, (req, res) => {
    res.clearCookie('checkToken');
    res.redirect('/')
});

module.exports = router;