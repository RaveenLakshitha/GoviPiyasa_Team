var Item = require('../models/item')
var jwt = require('jwt-simple')
var config = require('../config/dbconfig')

var functions = {
    addItem: function (req, res) {
        if ((!req.body.itemname) || (!req.body.description)|| (!req.body.price)|| (!req.body.quantity)|| (!req.body.category)) {
            res.json({success: false, msg: 'Enter all fields'})
        }
        else {
            var newItem = Item({
                itemname: req.body.itemname,
                description:req.body.description,
                price:req.body.price,
                quantity:req.body.quantity,
                category: req.body.category
            });
            newItem.save(function (err, newUser) {
                if (err) {
                    res.json({success: false, msg: 'Failed to save'})
                }
                else {
                    res.json({success: true, msg: 'Successfully saved'})
                }
            })
        }
    },
 
 
}

module.exports = functions