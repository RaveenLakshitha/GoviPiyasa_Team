const express = require("express");
const dotenv = require("dotenv");
const morgan = require("morgan");
// Route Files
const shops = require("./routes/shop");

//Read & Load env vars to process.env
dotenv.config({ path: "./config/config.env" });

const PORT = process.env.PORT || 5000;

const app = express();

//Dev logging middleware
if (process.env.NODE_ENV === "development") {
  app.use(morgan("dev"));
}

// Mount routes
app.use("/api/v1/shops", shops);

app.listen(PORT, () => {
  console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`);
});
