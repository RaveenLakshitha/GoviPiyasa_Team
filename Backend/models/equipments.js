const mongoose = require("mongoose");

const equipmentSchema = mongoose.Schema({
  EquipmentId: {
    type: String,
    required: true,
  },
  AvailableTime: {
    type: String,
    required: true,
  },
  Images: {
    type: String,
  },
  NoOfDays: {
    type: String,
    required: true,
  },
  RentFee: {
    type: String,
    required: true,
  },
  Task: {
    type: String,
    required: true,
  },

  ShopId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Shop",
  },
  slug: String,
});
module.exports = mongoose.model("Equipment", equipmentSchema);
