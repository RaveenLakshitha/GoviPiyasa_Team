//@desc     Get all shops
//@route    Get /api/v1/shops
//@access   Public
exports.getShops = (req, res, next) => {
  res
    .status(200)
    .json({ success: true, msg: "Show all Shops", hello: req.hello });
};
//@desc     Get a shop
//@route    Get /api/v1/shops/:id
//@access   Public
exports.getShop = (req, res, next) => {
  res.status(200).json({ success: true, msg: `Show Shop ${req.params.id}` });
};
//@desc     Create a shop
//@route    Post /api/v1/shops
//@access   Public
exports.createShop = (req, res, next) => {
  res.status(200).json({ success: true, msg: "Create a Shop" });
};
//@desc     Update a shop
//@route    Put /api/v1/shops
//@access   Public
exports.updateShop = (req, res, next) => {
  res.status(200).json({ success: true, msg: `Update Shop ${req.params.id}` });
};
//@desc     Delete a shop
//@route    Delete /api/v1/shops
//@access   Private
exports.deleteShop = (req, res, next) => {
  res.status(200).json({ success: true, msg: `Delete Shop ${req.params.id}` });
};
