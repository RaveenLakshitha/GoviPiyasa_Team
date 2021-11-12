var mongoose = require("mongoose");
var Schema = mongoose.Schema;
var bcrypt = require("bcrypt");
var userSchema1 = new Schema({
  name: {
    type: String,
    require: true,
  },

  designation: {
    type: String,
    require: true,
  },
  contact: {
    type: Number,
    require: true,
  },
  location: {
    type: String,
    require: true,
  },
  // password: {
  //   type: String,
  //   require: true,
  // },
});
/*
userSchema1.pre("save", function (next) {
  var user = this;
  if (this.isModified("password") || this.isNew) {
    bcrypt.genSalt(10, function (err, salt) {
      if (err) {
        return next(err);
      }
      bcrypt.hash(user.password, salt, function (err, hash) {
        if (err) {
          return next(err);
        }
        user.password = hash;
        next();
      });
    });
  } else {
    return next();
  }
});

userSchema1.methods.comparePassword = function (passw, cb) {
  bcrypt.compare(passw, this.password, function (err, isMatch) {
    if (err) {
      return cb(err);
    }
    cb(null, isMatch);
  });
};
*/
module.exports = mongoose.model("expert", userSchema1);
