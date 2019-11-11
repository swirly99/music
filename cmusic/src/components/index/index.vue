<template>
    <div class="index">
        <!-- 头部 -->
        <header :style="{backgroundColor:this.$store.getters.getColor}">
            <!-- 左侧弹出层按钮 -->
            <div class="left-btn">
                <img src="../../assets/personList.png" @click="personListShow">
                <van-popup v-model="personListPopup" position="left" :style="{ width:'80%',height:'100%'}">
                    <user></user>
                </van-popup>
            </div>
            <h4>CMUSIC</h4>
            <!-- 右侧弹出层按钮 -->
            <div>
                <img src="../../assets/search.png" class="icon-right" @click="searchShow">
                <van-popup v-model="searchPopup" position="right" :style="{ width:'100%',height:'100%'}"  closeable close-icon="http://127.0.0.1:4000/img/back.png" close-icon-position="top-left">
                    <searchHead></searchHead>
                </van-popup>
            </div>
        </header>
        
            <!-- 顶部弹出层 -->
            <div>
                <van-popup :value="topShow" position="top" :style="{ height: '100%' }">
                    <rank v-if="this.$store.getters.getRankShow"></rank>
                    <songSheet v-if="this.$store.getters.getSongSheetShow"></songSheet>
                    <singer v-if="this.$store.getters.getSingerShow"></singer>
                </van-popup>
            </div>
        <!-- 导航栏 -->
        <van-tabs v-model="active" swipeable :background="this.$store.getters.getColor" line-width="30px" title-active-color="#fff" title-inactive-color="#fff" @click="onClick">
            <!-- 导航栏对应内容 -->
            <van-tab v-for="item,i of headerList" :title="item.uname" :key="i">
                <!-- 数据库引入的具体内容 -->
               <navitem1 v-if="i==0"></navitem1>
               <navitem2 v-else-if="i==1"></navitem2>
               <navitem3 v-else></navitem3>
            </van-tab>
        </van-tabs>
    </div>
</template>
<script>
// 引入子组件
import navitem1 from "./navitem/navitem1"
import navitem2 from "./navitem/navitem2"
import navitem3 from "./navitem/navitem3"
import searchHead from "../searchHead/searchHead"
import CollectionLately from "../list/CollectionLately"
import rank from "../list/rank"
import singer from "../list/singer"
import songSheet from "../list/SongSheet"
import user from "../user/user"
export default {
    data(){
        return {
            headerList:[{uname:"推荐",list:"[0]"},{uname:"排行",list:"[1]"},{uname:"歌手",list:"[2]"}],
            active:0,
            personListPopup:false,
            searchPopup:false
        }
    },
    methods:{
        // 左侧个人中心
        personListShow(){
            this.personListPopup=!this.personListPopup;
        },
        // 右侧搜索框
        searchShow(){
            this.searchPopup=!this.searchPopup;
        },
        // 切换页面时自动到顶部
        onClick(name, title) {
            window.scrollTo(0,0);
        }
    },
    computed: {
        topShow:{
            get(){
                return this.$store.getters.getTopShow;
            },
            set(val){
                this.$store.getTopShow=val;
            }
        },
        songSheetShow:{
            get(){
                return this.$store.getters.getSongSheetShow;
            },
            set(val){
                this.$store.getSongSheetShow=val;
            }
        },
        singerShow:{
            get(){
                return this.$store.getters.getSingerShow;
            },
            set(val){
                this.$store.getSingerShow=val;
            }
        },
    },
    // 子组件
    components:{navitem1,navitem2,navitem3,searchHead,CollectionLately,rank,songSheet,singer,user}
}
</script>
<style scoped>
    index{position:relative;width:100%}
    header{
        height:44px;width:100%;
        padding:0 10px;
        display:flex;
        justify-content:space-between;
        align-items:center;
        position:fixed;
        z-index:100;
    }
    header>h4{color:#fff}
    .icon-right{width:24px;padding-right:5px;}
     .index /deep/ .van-hairline--top-bottom:after{border-width:0}
     .index /deep/ .van-tabs--line .van-tabs__wrap{padding-bottom:7px;color:#e4e4e4}
     .index /deep/ .van-ellipsis{color:#e4e4e4}
     .index /deep/ .van-tabs__line{background-color:#e4e4e4}
     .index /deep/ .van-tabs__nav--line{
        position:fixed;
        z-index:99;
        height:37px;
        width:100%;
        padding-top:44px;
     }
     .index /deep/ .van-tab__pane{padding-top:52px}
     .index /deep/ .van-image__img{width:26px;height:26px;margin-top:-10px;margin-left:-10px;}
     .left-btn /deep/ .van-image__img{position:fixed;z-index:11}
</style>