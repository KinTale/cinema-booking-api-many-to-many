const express = require('express')
const {getSeats, getScreen, createTicket} = require('../controller/seat')
const router = express.Router()

router.get('/',  getSeats)
router.get('/:id',  getScreen)
router.put('/create', createTicket)
module.exports = router