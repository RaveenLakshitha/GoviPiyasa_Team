const mongoose = require("mongoose");

const categorytSchema = mongoose.Schema({
  categoryName: {
    type: String,
    required: true,
    trim: true,
  },
  parentId: {
    type: String,
  },
  categoryType: {
    type: String,
    enum: ["Main", "Sub", "Mini"],
    //required: true,
  },
  createdDate: { type: Date },
});

module.exports = mongoose.model("Category", categorytSchema);
