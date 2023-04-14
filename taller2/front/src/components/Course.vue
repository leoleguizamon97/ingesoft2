<template>
  <div style="margin: 20px;">
    <h3><b>Nombre Curso: </b>{{ enrolled.courseName }}</h3>
    <h3><b>Duracion: </b>{{ enrolled.courseDurationHours }}</h3>
    <h3><b>Rol: </b> {{ enrolled.role.roleName }}</h3>
	<h3>-----------------------------------------------------</h3>
  </div>
</template>

<script>
export default {
  name: "Course",
  props: {
    enrolled: Object
  }
}
</script>
