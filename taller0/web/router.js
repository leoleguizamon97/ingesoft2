const express = require('express');
const router = express.Router();

const conexion = require('./database/db');

router.get('/', (req,res) =>{
	res.render('index')
})
router.get('/ver_personas', (req,res) =>{
	conexion.query('SELECT * FROM persona',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_personas', {results:results});
		}
	})
})
router.get('/ver_municipios', (req,res) =>{
	conexion.query('SELECT * FROM municipio',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_municipios', {results:results});
		}
	})
})
router.get('/ver_viviendas', (req,res) =>{
	conexion.query('SELECT * FROM vivienda',(error,results) => {
		if(error){
			throw error;
		}else{
			res.render('ver_viviendas', {results:results});
		}
	})
})
module.exports = router