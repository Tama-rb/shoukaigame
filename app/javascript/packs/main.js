import 'stylesheets/application'
import Vue from 'vue/dist/vue.esm'
import Introduction from '../introduction.vue'
import Buttons from '../buttons.vue'
import Newitem from '../new_item.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    data: {
      show: false
    },
    components: { Introduction, Buttons, Newitem }
  })
})
