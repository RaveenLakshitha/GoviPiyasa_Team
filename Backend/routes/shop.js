const express = require("express");
const {
  getShops,
  getShop,
  createShop,
  updateShop,
  deleteShop,
} = require("../controllers/shop");

const router = express.Router();

router.route("/").get(getShops).post(createShop);
router.route("/:id").get(getShop).put(updateShop).delete(deleteShop);

module.exports = router;
