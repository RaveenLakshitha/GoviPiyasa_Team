const mongoose = require("mongoose");

const cartSchema = mongoose.Schema({});

module.exports = mongoose.model("Cart", cartSchema);
