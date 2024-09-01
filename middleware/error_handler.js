function errorHandler(err, req, res, next) {
  const message = err.message;
  res.send({
    status: 'error',
    code: err.code,
    message,
    data: null
  });
  throw err;
}

module.exports = errorHandler;