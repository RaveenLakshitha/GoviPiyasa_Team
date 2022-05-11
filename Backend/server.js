const express = require("express");
const dotenv = require("dotenv");
const morgan = require("morgan");
// Route Files
const shops = require("./routes/shop");
const users = require("./routes/user");
const connectDB = require("./config/db");
const errorHandler = require("./middleware/error");
//Read & Load env vars to process.env
dotenv.config({ path: "./config/config.env" });

const PORT = process.env.PORT || 5000;

//Connect Database
connectDB();

const app = express();

//body parser
app.use(express.json());

//Dev logging middleware
if (process.env.NODE_ENV === "development") {
  app.use(morgan("dev"));
}

// Mount routes
app.use("/api/v1/shops", shops);
app.use("/api/v1/users", users);

//ErrorHandler(Must after mounting routes)
app.use(errorHandler);

const server = app.listen(PORT, () => {
  console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`);
});

//Handle unhandled promise rejections
process.on("unhandledRejection", (err, promise) => {
  console.log(`Error ${err.message}`);
  server.close(() => process.exit(1));
});
