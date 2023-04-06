const { error } = require('jquery');
const conexion = require('../database/db');
const { query } = require('express');

exports.savem = (req,res) => {
	const nombre		= req.body.nombre;
	const area			= req.body.area;
	const presupuesto	= req.body.presupuesto;
	const gobernador	= req.body.gobernador;

	let query = ('INSERT INTO municipio (nombre,area,presupuesto,gobernador) VALUES ("'+nombre+'","'+area+'","'+presupuesto+'","'+gobernador+'")')
	console.log('Se creo el municipio ' + nombre +' ar '+ area+' pre ' + presupuesto +' gob ' + gobernador);
	conexion.query(query, (error,results)=>{
		if(error){
			console.log(error);
		}else{
			console.log('Se creo el municipio ' + nombre +' ar '+ area+' pre ' + presupuesto +' gob ' + gobernador);
			res.redirect('ver_municipios');
		}
	});
}

exports.savep = (req,res) => {
	const nombre		= req.body.nombre;
	const apellido		= req.body.apellido;
	const edad			= req.body.edad;
	const sexo			= req.body.sexo;
	const telefono		= req.body.telefono;
	const vivienda		= req.body.vivienda;
	const cabeza_hogar	= req.body.cabeza_hogar;
	
	let query = ('INSERT INTO persona (nombre,apellido,edad,telefono,sexo,vivienda,cabeza_hogar) VALUES ("'+nombre+'","'+apellido+'","'+edad+'","'+telefono+'","'+sexo+'","'+vivienda+'","'+cabeza_hogar+'")')
	conexion.query(query, (error,results)=>{
		if(error){
			console.log(error);
		}else{
			console.log('Se creo el usuario ' + nombre +' ap '+ apellido +' ed ' + edad +' tel ' + telefono +' s ' + sexo +' v ' + vivienda+ ' ch ' + cabeza_hogar);
			res.redirect('ver_personas');
		}
	});
	
}