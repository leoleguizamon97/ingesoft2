const mysql= require('mysql');

const conexion = mysql.createConnection({
	host: 'localhost',
	user: 'webuser',
	password:'3292',
	database:'taller_0',
});
//Conecta con la BD
conexion.connect((error) =>{
	if(error){
		console.error('No se pudo conectar a la BD: '+error);
		return
	}
	console.log('Funcionó la conexion a la BD socio!');
});
//Se exporta como modulo
module.exports = conexion;