const { Prisma, PrismaClient } = require('@prisma/client');
const express = require('express');

const prisma = new PrismaClient();
const router = express.Router();

router.get('/', async (req, res) => {
  const orders = await prisma.orders.findMany();
  res.json(orders);
});

module.exports = router;