const mongoose = require("mongoose");

const architectProfile = new mongoose.Schema({});

module.exports = mongoose.model("Architect", architectProfile);
