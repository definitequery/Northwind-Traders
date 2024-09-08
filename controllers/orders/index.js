const { Prisma, PrismaClient } = require('@prisma/client');
const express = require('express');

const prisma = new PrismaClient();
const router = express.Router();

router.get('/', async (req, res) => {
  const orders = await prisma.orders.findMany();
  res.render('orders/index', { orders })
});

router.get('/:id', async (req, res) => {
  const order = await prisma.orders.findUnique({
    where: {
      orderId: parseInt(req.params.id),
    }
  });
  if (!order) {
    return res.status(404).json({
      status: 'error',
      code: 404,
      message: `Order ${req.params.id} not found`,
      data: null
    });
  }
  res.status(200).json({
    status: 'success',
    code: 200,
    message: `Order ${req.params.id} retrieved successfully`,
    data: order,
  });
});

module.exports = router;