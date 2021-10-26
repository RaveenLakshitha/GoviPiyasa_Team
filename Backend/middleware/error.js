const errorHandler = (err, req, res, next) => {
  console.log(err.stack);

  console.log(err.name);

  res.status(err.statusCode || 500).json({
    success: false,
    error: err.message || "Server Error",
  });
};

module.exports = errorHandler;
