//Express 
const express = require('express');
const app = express();

app.use('/favicon.ico', express.static('../logo.svg'));
//Motor de plantillas
app.set('view engine','ejs');

//Usa el router
app.use('/', require('./router'));

app.listen(8000, ()=>{
	console.log('server rruning en http://localhost:8000');
});

