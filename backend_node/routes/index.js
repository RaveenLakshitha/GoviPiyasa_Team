const express = require('express')
const actions = require('../methods/actions')
const actions1 = require('../methods/actions1')
const actions2 = require('../methods/actions2')
const router = express.Router()
const User3 = require("../models/expert")
const User4 = require("../models/delivery")
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

  router.get("/experts", async (req, res) => {
    try {
      let expertTask = await User3.find();
      res.json(expertTask);
    } catch (e) {
      res.json({ msg: e });
    }
  });
  router.get("/delivery", async (req, res) => {
    try {
      let deliveryTask = await User4.find();
      res.json(deliveryTask);
    } catch (e) {
      res.json({ msg: e });
    }
  });

  
router.post('/adduser', actions.addNew)
router.post('/addexpert', actions1.addExpert)
router.post('/adddelivery', actions2.addDelivery)
router.post('/authenticate', actions.authenticate)

router.get('/getinfo', actions.getinfo)

module.exports = router