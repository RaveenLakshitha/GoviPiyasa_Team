const Order = require("../models/shop");

//@desc     Get all orders
//@route    Get /api/v1/orders
//@access   Public
exports.getShops = (req, res, next) => {
  res
    .status(200)
    .json({ success: true, msg: "Show all Orders", hello: req.hello });
};
//@desc     Get a order
//@route    Get /api/v1/orders/:id
//@access   Public
exports.getShop = (req, res, next) => {
  res.status(200).json({ success: true, msg: `Show order ${req.params.id}` });
};
//@desc     Create a order
//@route    Post /api/v1/orders
//@access   Public
exports.createShop = async (req, res, next) => {
  const shop = await Order.create(req.body);
  res.status(201).json({ success: true, data: shop });
};
//@desc     Update a orders
//@route    Put /api/v1/order
//@access   Public
exports.updateShop = (req, res, next) => {
  res.status(200).json({ success: true, msg: `Update order ${req.params.id}` });
};
//@desc     Delete a order
//@route    Delete /api/v1/order
//@access   Private
exports.deleteShop = (req, res, next) => {
  res.status(200).json({ success: true, msg: `Delete order ${req.params.id}` });
};
