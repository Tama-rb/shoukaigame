<template>
  <div>
      <div class="buttons">
        <button type="button" class="nes-btn" @click="clickButton(conjunction)">{{ conjunction }}</button>
        <button type="button" class="nes-btn" @click="clickButton(question)">{{ question }}</button>
        <button type="button" class="nes-btn">{{ theme }}</button>
        <button type="button" class="nes-btn">{{ programming }}</button>
      </div>
      <div class="result-container">
        <div v-if="isResult" class="result nes-container with-title is-centered">
          <p class="title">Let's try anyway !</p>
          <p class="content">{{ result }} </p>
        </div>
      </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      conjunction: "0",
      question: "1",
      theme: "2",
      programming: "3",
      isResult: false,
      result: {}
    }
  },
  methods: {
    clickButton: function(category) {
      var params = {
        category: category
      }
      var vm = this
      var url = "api/v1/questions/random"
      axios.get(url, {params})
      .then(function(response){
        vm.result = response.data[0].content
        vm.isResult = true
      }).catch(function(error){
        console.log(error)
      })
    }
  }
}
</script>

<style lang="scss" scoped>

  .buttons {
    margin-bottom: 50px;
  }
  .result-container {
    margin: 20 0;

    .content {
      font-size: 30px;
    }
  }
</style>
