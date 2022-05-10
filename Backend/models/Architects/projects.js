const mongoose = require("mongoose");

const projectSchema = new mongoose.Schema({
  description: {
    type: String,
    trim: true,
    //required: true,
  },
  reviews: [
    {
      userId: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
      review: String,
    },
  ],
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
  designTeam: [
    {
      memberName: {
        type: String,
      },
    },
  ],

  createdDate: { type: Date },
});

module.exports = mongoose.model("Project", projectSchema);
