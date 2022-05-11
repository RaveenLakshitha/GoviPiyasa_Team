const mongoose = require("mongoose");

const itemSchema = mongoose.Schema({
  productName: {
    type: String,
    //required: true,
    trim: true,
  },
  slug: String,
  price: {
    type: Number,
    //required: true,
  },
  description: {
    type: String,
    //required: true,
    trim: true,
  },
  quantity: {
    type: Number,
    //required: true,
  },
  rating: {
    type: Number,
    //required: true,
  },
  productPictures: [
    {
      img: { type: String },
    },
  ],
  reviews: [
    {
      userId: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
      review: String,
    },
  ],
  category: {
    type: String,
    ref: "Category",
    //required: true,
  },
  shopId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Shop",
    //required: true,
  },
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    //required: true,
  },
  updateAt: Date,
});

module.exports = mongoose.model("Item", itemSchema);
