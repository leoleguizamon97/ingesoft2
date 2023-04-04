const express = require('express');
const router = express.Router();

const conexion = require('./database/db');

router.get('/persona', (req,res) =>{
	res.send('PERSONA');
})

router.get('/', (req,res) =>{
	res.render('index', {var1:'Esto es un meme'});
})

/* Ejemplo de request de la bd
router.get('/', (req,res) =>{
	conexion.query('SELECT * FROM persona',(error,results) => {
		if(error){
			throw error;
		}else{
			res.send(results);
		}
	})
})*/

module.exports = router