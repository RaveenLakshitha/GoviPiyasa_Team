const Shop = require("../models/shop");
const ErrorResponse = require("../utils/errorResponse");

//@desc     Get all shops
//@route    Get /api/v1/shops
//@access   Public
exports.getShops = async (req, res, next) => {
  try {
    const shops = await Shop.find();
    res.status(200).json({ success: true, count: shops.length, data: shops });
  } catch (err) {
    res.status(400).json({ success: false });
  }
};
//@desc     Get a shop
//@route    Get /api/v1/shops/:id
//@access   Public
exports.getShop = async (req, res, next) => {
  try {
    const shop = await Shop.findById(req.params.id);

    if (!shop) {
      next(
        new ErrorResponse(`Shop not Found With id of ${req.params.id}`, 404)
      );
    }
    res.status(200).json({ success: true, data: shop });
  } catch (err) {
    next(new ErrorResponse(`Shop not Found With id of ${req.params.id}`, 404));
  }
};
//@desc     Create a shop
//@route    Post /api/v1/shops
//@access   Public
exports.createShop = async (req, res, next) => {
  const shop = await Shop.create(req.body);
  res.status(201).json({ success: true, data: shop });
};
//@desc     Update a shop
//@route    Put /api/v1/shops
//@access   Public
exports.updateShop = async (req, res, next) => {
  try {
    const shop = await Shop.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!shop) {
      return res.status(400).json({ success: false });
    }
    res.status(200).json({ success: true, data: shop });
  } catch (err) {
    return res.status(400).json({ success: false });
  }
};
//@desc     Delete a shop
//@route    Delete /api/v1/shops
//@access   Private
exports.deleteShop = async (req, res, next) => {
  try {
    const shop = await Shop.findByIdAndDelete(req.params.id);

    if (!shop) {
      return res.status(400).json({ success: false });
    }
    res.status(200).json({ success: true, data: {} });
  } catch (err) {
    return res.status(400).json({ success: false });
  }
};
