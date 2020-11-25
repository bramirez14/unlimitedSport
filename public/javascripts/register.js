const { check } = require("express-validator")

const form =document.querySelector('.form')
const nombre = document.querySelector('#nombre')
const apellido = document.querySelector('#apellido')
const email = document.querySelector('email')
const contraseña = document.querySelector('contraseña')
const rcontraseña= document.querySelector('rcontraseña')

form.addEventListener('submit',(e)=>{
    e.preventDefault()
    checkInputs()
})
//evitando espacio 
function checkInputs(){
    const nombre=nombre.value.trim()
    const apellidoValue=apellido.value.trim()
    const emailValue=email.value.trim()
    const contraseñaValue=contraseña.value.trim()
    const rcontraseñaValue=rcontraseña.value.trim()
 nombre===''?setError(usernamer,'El campo no puede estar vacio'):''
}
function setError(input,message){
    const small =document.querySelector('.error').innerHTML=message
}