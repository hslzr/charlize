<template>
  <div id="image_container_vue">
    <img v-if:"url" :src="url" @onChange="onInputChange" />
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      url: null
    }
  },
  methods: {
    onInputChange(e) {
      const file = e.target.files[0];
      this.url = URL.createObjectURL(file);
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
