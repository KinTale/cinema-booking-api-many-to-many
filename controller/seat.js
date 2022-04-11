const prisma = require('../src/utils/prisma')

const getSeats = async (req, res) => {
    const seats = await prisma.seat.findMany({
        include: {
            ticket: true
        }
    })
    res.json({ seats: seats })
}

const getScreen = async (req, res) => {
    const screenId = parseInt(req.params.id)
    const screen = await prisma.seat.findMany({
        where: {
            screenId: screenId
        }
    })
    res.json({ seatsInScreen: screen })
}
/*
const createTicket = async (req, res) => {

    const { screeningId, customerId, seats } = req.body

    const ticket = await prisma.ticket.create({
        data: {
            screening: {
                connect: {
                    id: screeningId
                }
            },
            customer: {
                connect: {
                    id: customerId
                }
            },
            seat: {
                connect: {
                    seatType: seats
                }
            }

        }

    })
    res.json({ ticket: ticket })


}
*/

const createTicket = async (req, res) => {
    const { screeningId, customerId, seats } = req.body
    const seatType = seats.map(x => ({ seatType: x }))

    const bookedTicket = await prisma.ticket.create({
        data: {
            screening: {
                connect: {
                    id: screeningId
                }

            },
            customer: {
                connect: {
                    id: customerId
                }
            },

            seat: {
                connect: seatType
            }
        }
    })
    res.json({ ticket: bookedTicket })
}



module.exports = { getSeats, getScreen, createTicket }