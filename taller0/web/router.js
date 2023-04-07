const express = require('express');
const router = express.Router();

const conexion = require('./database/db');
const crud = require('./controllers/crud');
const { error } = require('jquery');

//Router index
router.get('/', (req,res) =>{
	res.render('index')
})

//Ver
router.get('/ver_personas',		crud.verp);
router.get('/ver_municipios',	crud.verm);
router.get('/ver_propietarios',	crud.verpo);
router.get('/ver_viviendas',	crud.verv);

//Crear
router.get('/crear_persona', crud.createp);
router.get('/crear_municipio', crud.createm);
router.get('/crear_propietario',crud.createpo);
router.get('/crear_vivienda', crud.createv)

//Eliminar
router.get('/delete_persona/:id', crud.deletep);
router.get('/delete_vivienda/:id', crud.deletev);
router.get('/delete_municipio/:id', crud.deletem);
router.get('/delete_propietario/:id', crud.deletepo);

//Guardar
router.post('/save_persona', 	crud.savep);
router.post('/save_municipio',	crud.savem);
router.post('/save_propietario',crud.savepo);
router.post('/save_vivienda',	crud.savev);

//Actualizar
router.post('/update_persona',crud.editp);

//Edit
router.get('/edit_persona/:id', crud.select_up);

module.exports = router