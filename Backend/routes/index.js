const express = require('express')
const actions = require('../methods/actions')
const actions1 = require('../methods/actions1')
const actions2 = require('../methods/actions2')
const actions3 = require('../methods/actions3')
const actions4 = require('../methods/actions4')
const actions5 = require('../methods/actions5')
const router = express.Router()
const User5 = require("../models/architect")
const User3 = require("../models/expert")
const User4 = require("../models/delivery")
const User2 = require("../models/shop")
const User6 = require("../models/user")
const User7 = require("../models/item")
router.get('/', (req, res) => {
    res.send('Hello World')
})

router.get('/dashboard', (req, res) => {
    res.send('Dashboard')
})
router.get("/users", async (req, res) => {
  try {
    let userlist = await User6.find();
    res.json(userlist);
  } catch (e) {
    res.json({ msg: e });
  }
});
router.get("/shops", async (req, res) => {
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
  router.get("/items", async (req, res) => {
    try {
      let items = await User7.find();
      res.json(items);
    } catch (e) {
      res.json({ msg: e });
    }
  });

/*
 router.route('/:id').delete((req, res) => {
  User2.findByIdAndDelete(req.params.id)
    .then(() => res.json('Shop deleted.'))
    .catch(err => res.status(400).json('Error: ' + err));
});

 router.route('/:id').get((req, res) => {
  User3.findById(req.params.id)
    .then(expert => res.json(expert))
    .catch(err => res.status(400).json('Error: ' + err));
});*/
router.route('user/:name').get((req, res) => {
  User3.findById(req.params.name)
    .then(expert => res.json(expert))
    .catch(err => res.status(400).json('Error: ' + err));
});

router.route('/update/:id').post((req, res) => {
  User4.findById(req.params.id)
    .then(todo => {
      todo.name = req.body.name;
      //todo.password = req.body.password;
      todo.contact = req.body.contact;
      todo.type = req.body.type;

      todo.save()
        .then(() => res.json('Delivery updated!'))
        .catch(err => res.status(400).json('Error: ' + err));
    })
    .catch(err => res.status(400).json('Error: ' + err));
});



  router.get("/delivery", async (req, res) => {
    try {
      let deliveryTask = await User4.find();
      res.json(deliveryTask);
    } catch (e) {
      res.json({ msg: e });
    }
  });
  
  router.get("/architect", async (req, res) => {
    try {
      let architectTask = await User5.find();
      res.json(architectTask);
    } catch (e) {
      res.json({ msg: e });
    }
  });
router.post('/adduser', actions4.addUser)
router.post('/addshop', actions.addNew)
router.post('/addexpert', actions1.addExpert)
router.post('/additem', actions5.addItem)
router.post('/adddelivery', actions2.addDelivery)
router.post('/addarchitect', actions3.addArchitect)
router.post('/authenticate', actions4.authenticate)

router.get('/getinfo', actions4.getinfo)

module.exports = router