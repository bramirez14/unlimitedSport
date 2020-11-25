const fs = require('fs')
const path = require('path');

//**Aca esta la conversion de la B.D a un objeto de JS */
let productsJson = path.join(__dirname,'../data/sportDataBase.json');
let arrayProducts = JSON.parse(fs.readFileSync(productsJson, 'utf-8')|| "[]");

let DB = require('../database/models');
let OP = DB.Sequelize.Op;

const toThousand = n => n.toString().replace( /\B(?=(\d{3})+(?!\d))/g,"." );

let checkOut = []

const controller={
    home: async (req,res)=>{

        try {
            let vendidos = await DB.products.findAll({
                include:["categoria"]
            })
            let ofertas = await DB.products.findAll({
                limit: 5,
                order: [["nombre", "desc"]],
            })
            let categorias = await DB.categorias.findAll() 
            res.render('home',{arrayProducts,vendidos,categorias,ofertas,toThousand})
        } catch (error) {
            res.send(error)
        }
    },
    //res.send(arrayProducts),
    product: async (req,res)=>{
        try {
            let products = await DB.products.findAll()
            let categorias = await DB.products.findAll()
            res.render('listaDeProductos',{arrayProducts,products,categorias})
        } catch (error) {
            res.send(error)
        }
    },
    create: async (req,res)=>{
        try {
            let categorias = await DB.categorias.findAll()
            res.render('createProducts',{categorias})
        } catch (error) {
            res.send(error)
        }
    },
    created: async (req,res)=>{
        try {
            await DB.products.create({
                nombre:req.body.name,
                precio:req.body.price,
                descuento:req.body.discount,
                deporte:req.body.sport,
                descripcion:req.body.description,
                image:req.files[0].filename,
                categoriaId:req.body.marca
            })
            res.redirect('/')
        } catch (error) {
            res.send(error)
        }
    },

    detail: async (req,res)=>{
        try {
            let id = req.params.id;
        let product = await DB.products.findByPk(id,{
            include:["categoria"]
        });
        if(id == product.id){
            res.render('detailProduct',{
                toThousand,
                product,
                precioConDescuento:toThousand(product.price - (product.price * product.discount / 100))
            })
            }else{
                res.send('producto no esta añadido')
            }
        } catch (error) {
            res.send(error)
        }

    },
    edit: async (req,res)=>{
        try {
            let id = req.params.id
    
            let product = await DB.products.findByPk(id,{
                include:["categoria"]
            })
            let marcas = await DB.categorias.findAll()
    
            res.render('edit',{product,marcas})
        } catch (error) {
            res.send(error)
        }
    },
    edited: async (req,res)=>{
        try {
            let id = req.params.id;
           
            await DB.products.update({
                nombre:req.body.name,
                precio:req.body.price,
                descuento:req.body.discount,
                deporte:req.body.sport,
                descripcion:req.body.description,
                categoriaId:req.body.marca
            },{
                where:{
                    id:id
                }
            })  
            res.redirect('/products');
        } catch (error) {
            res.send(error)
        }      
    },
    delete: async (req,res)=>{
        try {
            let id = req.params.id;
            await DB.products.destroy({
                where:{
                    id:id
                }
            });
           res.redirect('/products')
        } catch (error) {
            res.send(error)
        }
    },
    checkOut:(req,res)=>{
        let product = arrayProducts.find(product =>{
            let checkId = checkOut.find(check =>{
                return product.id == check
            })
                return checkId == product.id
        })
        
        res.render('checkOut',{product})
    },
    checkOutData:(req,res)=>{
           let id = req.params.id
        checkOut.push(id)
        res.redirect('/check')
        
    }
}
module.exports = controller;