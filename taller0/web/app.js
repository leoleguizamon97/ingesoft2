//Express 
const express = require('express');
const app = express();

/*app.get('/',(req,res) => {
	res.send('ola de mar');
})*/

//Motor de plantillas
app.set('view engine','ejs');

app.listen(8000, ()=>{
	console.log('server rruning en http://localhost:8000');
});

