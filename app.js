const express = require('express');
const errorHandler = require('./middleware/error_handler');

const orderRoutes = require('./routes/orders');

const app = express();
const PORT = 3000;

app.use(express.json());
app.use('/api/orders', orderRoutes);
app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`Northwind API listening on port ${PORT}`);
});