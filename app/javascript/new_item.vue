<template>
  <div>
    <button @click="wannaAdd = !wannaAdd" class="nes-btn">　{{ wannaAdd ? 'Close add field.' : 'Open add field' }} </button>
    <div class="nes-container is-rounded" v-if="wannaAdd">
      <form @click.prevent v-if="wannaAdd">
        <div class="nes-field">
          <label for="name_field">new question text</label>
          <input type="text" v-model="newItem" class="nes-input">
        </div>
        <div id="selects" class="selects">
          category
          <div class="nes-select">
            <select v-model="category" required>
              <option value="" disabled=true>Select...</option>
              <option value="0">Question</option>
              <option value="1">Conjunction</option>
              <option value="2">Theme</option>
              <option value="3">Programming</option>
            </select>
          </div>
        </div>
        <button @click="add" v-bind:disabled="clicked" class="nes-btn is-primary">Add</button>
      </form>
      <br>
      <p>Debug</p>
      <pre>{{ $data }}</pre>
    </div>

    <dialog class="nes-dialog" id="dialog-default">
      <form method="dialog">
        <p class="title">Dialog</p>
        <p>{{ dialogMessage }}</p>
        <menu class="dialog-menu">
          <button class="nes-btn is-primary">Okay!</button>
        </menu>
      </form>
    </dialog>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()
export default {
  data: function () {
    return {
      newItem: "",
      category: "",
      wannaAdd: false,
      clicked: false,
      dialogMessage: ""
    }
  },
  methods: {
    add: function(category) {

      if (this.category === "") {
        this.dialogMessage = "Select a category !"
        document.getElementById('dialog-default').showModal()
        return
      }

      if (this.newItem === "") {
        this.dialogMessage = "Type a new question text"
        document.getElementById('dialog-default').showModal()
        return
      }


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
          vm.dialogMessage = "Added!"
          vm.newItem = ""
          vm.category = ""
        } else {
          vm.dialogMessage = response.data.error
        }
        document.getElementById('dialog-default').showModal()
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
    display: none;
  }
</style>
