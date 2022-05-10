const mongoose = require("mongoose");

const architectSchema = new mongoose.Schema({
  profileName: {
    type: String,
    min: 3,
    max: 20,
    //required: true,
    trim: true,
  },
  slug: String,
  architectName: {
    type: String,
    min: 3,
    max: 20,
    //required: true,
    trim: true,
  },
  description: {
    type: String,
    trim: true,
    //required: true,
  },
  contactNumber: {
    type: String,
    //required: true,
    min: 10,
    trim: true,
  },
  email: {
    type: String,
    unique: true,
    //required: true,
    trim: true,
    lowercase: true,
    match: [
      /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,
      "Please add a valid email",
    ],
  },
  officeHours: {
    type: Number,
  },
  address: {
    type: String,
    //required: [true, "Please add a Address"],
    min: 6,
    max: 10,
    select: false,
  },
  city: {
    type: String,
    //required: true,
    trim: true,
  },
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
  projects: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Projects",
    },
  ],
  logo: { type: String },
  coverImage: { type: String },
  createdDate: { type: Date },
});

//Sign JWT and Return
architectSchema.methods.getArchitectSignedJwtToken = function () {
  return jwt.sign({ id: this._id }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRE,
  });
};

module.exports = mongoose.model("Architect", architectSchema);
