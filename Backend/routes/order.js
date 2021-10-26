const express = require("express");
const {
  getOrders,
  getOrder,
  createOrder,
  updateOrder,
  deleteOrder,
} = require("../controllers/user");

const router = express.Router();

router.route("/").get(getOrders).post(createOrder);
router.route("/:id").get(getOrder).put(updateOrder).delete(deleteOrder);

module.exports = router;
