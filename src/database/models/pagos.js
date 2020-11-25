'use strict';
module.exports = (sequelize, DataTypes) => {
  const pagos = sequelize.define('pagos', {
    modo: DataTypes.STRING,
    fechaDePago: DataTypes.DATE
  }, {});
  pagos.associate = function(models) {
    // associations can be defined here
    pagos.hasMany(models.products,{
      as:'producto',
      foreignKey:'pagoId'
    })
  };
  return pagos;
};