<template>
  <div>
    <button @click="wannaAdd = !wannaAdd" class="nes-btn is-primary">{{ wannaAdd ? 'Close add field.' : 'Open add field' }} </button>
    <form @click.prevent v-if="wannaAdd">
      <input type="text" v-model="newItem">
      <select v-model="category">
        <option disabled=true value="Choose">Choose</option>
        <option value="0">Question</option>
        <option value="1">Conjunction</option>
        <option value="2">Theme</option>
        <option value="3">Programming</option>
      </select>
      <button @click="add" v-bind:disabled="clicked">Add</button>
    </form>
    <pre>{{ $data }}</pre>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()
export default {
  data: function () {
    return {
      btnName: "",
      newItem: "",
      category: "",
      wannaAdd: false,
      clicked: false
    }
  },
  methods: {
    add: function(category) {
      this.clicked = true
      var params = {
        category: this.category,
        content: this.newItem
      }
      var vm = this
      var url = "api/v1/questions"
      axios.post(url, {params})
      .then(function(response){
        console.log(response)
        if (response.data.result === "success") {
          alert("Done!")
        } else {
          alert(response.data.error)
        }
      }).catch(function(error){
        console.log(error)
        alert(error)
      }).finally(function(){
        vm.clicked = false
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  [v-cloak] {
    display: None;
  }
</style>
