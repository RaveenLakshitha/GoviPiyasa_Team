const user = require("../models/user");
const ErrorResponse = require("../utils/errorResponse");

//@desc     Get all users
//@route    Get /api/v1/users
//@access   Public
exports.getUsers = async (req, res, next) => {
  try {
    const users = await user.find();
    res.status(200).json({ success: true, count: shops.length, data: users });
  } catch (err) {
    res.status(400).json({ success: false });
  }
};
//@desc     Get a user
//@route    Get /api/v1/users/:id
//@access   Public
exports.getUser = async (req, res, next) => {
  try {
    const user = await Shop.findById(req.params.id);

    if (!user) {
      next(
        new ErrorResponse(`User not Found With id of ${req.params.id}`, 404)
      );
    }
    res.status(200).json({ success: true, data: user });
  } catch (err) {
    next(new ErrorResponse(`User not Found With id of ${req.params.id}`, 404));
  }
};
//@desc     Create a user
//@route    Post /api/v1/users
//@access   Public
exports.createUser = async (req, res, next) => {
  const Users = await user.create(req.body);
  res.status(201).json({ success: true, data: Users });
};
//@desc     Update a user
//@route    Put /api/v1/users/:id
//@access   Public
exports.updateUser = async (req, res, next) => {
  try {
    const user = await Shop.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!user) {
      return res.status(400).json({ success: false });
    }
    res.status(200).json({ success: true, data: user });
  } catch (err) {
    return res.status(400).json({ success: false });
  }
};
//@desc     Delete a user
//@route    Delete /api/v1/users/:id
//@access   Private
exports.deleteUser = async (req, res, next) => {
  try {
    const user = await Shop.findByIdAndDelete(req.params.id);

    if (!user) {
      return res.status(400).json({ success: false });
    }
    res.status(200).json({ success: true, data: {} });
  } catch (err) {
    return res.status(400).json({ success: false });
  }
};
