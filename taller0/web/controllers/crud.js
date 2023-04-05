const { error } = require('jquery');
const conexion = require('../database/db');

exports.save_p = (req,res) => {
	const nombre		= req.body.nombre;
	const apellido		= req.body.apellido;
	const edad			= req.body.edad;
	const telefono		= req.body.telefono;
	const sexo			= req.body.sexo;
	const vivienda		= req.body.vivienda;
	const cabeza_hogar	= req.body.cabeza_hogar;
	conexion.query('INSERT INTO persona (nombre,apellido,edad,telefono,sexo,vivienda,cabeza_hogar) SET ?', {nombre: nombre,apellido: apellido, edad:edad, telefono:telefono, sexo: sexo, vivienda: vivienda, cabeza_hogar:cabeza_hogar},
	(error,results)=>{
		if(error){
			console.log(error);
		}else{
			console.log('Se creo el usuario '+nombre);
			res.redirect('ver_personas');
		}
	});
	
}