<template>
  <div>
      <div class="buttons">
        <button type="button" class="nes-btn" :class="buttonColor[0]" @click="clickButton(conjunction)"><i class="nes-pokeball"></i>{{ conjunction }}</button>
        <button type="button" class="nes-btn" :class="buttonColor[1]" @click="clickButton(question)"><i class="nes-pokeball"></i>{{ question }}</button>
        <button type="button" class="nes-btn" :class="buttonColor[2]" @click="clickButton(theme)"><i class="nes-pokeball"></i>{{ theme }}</button>
        <button type="button" class="nes-btn" :class="buttonColor[3]" @click="clickButton(programming)"><i class="nes-pokeball"></i>{{ programming }}</button>
        <button type="button" class="nes-btn" @click="clickShuffle">Shuffle</button>
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
import lodash from 'lodash'
// TODO: ボタンをコンポーネント化したい
//import questionButton from './button.vue'
export default {
  data: function () {
    return {
      conjunction: "0",
      question: "1",
      theme: "2",
      programming: "3",
      isResult: false,
      result: {},
      buttonColor: [
        "is-primary",
        "is-success",
        "is-warning",
        "is-error"
      ],
      category: {
        id: 0,
        name: "question",
        buttonColor: "is-primary"
      }
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
        if (!!response.data[0]) {
          vm.result = response.data[0].content
          vm.isResult = true
        } else {
          vm.result = "Nothing..."
          vm.isResult = true
        }
      }).catch(function(error){
        console.log(error)
      })
    },
    clickShuffle: function() {
      this.buttonColor =_.shuffle(this.buttonColor)
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
    margin-bottom: 50px;

    .content {
      font-size: 30px;
    }
  }

  [v-cloak] {
    display: none;
  }
</style>
