const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
    FirstName: {
      type: String,
      min: 3,
      max: 20,
      required: true,
      trim: true,
    },
    LastName: {
      type: String,
      min: 3,
      max: 20,
      required: true,
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
    password: {
      type: String,
      required: [true, "Please add a Password"],
      min: 6,
      select: false,
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
    contactNumber: {
      type: String,
      required: true,
      minlength: 10,
      trim: true,
    },
    role: {
      type: String,
      enum: ["admin", "user"],
      default: "user",
    },
    profilePicture: { type: String },
    interestedCategories: {
      type: String,
      enum: ["flowergardening", "vegetablegardening", "economicalcrops"],
    },
    createdDate: { type: Date },
  },
  { timeStamps: true }
);

module.exports = mongoose.model("User", userSchema);
