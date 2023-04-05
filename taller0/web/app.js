//Express 
const express = require('express');
const favicon = require('serve-favicon');
const app = express();

//Motor de plantillas
app.set('view engine','ejs');
app.use(express.static(__dirname + '/imagenes'));
//Usa el router
app.use('/', require('./router'));
app.listen(8000, ()=>{
	console.log('server rruning en http://localhost:8000');
});

