'use strict';
module.exports = (sequelize, DataTypes) => {
  const products = sequelize.define('products', {
    nombre: DataTypes.STRING,
    precio: DataTypes.DECIMAL,
    descuento: DataTypes.INTEGER,
    deporte: DataTypes.STRING,
    descripcion: DataTypes.STRING,
    image: DataTypes.STRING,
    categoriaId: DataTypes.INTEGER,
    detalleId: DataTypes.INTEGER,
    pagoId: DataTypes.INTEGER
  }, {});
  products.associate = function(models) {
    // associations can be defined here
    products.belongsToMany(models.clientes,{
      as:'cliente',
      through:'cliente_products',
      foreignKey:'productId',
      otherKey:'clienteId'
    })
    products.belongsTo(models.categorias,{
      as:'categoria'
    })
    products.belongsTo(models.detalles,{
      as:'detalle'
    })
    products.belongsTo(models.pagos,{
      as:'pago'
    })
  };
  return products;
};