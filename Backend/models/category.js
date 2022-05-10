const mongoose = require("mongoose");
const slugify = require("slugify");

const categorytSchema = mongoose.Schema({
  categoryName: {
    type: String,
    required: true,
    trim: true,
  },
  slug: String,
  parentId: {
    type: String,
  },
  categoryType: {
    type: String,
    enum: ["Main", "Sub", "Mini"],
    //required: true,
  },
  Items: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Item",
    },
  ],
  createdDate: { type: Date },
});
// Create users slugify from name
categorytSchema.pre("save", function (next) {
  this.slug = slugify(this.categoryName, { lower: true });
  next();
});
module.exports = mongoose.model("Category", categorytSchema);
