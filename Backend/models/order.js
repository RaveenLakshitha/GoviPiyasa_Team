const mongoose = require("mongoose");

const orderSchema = mongoose.Schema({
  refNo: {
    type: String,
  },
  qty: {
    type: Number,
    required: true,
    default: 1,
  },
  price: {
    type: Number,
    required: true,
  },
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
  contactNumber: {
    type: String,
    required: true,
    min: 10,
    trim: true,
  },
  additionalPhoneNumber: {
    type: String,
  },
  address: {
    type: String,
    required: [true, "Please add a Address"],
    min: 6,
    max: 10,
    select: false,
  },
  addressType: {
    type: String,
    required: true,
    enum: ["Home", "Office"],
    default: "Home",
  },
  city: {
    type: String,
    required: true,
    trim: true,
  },
  orderDate: {
    type: Date,
    required: true,
  },
  deliveryDate: {
    type: Date,
  },
  orderStatus: {
    type: String,
    enum: ["COmfirmed", "Declined", "Pending"],
  },
});

module.exports = mongoose.model("Order", orderSchema);
