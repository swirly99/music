<template>
  <div id="app">
    <transition name="fadel">
      <router-view></router-view>
    </transition>
    <player></player>
  </div>
</template>

<script>
import player from "./components/player/Player";
export default {
  name: 'App',
  components: {
    player
  },
}
</script>

<style>
*{margin:0;padding:0;box-sizing:border-box;letter-spacing: 2px;}
#app {
  font-family: Arial,'Avenir', Helvetica,  sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
/* 子路由进去动画 */
.fade1-enter-active{
  transition: all 0.2s;
}
.fade1-enter{
  opacity: 0;
  transform: translate3d(20%, 0, 0);
}
.fade1-enter{
  opacity: 0.9;
}

.zindex{
  z-index: 9999 !important;
}
</style>
