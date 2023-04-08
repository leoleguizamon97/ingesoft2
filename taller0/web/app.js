//Express 
const express = require('express');
const favicon = require('serve-favicon');
const app = express();
//Permite tomar datos de la pagina
app.use(express.urlencoded({extended:false}));
app.use(express(express.json));
//Motor de plantillas
app.set('view engine','ejs');
//Usa los archivos en dicha carpeta
app.use(express.static(__dirname + '/imagenes'));
//Usa el router
app.use('/', require('./router'));
//Puerto de prueba
app.listen(8001, ()=>{
	console.log('server rruning en http://localhost:8001');
});

