const express = require('express')
const {getSeats, getScreen, createTicket} = require('../controller/seat')
const router = express.Router()

router.get('/',  getSeats)
router.get('/screen/:id',  getScreen)
router.post('/create', createTicket)
module.exports = router