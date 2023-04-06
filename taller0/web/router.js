const express = require('express');
const router = express.Router();

const conexion = require('./database/db');
const crud = require('./controllers/crud');
const { error } = require('jquery');

//Router index
router.get('/', (req,res) =>{
	res.render('index')
})

//Read
router.get('/ver_personas',		(req,res) =>{
	conexion.query('select p.id, p.nombre , p.apellido, p.edad, p.telefono, s.sexo, v.direccion, h.nombre as responsable_n from persona p, sexo s, vivienda v, persona h where p.sexo = s.id and p.vivienda = v.id and p.cabeza_hogar = h.id order by p.id asc',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_personas', {results:results});
		}
	})
})
router.get('/ver_municipios',	(req,res) =>{
	conexion.query('select m.*, p.nombre as gobernador_n, p.apellido as gobernador_a from municipio m left join	persona p on m.gobernador = p.id;',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_municipios', {results:results});
		}
	})
})
router.get('/ver_propietarios',	(req,res) =>{
	conexion.query('select po.*, p.nombre, p.apellido, v.direccion from propietarios po, persona p, vivienda v where po.persona_id = p.id and po.vivienda_id = v.id order by po.id',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_propietarios', {results:results});
		}
	})
})
router.get('/ver_viviendas',	(req,res) =>{
	var query = "SELECT	v.id, v.direccion, v.capacidad, v.niveles, po.persona_id as dueno, p.nombre, p.apellido, m.nombre as n_ubicacion, v.ubicacion from vivienda v left join propietarios po on v.id = po.vivienda_id left join persona p on p.id = po.persona_id left join municipio m on m.id = v.ubicacion inner join (select min(propietarios.id) as id from propietarios group by propietarios.vivienda_id)  fil on fil.id = po.id "
	conexion.query(query,(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_viviendas', {results:results});
		}
	})
})

//Create
router.get('/crear_persona',		(req,res) =>{
	var queries = [
		'select p.id as p_id, p.nombre, p.apellido from persona p',
		'select v.id as v_id, v.direccion from vivienda v order by direccion asc'
	]
	conexion.query(queries.join(';'), (error,results,fields)=>{
		if(error){
			console.log(error);
		}else{
			res.render('create_persona',{
				results:results});
		}

	});
})
router.get('/crear_municipio',		(req,res) =>{
	conexion.query('select p.id as p_id, p.nombre, p.apellido from persona p left join municipio m on p.id = m.gobernador where m.gobernador is null', (error,results,fields)=>{
		if(error){
			console.log(error);
		}else{
			res.render('create_municipio',{
				results:results});
		}
	});
})
router.get('/crear_propietario',	(req,res) =>{
	var queries = [
		'select p.id as p_id, p.nombre, p.apellido from persona p',
		'select v.id as v_id, v.direccion from vivienda v order by direccion asc'
	]
	conexion.query(queries.join(';'), (error,results,fields)=>{
		if(error){
			console.log(error);
		}else{
			res.render('create_propietario',{
				results:results});
		}
	});
})
router.get('/crear_vivienda',		(req,res) =>{
	var queries = [
		'select p.id as p_id, p.nombre, p.apellido from persona p',
		'SELECT id, nombre FROM taller_0.municipio order by id;'
	]
	conexion.query(queries.join(';'), (error,results,fields)=>{
		if(error){
			console.log(error);
		}else{
			res.render('create_vivienda',{
				results:results});
		}

	});
})

//Post
router.post('/save_persona', crud.savep);
router.post('/save_municipio', crud.savem);
router.post('/save_propietario', crud.savepo);
router.post('/save_vivienda', crud.savev);

router.post('/update_persona',crud.editp);

//Edit
router.get('/edit_persona/:id', (req,res)=>{
	const id = req.params.id;
	var queries = [
		'select p.id as p_id, p.nombre, p.apellido from persona p',
		'select v.id as v_id, v.direccion from vivienda v order by direccion asc',
		'select * from persona where id= '+ id
	]

	conexion.query(queries.join(';'), (error,results)=>{
		if(error){
			console.log(error);
		}else{
			console.log(results)
			res.render('edit_persona',{results:results});
		}
	}		
	)
})

module.exports = router