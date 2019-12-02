var express = require('express');
var router = express.Router();
const jwt = require('jsonwebtoken');

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


/* GET users listing. */

//******Register*****
router.get('/signup', (req, res) => {
    if (req.user == undefined) {
        res.render('user/signup', { title: 'signup' });
    } else {
        res.redirect('/');
    }
});
// app.post('/signup', (req, res) => {
//   var user = [
//       req.body.email,
//       req.body.psw,
//       req.body.psw-repeat
//   ]
//   try {
//       pool.query('Insert into users values ($1, $2, $3);', [user[3], user[4], user[0], user[1], user[2], 1], (error, results) => {
//           if (error) {
//               throw 'Error Insert'
//           }
//           res.redirect('/login');
//       })
//   } catch (error) {
//       res.redirect('/signup');
//   }
// });


//*****LogIn*****
router.get('/login', (req, res) => {
    if (req.user == undefined) {
        res.render('user/login', { title: 'login' });
    } else {
        res.redirect('/');
    }
});
// app.post('/login', (req, res) => {
//   try {
//       pool.query('select * from users where login=$1', [req.body.login], (error, results) => {
//           try {
//               if (results.rows.length == 0) {
//                   throw 'Wrong login'
//               }
//               if (req.body.password != results.rows[0]['user_password']) {
//                   throw 'Wrong password'
//               } else {
//                   const token = jwt.sign({ login: results.rows[0]['login'], role: results.rows[0]['role'] }, secret);
//                   res.cookie('checkToken', token);

//                   res.redirect("/");
//               }
//               if (error) {
//                   throw 'Error login'
//               }
//           } catch (error) {
//               res.redirect('/login');
//           }
//       })
//   } catch (error) {
//       res.redirect('/login');
//   }
// });

// app.get('/logout', (req, res) => {
//     res.clearCookie('checkToken');
//     res.redirect('/')
// });

module.exports = router;