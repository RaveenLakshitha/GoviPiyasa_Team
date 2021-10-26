const express = require("express");
const {
  getArchitects,
  getArchitect,
  createArchitect,
  updateArchitect,
  deleteArchitect,
} = require("../controllers/user");

const router = express.Router();

router.route("/").get(getArchitects).post(createArchitect);
router
  .route("/:id")
  .get(getArchitect)
  .put(updateArchitect)
  .delete(deleteArchitect);

module.exports = router;
