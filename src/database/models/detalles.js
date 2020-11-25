'use strict';
module.exports = (sequelize, DataTypes) => {
  const detalles = sequelize.define('detalles', {
    cantidad: DataTypes.INTEGER,
    talla: DataTypes.STRING
  }, {});
  detalles.associate = function(models) {
    // associations can be defined here
    detalles.hasMany(models.products,{
      as:'producto',
      foreignKey:'detalleId'
    })
  };
  return detalles;
};