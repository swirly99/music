<template>
  <div class="playlist">
    <!--头部-->
    <div class="list-head">
      <div class="head-left">
        <i class="iconfont icon-liebiaoxunhuan">列表循环({{this.$store.getters.getplayList.length}})</i>
      </div>
      <div class="head-right" @click.stop="deleteAll">
        <i class="iconfont icon-shanchu-copy-copy">清空列表</i>
      </div>
    </div>
    <!--歌曲列表-->
    <div class="list-cnt">
      <div class="item-cnt" v-for="(item,index) of this.$store.getters.getplayList" :key="index" ref="listItem" @click="selectItem(index)">
        <div class="playpic">
          <img v-if="getCurrentIcon(item)" src="../../assets/laba.png" width="16" height="16">
        </div>
        <div class="song-info">
          <span class="songName">{{item.songName}}</span> - <span class="singer">{{item.gname}}</span>
        </div>
        <div class="deletesong" @click.stop="deleteOne(item)">
          <img src="../../assets/shanchu.png" class="cha" width="30" height="30">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {

    }
  },
  methods: {
    selectItem(index){
      this.$store.commit("setcurrentIndex",index);
      this.$store.commit("setplayingState",true);
    },
    getCurrentIcon(item){
      if (this.$store.getters.getcurrentSong.sid === item.sid) {
        return true;
      }else{
        return false;
      }
    },
    deleteOne(item){
      this.$store.commit("delplaylistOne",item);
      this.$toast({
        message: "该歌曲已移除!",
        className: "zindex"
      })
    },
    deleteAll(){
      this.$dialog.confirm({
        title: '提示',
        message: '确认清空播放列表',
        className: 'zindex',
        overlayClass: 'zindex'
      }).then(() => {
        // on confirm
        this.$store.commit("delplaylistAll");
      }).catch(() => {
        // on cancel
      });
    },
  },
}
</script>

<style scoped>
.playlist{
  width:100%;
  overflow:hidden;
}

.list-head{
  width: 100%;
  height: 12%;
  display: flex;
  align-items:center;    
  justify-content:space-between;              
}

.head-left{
  margin-left:2%;
  font: 20px "Arial";
}

.head-right{
  margin-right:2%;
  font: 20px "Arial";
}

.icon-liebiaoxunhuan:before {
  content: "\e63d";
  color: #999;
  font-size:20px;
}

.icon-shanchu-copy-copy:before {
  content: "\e515";
  color: #999;
  font-size:20px;
}




.list-cnt{
  width: 100%;
  height:88%;
  display: flex;
  flex-direction: column;
  padding:2%;
}

.item-cnt{
  display: flex;
  align-items: center;
  justify-content: space-around;
  border-top: 1px solid #ccc;
  padding: 1%;
}

.playpic{
  width:5%;
}

.song-info{
  width:85%;
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
  color: #999;
  line-height:12px;
  font: 12px "Arial";
}

.songName{
  color: #333;
  font: 16px "Arial";
  line-height:16px;
}

.deletesong{
  width: 10%;
  text-align: right;
}

</style>