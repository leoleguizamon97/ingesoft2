<template>
  <div class="container-fluid mt-2">
    <h1>Taller 2 - anlleguizamongu</h1>
	<h2>Profesores</h2>
    <div class="d-flex">
	  <a type="button" class="btn btn-primary"	style="margin: 5px" href="/profesores">PRINCIPAL</a>
	  <a type="button" class="btn btn-primary"	style="margin: 5px" href="/mis-cursos">VER MIS CURSOS</a>
	  <a type="button" class="btn btn-primary"	style="margin: 5px" href="/profesores/mis-roles">VER MIS ROLES</a>
	  <a type="button" class="btn btn-primary"	style="margin: 5px" href="/profesores/nuevo-rol">NUEVO ROL</a>
	  <a type="button" class="btn btn-primary"	style="margin: 5px" href="/profesores/nuevo-curso">NUEVO CURSO</a>

	  <a type="button" class="btn btn-danger"	style="margin: 5px" href="/"> SALIR </a>
    </div>
	<router-view></router-view>
  </div>

</template>

<script>
  import {getAuthenticationToken} from '@/dataStorage';

  export default{
    name: "Home",
    beforeCreate( ){
      if( !getAuthenticationToken( ) ){
        this.$router.push( {name: 'login'} )
      }
    }
  }
</script>

<style>

</style>
