const mongoose = require("mongoose");

const advertisements = new mongoose.Schema({
  profileName: {
    type: String,
    min: 3,
    max: 20,
    required: true,
    trim: true,
  },
  shopName: {
    type: String,
    min: 3,
    max: 20,
    required: true,
    trim: true,
  },
  slug: String,
});

module.exports = mongoose.model("advertisements", advertisements);
