const express = require('express');
const router = express.Router();

let orders = [
  { id: 1, customer_id: 'VINET', employee_id: 5, order_date: '2016-07-04' },
  { id: 2, customer_id: 'TOMSP', employee_id: 6, order_date: '2016-07-05' },
  { id: 3, customer_id: 'HANAR', employee_id: 4, order_date: '2016-07-08' }
]

function getOrder(id) {
  const orderId = parseInt(id);
  const order = orders.find((order) => order.id === orderId);
  if (order) {
    return order;
  }
  return undefined;
}

router.get('/', (req, res) => {
  res.send({
    status: "ok",
    code: 200,
    message: `Orders retrieved successfully`,
    data: {
      orders,
    }
  });
});

router.get('/:id', (req, res) => {
  const order = getOrder(req.params.id);
  if (!order) {
    const err = new Error(`Order ${req.params.id} could not be found`);
    err.code = 404;
    throw err;
  }
  res.send({
    status: "ok",
    code: 200,
    message: `Order ${req.params.id} retrieved succesfully`,
    data: {
      order,
    }
  });
});

router.post('/', (req, res) => {
  const body = req.body;
  orders.push(body);
  res.send({
    status: "ok",
    code: 200,
    message: 'Order created successfully',
    data: {
      order: body,
    }
  });
});

router.patch('/:id', (req, res) => {
  const order = getOrder(req.params.id);
  if (!order) {
    const err = new Error(`Attempted to update Order ${req.params.id} that does not exist.`);
    err.code = 404;
    throw err;
  }
  const updatedOrder = { ...order, ...req.body };
  orders[orders.indexOf(order)] = updatedOrder;
  res.send({
    status: "ok",
    code: 200,
    message: `Order ${req.params.id} updated successfully`,
    data: {
      order: updatedOrder,
    }
  });
});

router.delete('/:id', (req, res) => {
  const order = getOrder(req.params.id);
  if (!order) {
    const err = new Error(`Attempted to delete Order ${req.params.id} that does not exist`);
    err.code = 404;
    throw err;
  }
  orders = orders.filter((order) => order.id !== parseInt(req.params.id));
  res.send({
    status: "ok",
    code: 200,
    message: `Order ${req.params.id} successfully deleted`,
    data: {
      orders
    }
  });
});

module.exports = router;