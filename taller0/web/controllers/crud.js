const conexion = require('../database/db');

exports.save_p = (req,res) => {
	const nombre		= req.body.nombre;
	const apellido		= req.body.apellido;
	const edad			= req.body.edad;
	const telefono		= req.body.telefono;
	const sexo			= req.body.sexo;
	const vivienda		= req.body.vivienda;
	const cabeza_hogar	= req.body.cabeza_hogar;
	console.log('Se creo el usuario '+nombre);
}