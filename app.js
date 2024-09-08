const express = require('express');
const morgan = require('morgan');
const path = require('path');

const app = express();
const PORT = 3000;

app.set('view engine', 'hbs');
app.use(express.static(path.join(__dirname, 'public')));

app.use(morgan('combined'))
app.use(express.json());

const orderRoutes = require('./controllers/orders');
app.use('/orders', orderRoutes);

app.listen(PORT, () => {
  console.log(`Northwind API listening on port ${PORT}`);
});