<template>
  <div class="row">
    <Course v-for="enrolled in enrollments"
            :key="enrolled.courseId + '-' + enrolled.role.id"
            :enrolled="enrolled"></Course>
  </div>
</template>

<script>
import axios from 'axios';
import {getAuthenticationToken} from '@/dataStorage';
import Course from "@/components/Course";


const requestPath = '/mis-cursos';

export default {
  name: "Courses",
  components: { Course },
  data(){
    return {
      enrollments: []
    }
  },
  beforeCreate(){
    axios.get( this.$store.state.backURL + requestPath, { params: { access_token: getAuthenticationToken() } } )
      .then( response => {
        if( response.status !== 200 ){
          alert( 'Error en la respuesta del servidor' );
        }else{
          this.enrollments = response.data;
        }
      } ).catch( error => {
        alert( 'Error con la conexión al servidor' );
      } );
  }
}
</script>

<style scoped>

</style>
