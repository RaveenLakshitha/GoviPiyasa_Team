const express = require('express')
const actions = require('../methods/actions')
const actions1 = require('../methods/actions1')
const router = express.Router()
const User3 = require("../models/expert")
const User2 = require("../models/user")
router.get('/', (req, res) => {
    res.send('Hello World')
})

router.get('/dashboard', (req, res) => {
    res.send('Dashboard')
})

router.get("/users", async (req, res) => {
    try {
      let userTask = await User2.find();
      res.json(userTask);
    } catch (e) {
      res.json({ msg: e });
    }
  });
router.post('/adduser', actions.addNew)
router.post('/addexpert', actions1.addExpert)
router.post('/authenticate', actions.authenticate)

router.get('/getinfo', actions.getinfo)

module.exports = router