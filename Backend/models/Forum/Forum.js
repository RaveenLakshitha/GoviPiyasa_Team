const mongoose = require("mongoose");

const forum = mongoose.Schema({
  DateAndTime: {
    type: Date,
  },
  Title: {
    type: String,
    required: true,
  },
  Category: {
    type: String,
    required: true,
  },
  QuestionBody: {
    type: String,
    required: true,
  },
  Vote: {
    type: String,
  },
  Answer: [
    {
      AnswerBody: {
        type: String,
      },
      UserId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
      },
      DateAndTime: {
        type: Date,
      },
      QuestionId: {
        type: String,
      },
      Tags: {
        type: String,
      },
      AnswerVote: {
        type: Number,
      },
    },
  ],
  slug: String,
});

module.exports = mongoose.model("Forum", forum);
