<template>
  <div class="col-12 col-sm-10 col-md-8 offset-sm-1 offset-md-2">
    <div class="mt-5">
      <form class="border border-primary rounded form-inline" @submit="addCurso">

        <h2 class="col-12 text-center text-primary mt-3 mb-5">Cree un nuevo curso</h2>

		<div class="form-group col-12">
          <label for="courseName" class="custom-label col-md-3">Nombre Curso</label>
          <input id="courseName" class="form-control col-12 col-sm-10 col-md-7 offset-sm-1" type="text"
                 placeholder="Nombre curso" v-model="courseName" required/>
        </div>
        <div class="form-group col-12">
          <label for="durationHours" class="custom-label col-md-3">Duración</label>
          <input id="durationHours" class="form-control col-12 col-sm-10 col-md-7 offset-sm-1" type="number"
                 placeholder="Duracion" v-model="durationHours" required/>
        </div>

        <div class="col-12 mb-3">
          <button class="col-sm-6 col-md-4 offset-sm-5 offset-md-7 btn btn-primary" type="submit">
            Crear curso
          </button>
        </div>

      </form>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  export default {
    name: "AddCurso",
    data( ){
      return {
        courseName: '',
        durationHours: '',
      }
    },
    beforeCreate( ){

    },
    methods: {
      addCurso( event ){
        axios
          .post( this.buildURI( ), {
			courseName: this.courseName.trim(),
            durationHours: this.durationHours.trim( )
		  }).then( response => {
            if( response.status !== 201 ){
              alert( "Error en la petición. Intente nuevamente" );
            }else{
              alert( "Se ha asignado exitosamente el nuevo curso" );
            }
          }).catch( response => {
            if( response.response.status === 401 ){
              alert( "La sesión ha finalizado" );
            }else if ( response.response.status === 400 ){
              alert( "El curso parece ya estar creado" );
            }else{
              alert( "No es posible conectar con el backend en este momento" );
            }
          });
        event.preventDefault( );
      },
      buildURI( ){
        let associatePath = "/profesores/crear-curso";
        return this.$store.state.backURL + associatePath;
      }
    }

  }
</script>

<style scoped>
  .form-inline .form-group{
    margin-bottom: 1rem;
  }
</style>
