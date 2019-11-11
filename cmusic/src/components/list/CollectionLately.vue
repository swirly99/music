<template>
  <div class="collectionLately">
    <div class="top"  :style="{backgroundColor:this.$store.getters.getColor}">
        <div class="head">
            <img @click="back" class="back" src="../../assets/back.png" alt="">
            <span @click="back">返回</span>
        </div>
        <mt-navbar v-model="active" class="tab"  :style="{backgroundColor:this.$store.getters.getColor}">
            <mt-tab-item id="tab-container1" class="bbb">我的收藏</mt-tab-item>
            <mt-tab-item id="tab-container2" class="bbb">最近播放</mt-tab-item>
        </mt-navbar>
    </div>
    <div class="page-tab-container">
      <mt-tab-container class="page-tabbar-tab-container" v-model="active" swipeable>
        <mt-tab-container-item id="tab-container1">
        	<!-- cell组件 -->
            <collection class="childCpts"></collection>
        </mt-tab-container-item>
        <mt-tab-container-item id="tab-container2">
        	<!-- cell组件 -->
            <lately class="childCpts"></lately>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
  </div>
</template>
<script>
import Collection from "./collection.vue"
import Lately from "./lately.vue"
export default {
  name: 'page-tab-container',
  data() {
    return {
      active: 'tab-container1'
    };
  },
  created() {
      console.log(this.$route.params.$i);
      this.active = this.$route.params.$i || "tab-container1"
  },
  methods: {
    back(){
        this.$router.go(-1);
    }
  },
  components:{
      "collection":Collection,
      "lately":Lately,
  }
};
</script>
<style scoped>
.head{/*返回按钮样式 */
    position: absolute;
    top:4px;left:0;
    color:#fff;
    display:flex;
    justify-content:center;
    align-items:center;
    vertical-align:middle;
 }
.head img{
     width:30px;height:30px;
 }
.collectionLately>.top{/*设置头部固定条样式*/
    height: 40px;
    width: 100%;
    position: fixed;
    z-index: 10;
}
.collectionLately>.top .router-link-active{/*设置返回按钮是样式*/
    float: left;
    height: 40px;
}
.collectionLately>.top .mint-button--default{/*设置返回按钮是样式*/
    color: #fff;
    box-shadow: 0 0;
}
.collectionLately>.top .mint-button--normal {/*设置返回按钮是样式*/
    border-radius: 0%;
    height: 40px;
}
.collectionLately>.top>.tab{/*设置切换按钮的样式*/
    height: 40px;
    width: 230px;
    margin: auto;
}
.bbb{
   margin: 0 20px;
}
.collectionLately>.top>.tab .mint-tab-item-label {/*设置切换按中文字的样式*/
    color: #fff;
    font-size: 14px;
    line-height: 0.5;
}
.collectionLately>.top>.tab>.mint-tab-item.is-selected {/*设置选中时下划线的样式*/
    border-bottom: 2px solid #fff;
    color: #fff;
    margin-bottom: 5px;
}
.collectionLately>.page-tab-container>.page-tabbar-tab-container .childCpts{/*设置子组件的高度*/
    margin-top: 55px;
    z-index: -1;
}

</style>

 
