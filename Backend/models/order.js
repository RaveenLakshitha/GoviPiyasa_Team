const mongoose = require("mongoose");

const orderSchema = mongoose.Schema({});

module.exports = mongoose.model("Order", orderSchema);
