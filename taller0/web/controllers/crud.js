const { error } = require('jquery');
const conexion = require('../database/db');
const { query } = require('express');

exports.editp = (req,res)=> {
	const id 			= req.body.id;
	const nombre		= req.body.nombre;
	const apellido		= req.body.apellido;
	const edad			= req.body.edad;
	const sexo			= req.body.sexo;
	const telefono		= req.body.telefono;
	const vivienda		= req.body.vivienda;
	const cabeza_hogar	= req.body.cabeza_hogar;
	let query = ('update persona set nombre="'+nombre+'",apellido="'+apellido+'", edad= "'+edad+'", telefono = "'+telefono+'", sexo = "'+sexo+'", vivienda = "'+vivienda+'", cabeza_hogar = "'+cabeza_hogar+'" where id ='+id )
	conexion.query(query,(error,results)=>{
		if(error){
			console.log(error);
		}else{
			console.log('Se edito el usuario con ID: ' + id +' ap '+ nombre);
			res.redirect('ver_personas');
		}
	});
}

exports.savev = (req,res) => {
	const direccion		= req.body.direccion;
	const capacidad		= req.body.capacidad;
	const niveles		= req.body.niveles;
	const ubicacion		= req.body.ubicacion;
	const persona_id 	= req.body.persona_id;

	let query0 = ('INSERT INTO vivienda (direccion,capacidad,niveles,ubicacion) VALUES ("'+direccion+'","'+capacidad+'","'+niveles+'","'+ubicacion+'");SELECT LAST_INSERT_ID() as id')
	console.log('Se creo la vivienda ' + direccion +' ub '+ ubicacion);
	conexion.query(query0, (error,results)=>{
		if(error){
			console.log(error);
		}else{
			var string=JSON.stringify(results);
			var json =  JSON.parse(string);

			console.log('Se creo el propietario ' + persona_id +' ar '+ json[0].insertId);

			let query1 = ('INSERT INTO propietarios (persona_id,vivienda_id) VALUES ("'+persona_id+'","'+json[0].insertId+'")')
			conexion.query(query1, (error,results)=>{
				if(error){
					console.log(error);
				}else{
					console.log('Se creo el propietario ' + persona_id +' ar '+ json[0].insertId);
				}
			});
			res.redirect('ver_viviendas');
		}
	});
}

exports.savepo = (req,res) => {
	const persona_id		= req.body.persona_id;
	const vivienda_id		= req.body.vivienda_id;

	let query = ('INSERT INTO propietarios (persona_id,vivienda_id) VALUES ("'+persona_id+'","'+vivienda_id+'")')
	conexion.query(query, (error,results)=>{
		if(error){
			console.log(error);
		}else{
			console.log('Se creo el propietario ' + persona_id +' ar '+ vivienda_id);
			res.redirect('ver_propietarios');
		}
	});
}

exports.savem = (req,res) => {
	const nombre		= req.body.nombre;
	const area			= req.body.area;
	const presupuesto	= req.body.presupuesto;
	const gobernador	= req.body.gobernador;

	let query = ('INSERT INTO municipio (nombre,area,presupuesto,gobernador) VALUES ("'+nombre+'","'+area+'","'+presupuesto+'","'+gobernador+'")')

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

exports.verp = (req,res) => {
	conexion.query('select p.id, p.nombre , p.apellido, p.edad, p.telefono, s.sexo, v.direccion, h.nombre as responsable_n from persona p, sexo s, vivienda v, persona h where p.sexo = s.id and p.vivienda = v.id and p.cabeza_hogar = h.id order by p.id asc',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_personas', {results:results});
		}
	})
}

exports.verv = (req,res) => {
	var query = "SELECT	v.id, v.direccion, v.capacidad, v.niveles, po.persona_id as dueno, p.nombre, p.apellido, m.nombre as n_ubicacion, v.ubicacion from vivienda v left join propietarios po on v.id = po.vivienda_id left join persona p on p.id = po.persona_id left join municipio m on m.id = v.ubicacion inner join (select min(propietarios.id) as id from propietarios group by propietarios.vivienda_id)  fil on fil.id = po.id "
	conexion.query(query,(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_viviendas', {results:results});
		}
	})
}

exports.verm = (req,res) => {
	conexion.query('select m.*, p.nombre as gobernador_n, p.apellido as gobernador_a from municipio m left join	persona p on m.gobernador = p.id;',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_municipios', {results:results});
		}
	})
}

exports.verpo = (req,res) => {
	conexion.query('select po.*, p.nombre, p.apellido, v.direccion from propietarios po, persona p, vivienda v where po.persona_id = p.id and po.vivienda_id = v.id order by po.id',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_propietarios', {results:results});
		}
	})
}
