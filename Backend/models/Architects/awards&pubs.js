const mongoose = require("mongoose");

const awardsSchema = new mongoose.Schema({
  headline: {
    type: String,
    trim: true,
    //required: true,
  },
  description: {
    type: String,
    trim: true,
    required: true,
  },
  gallery: [
    {
      img: { type: String },
    },
  ],
  architectId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Architect",
    //required: true,
  },
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    //required: true,
  },

  createdDate: { type: Date },
});

module.exports = mongoose.model("Awards", awardsSchema);
