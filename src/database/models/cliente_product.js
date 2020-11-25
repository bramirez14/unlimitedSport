'use strict';
module.exports = (sequelize, DataTypes) => {
  const cliente_product = sequelize.define('cliente_product', {
    productId: DataTypes.INTEGER,
    clienteId: DataTypes.INTEGER
  }, {});
  cliente_product.associate = function(models) {
    // associations can be defined here
  };
  return cliente_product;
};