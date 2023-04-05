const express = require('express');
const router = express.Router();

const conexion = require('./database/db');
const crud = require('./controllers/crud');

//Router index
router.get('/', (req,res) =>{
	res.render('index')
})
//Router ver
router.get('/ver_personas',		(req,res) =>{
	conexion.query('SELECT * FROM persona',(error,results) => {
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
	conexion.query('SELECT * FROM propietarios',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_propietarios', {results:results});
		}
	})
})
router.get('/ver_viviendas',	(req,res) =>{
	conexion.query('SELECT * FROM vivienda',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_viviendas', {results:results});
		}
	})
})

//Router crear
router.get('/crear_persona',		(req,res) =>{
	var queries = [
		'select p.id as p_id, p.nombre, p.apellido from persona p',
		'select v.id as v_id, v.direccion from vivienda v order by direccion asc',
		'select m.id as m_id, m.nombre as m_nombre from municipio m'
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
	res.render('create_municipio');
})
router.get('/crear_propietario',	(req,res) =>{
	res.render('create_propietario');
})
router.get('/crear_vivienda',		(req,res) =>{
	res.render('create_vivienda');
})
//Post
router.post('/save_persona', crud.savep);




module.exports = router