const express = require("express");
const dotenv = require("dotenv");

//Read & Load env vars to process.env
dotenv.config({ path: "./config/config.env" });

const PORT = process.env.PORT || 5000;

const app = express();

app.get("/", function (req, res) {
  res.send("Hello World");
});

app.listen(PORT, () => {
  console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`);
});
