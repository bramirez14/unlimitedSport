'use strict';
module.exports = (sequelize, DataTypes) => {
  const clientes = sequelize.define('clientes', {
    nombre: DataTypes.STRING,
    apellido: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    image: DataTypes.STRING,
    direccion: DataTypes.STRING,
    telefono: DataTypes.INTEGER,
    fechaNacimiento: DataTypes.DATE,
    rememberToken: DataTypes.STRING
  }, {
    timestamp:false
  });
  clientes.associate = function(models) {
    // associations can be defined here
    clientes.belongsToMany(models.products,{
      as:'producto',
      through:'cliente_products',
      foreignKey:'clienteId',
      otherKey:'productId'
    })
  };
  return clientes;
};