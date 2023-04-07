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
router.get('/ver_personas',		crud.verp)
router.get('/ver_municipios',	crud.verm)
router.get('/ver_propietarios',	crud.verpo)
router.get('/ver_viviendas',	crud.verv)

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
			res.render('create_persona',{results:results});
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
//Delete
router.get('/delete_persona/:id', crud.deletep);

//Post
router.post('/save_persona', 	crud.savep);
router.post('/save_municipio',	crud.savem);
router.post('/save_propietario',crud.savepo);
router.post('/save_vivienda',	crud.savev);

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
			console.log(results[2])
			res.render('edit_persona',{results:results});
		}
	}		
	)
})

module.exports = router