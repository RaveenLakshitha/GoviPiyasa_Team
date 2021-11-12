var mongoose = require("mongoose");
var Schema = mongoose.Schema;
var bcrypt = require("bcrypt");
var userSchema5 = new Schema({
  itemname: {
    type: String,
    require: true,
  },

  description: {
    type: String,
    require: true,
  },
  price: {
    type: Number,
    require: true,
  },
  quantity: {
    type: Number,
    require: true,
  },
  category: {
    type: String,
    require: true,
  },

});

module.exports = mongoose.model("items", userSchema5);
