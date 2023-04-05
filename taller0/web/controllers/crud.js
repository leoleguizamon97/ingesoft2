const { error } = require('jquery');
const conexion = require('../database/db');

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