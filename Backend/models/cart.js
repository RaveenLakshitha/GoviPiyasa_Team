const mongoose = require("mongoose");

const cartSchema = mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
    cartItems: [
      {
        product: { type: mongoose.Schema.Types.ObjectId, ref: "Item" },
        quantity: {
          type: Number,
        },
        price: {
          type: Number,
          required: true,
        },
      },
    ],
    cartTotalPrice: {
      type: Number,
      //required: true,
    },
  },
  { timeStamps: true }
);
cartSchema.index({ expireAt: 1 }, { expireAfterSeconds: 5 });
module.exports = mongoose.model("Cart", cartSchema);
