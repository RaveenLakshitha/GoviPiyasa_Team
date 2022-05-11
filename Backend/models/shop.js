const mongoose = require("mongoose");

const shopSchema = new mongoose.Schema({
  shopName: {
    type: String,
    min: 3,
    max: 20,
    required: true,
    trim: true,
  },
  slug: String,
  sellerName: {
    type: String,
    min: 3,
    max: 20,
    required: true,
    trim: true,
  },
  category: {
    type: String,
    enum: ["flowergardening", "vegetablegardening", "economicalcrops"],
  },
  contactNumber: {
    type: String,
    required: true,
    minlength: 10,
    trim: true,
  },
  email: {
    type: String,
    unique: true,
    required: true,
    trim: true,
    lowercase: true,
    match: [
      /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,
      "Please add a valid email",
    ],
  },
  address: {
    type: String,
    required: [true, "Please add a Address"],
    min: 6,
    max: 10,
    select: false,
  },
  zipCode: {
    type: String,
  },
  city: {
    type: String,
    required: true,
    trim: true,
  },
  logo: { type: String },
  coverImage: { type: String },
  createdDate: { type: Date },
});

module.exports = mongoose.model("Shop", shopSchema);
