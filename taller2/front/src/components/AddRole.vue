<template>
  <div class="col-12 col-sm-10 col-md-8 offset-sm-1 offset-md-2">
    <div class="mt-5">
      <form class="border border-primary rounded form-inline" @submit="associate">

        <h2 class="col-12 text-center text-primary mt-3 mb-5">Asocie su usuario con un nuevo rol</h2>

        <div class="form-group col-12">
          <label for="password" class="custom-label col-md-3">Contrase&ntilde;a</label>
          <input id="password" class="form-control col-12 col-sm-10 col-md-7 offset-sm-1" type="password"
                 placeholder="Contraseña" v-model="password" required/>
        </div>

        <div class="form-group col-12">
          <label class="custom-label col-md-3 display" for="rol">Tipo de Usuario</label>
          <select id="rol" class="form-control col-12 col-sm-10 col-md-7 offset-sm-1" v-model="role" required>
            <option value="" disabled selected>-- Seleccione un Rol --</option>
            <option v-for="role in roles" :key="role.id" :value="role.id">{{role.roleName}}</option>
          </select>
        </div>
        <div class="col-12 mb-3">
          <button class="col-sm-6 col-md-4 offset-sm-5 offset-md-7 btn btn-primary" type="submit">
            Asociar Rol
          </button>
        </div>

      </form>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    name: "AddRole",
    data( ){
      return {
        password: '',
        role: '',
        roles: [],
      }
    },
    beforeCreate( ){
      const rolesPath = '/roles';
      axios
        .get( this.$store.state.backURL + rolesPath )
        .then( response => {
          if( response.status !== 200 ){
            alert( "Error en la petición. Intente nuevamente" )
          }else{
            this.roles = response.data;
          }
        }).catch( response => {
          alert( "No es posible conectar con el backend en este momento" );
        });
    },
    methods: {
      associate( event ){
        axios
          .post( this.buildURI( ), {
              password: this.password
            }, {
              params: {
                access_token: localStorage.getItem( "token" )
              }
            }
          ).then( response => {
            if( response.status !== 201 ){
              alert( "Error en la petición. Intente nuevamente" );
            }else{
              alert( "Se ha asignado exitosamente el nuevo rol" );
            }
          }).catch( response => {
            if( response.response.status === 401 ){
              alert( "¡Ups! Al parecer tu contraseña es incorrecta o la sesión ha finalizado" );
            }else if ( response.response.status === 400 ){
              alert( "¿Estás seguro de que aún no tienes ese rol asignado?" );
            }else{
              alert( "No es posible conectar con el backend en este momento" );
            }
          });
        event.preventDefault( );
      },
      buildURI( ){
        let associatePath = "/registro/nuevo-rol/";
        return this.$store.state.backURL + associatePath + this.role;
      }
    }

  }
</script>

<style scoped>
  .form-inline .form-group{
    margin-bottom: 1rem;
  }
</style>
