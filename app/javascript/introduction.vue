<template>
  <div>
    <h1> IceBreak Game. </h1>
    <h2>How to use <i class="snes-jp-logo"></i></h2>
    <p> ジブンノ　ジコショウカイ　ヲ シタラ　モンスターボール　ヲ　イッコ　クリック</p>
    <p> デタ　キーワード　デ　ナニカ　ハナソウ.</p>
    <br>
    <div class="message -left">
      <i class="nes-bcrikko"></i>
      <div class="nes-balloon from-left">
        <p>Click a button!</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
.v-enter-active, .v-leave-active {
  transition: opacity .5s;
}

.v-enter, .v-leave-to {
  opacity: 0;
}
</style>
