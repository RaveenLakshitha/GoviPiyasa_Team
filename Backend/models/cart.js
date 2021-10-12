const mongoose = require("mongoose");

const cartSchema = mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
    cartItems: [
      {
        product: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
        quantity: {
          type: Number,
        },
        price: {
          type: Number,
          required: true,
        },
      },
    ],
  },
  { timeStamps: true }
);

module.exports = mongoose.model("Cart", cartSchema);
