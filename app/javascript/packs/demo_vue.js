import Vue from 'vue'
import Form from '../components/form.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#someElem',
    render: h => h(Form)
  })
})
