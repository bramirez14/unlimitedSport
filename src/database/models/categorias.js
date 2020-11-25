'use strict';
module.exports = (sequelize, DataTypes) => {
  const categorias = sequelize.define('categorias', {
    marca: DataTypes.STRING,
    image: DataTypes.STRING
  }, {
  
  });
  categorias.associate = function(models) {
    // associations can be defined here
    categorias.hasMany(models.products,{
      as:'producto',
      foreignKey:'categoriaId'
    })
  };
  return categorias;
};