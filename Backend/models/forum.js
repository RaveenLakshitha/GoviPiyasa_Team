const mongoose = require("mongoose");

const forum = mongoose.Schema({
  Questions: [
    {
      QuestionId: {
        type: String,
        required: true,
      },
      DateAndTime: {
        type: Date,
        required: true,
      },
      Title: {
        type: String,
        required: true,
      },
      Category: {
        type: String,
        required: true,
      },
      Vote: {
        type: String,
        required: true,
      },
      Answer: [
        {
          AnswerId: {
            type: String,
            required: true,
          },
          UserId: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "User",
          },
          DateAndTime: {
            type: Date,
            required: true,
          },
          QuestionId: {
            type: String,
            required: true,
          },
          Tags: {
            type: String,
            required: true,
          },
        },
      ],
    },
  ],
});

module.exports = mongoose.model("Forum", forum);
