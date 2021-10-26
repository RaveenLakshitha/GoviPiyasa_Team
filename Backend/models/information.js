const mongoose = require("mongoose");

const information = mongoose.Schema({
  InformationID: {
    type: String,
    required: true,
  },
  Category: {
    type: String,
    required: true,
  },
  Image: {
    type: String,
    required: true,
  },
  DateAndTime: {
    type: String,
    required: true,
  },
});

module.exports = mongoose.model("Information", information);
