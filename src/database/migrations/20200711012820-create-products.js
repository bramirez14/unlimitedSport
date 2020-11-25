'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('products', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      nombre: {
        type: Sequelize.STRING
      },
      precio: {
        type: Sequelize.DECIMAL
      },
      descuento: {
        type: Sequelize.INTEGER
      },
      deporte: {
        type: Sequelize.STRING
      },
      descripcion: {
        type: Sequelize.STRING
      },
      image: {
        type: Sequelize.STRING
      },
      categoriaId: {
        type: Sequelize.INTEGER,
        references:{
          model:'categorias',
          key:'id'
        }
      },
      detalleId: {
        type: Sequelize.INTEGER,
        references:{
          model:'detalles',
          key:'id'
        }
      },
      pagoId: {
        type: Sequelize.INTEGER,
        references:{
          model:'pagos',
          key:'id'
        }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      deletedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('products');
  }
};