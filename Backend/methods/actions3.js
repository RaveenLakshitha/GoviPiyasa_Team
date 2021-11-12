

var Architect = require('../models/architect')
var jwt = require('jwt-simple')
var config = require('../config/dbconfig')

var functions = {
    addArchitect: function (req, res) {
        if ((!req.body.name) ||(!req.body.about)||(!req.body.contact)||(!req.body.team)) {
            res.json({success: false, msg: 'Enter all fields'})
        }
        else {
            var newUser3 =Architect({
                name: req.body.name,
                //password:req.body.password,
                about:req.body.about,
                contact:req.body.contact,
                team:req.body.team
                
               
            
            
            });
            newUser3.save(function (err, newUser) {
                if (err) {
                    res.json({success: false, msg: 'Failed to save'})
                }
                else {
                    res.json({success: true, msg: 'Successfully saved'})
                }
            })
        }
    },/*
    authenticate: function (req, res) {
        Architect.findOne({
            name: req.body.name
        }, function (err, user) {
                if (err) throw err
                if (!user) {
                    res.status(403).send({success: false, msg: 'Authentication Failed, User not found'})
                }

                else {
                    user.comparePassword(req.body.password, function (err, isMatch) {
                        if (isMatch && !err) {
                            var token = jwt.encode(user, config.secret)
                            res.json({success: true, token: token})
                        }
                        else {
                            return res.status(403).send({success: false, msg: 'Authentication failed, wrong password'})
                        }
                    })
                }
        }
        )
    },
    getinfo: function (req, res) {
        if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
            var token = req.headers.authorization.split(' ')[1]
            var decodedtoken = jwt.decode(token, config.secret)
            return res.json({success: true, msg: 'Hello ' + decodedtoken.name})
        }
        else {
            return res.json({success: false, msg: 'No Headers'})
        }
    }*/
}

module.exports = functions