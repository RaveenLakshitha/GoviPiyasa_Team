const mongoose = require("mongoose");

const architectProfile = new mongoose.Schema({
  profileName: {
    type: String,
    min: 3,
    max: 20,
    required: true,
    trim: true,
  },
  architectName: {
    type: String,
    min: 3,
    max: 20,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    trim: true,
    required: true,
  },
  Category: {
    type: String,
    enum: ["flowergardening", "vegetablegardening", "economicalcrops"],
  },
  contactNumber: {
    type: String,
    required: true,
    min: 10,
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
  officeHours: {
    type: int,
  },
  address: {
    type: String,
    required: [true, "Please add a Address"],
    min: 6,
    max: 10,
    select: false,
  },
  city: {
    type: String,
    required: true,
    trim: true,
  },
  projects: [
    {
      description: {
        type: String,
        trim: true,
        required: true,
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
      designTeam: [
        {
          memberName: {
            type: String,
          },
        },
      ],
    },
  ],
  logo: { type: String },
  coverImage: { type: String },
  createdDate: { type: Date },
});

module.exports = mongoose.model("Architect", architectProfile);
