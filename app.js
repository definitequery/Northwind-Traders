const express = require('express');
const morgan = require('morgan');

const orderRoutes = require('./routes/orders');

const app = express();
const PORT = 3000;

app.use(morgan('combined'))
app.use(express.json());
app.use('/api/orders', orderRoutes);

app.listen(PORT, () => {
  console.log(`Northwind API listening on port ${PORT}`);
});