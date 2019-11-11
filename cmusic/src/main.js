import Vue from 'vue'
import App from './App'
import router from './router'
import MintUI from 'mint-ui'

// 引入vant部分功能模块
import { Tab, Tabs,Popup,Swipe,SwipeItem,Lazyload,IndexBar,IndexAnchor,Cell,NavBar,ActionSheet,Dialog,Toast } from 'vant'
// 引入vant部分功能模块样式
import 'vant/lib/tab/style'
import 'vant/lib/tabs/style'
import 'vant/lib/popup/style'
import 'vant/lib/swipe/style'
import 'vant/lib/swipe-item/style'
import 'vant/lib/lazyload/style'
import 'vant/lib/index-bar/style'
import 'vant/lib/index-anchor/style'
import 'vant/lib/cell/style'
import 'vant/lib/nav-bar/style'
import 'vant/lib/action-sheet/style'
import 'vant/lib/dialog/style'
import 'vant/lib/toast/style'
//注册vant部分功能模块
Vue.use(Tab,).use(Tabs).use(Popup).use(Swipe).use(SwipeItem).use(Lazyload, {lazyComponent: true}).use(IndexBar).use(IndexAnchor).use(Cell).use(NavBar).use(ActionSheet).use(Dialog).use(Toast);

//引入字体图标
import './font/font-player/iconfont.css'

//引入mint-ui组件库
Vue.use(MintUI)
import 'mint-ui/lib/style.css'

//引入axios
import axios from "axios"
axios.defaults.baseURL="http://127.0.0.1:4000/";
axios.defaults.withCredentials=true;
Vue.prototype.axios = axios;

Vue.config.productionTip = false

//引入vuex
import Vuex from 'vuex'
//注册
Vue.use(Vuex)
//创建存储对象
var store=new Vuex.Store({
  state:{
    inputVal:"",
    searchList:[],
    searchHistory:[],
    playing:false,//是否播放
    fullScreen:false,//是否全屏
    playList:[],//播放列表
    currentIndex:-1,//0开始
    topShow:false,  //顶部弹出层是否显示
    rankShow:false, //rank组件是否显示
    songSheetShow:false, //songSheet组件是否显示
    singerShow:false, //singer组件是否显示
    rankRid:1,
    songSheetLid:1,
    singerGid:1,
    userinfo:[],//用户信息
    color:["#6666FF","#77ccf4","#209C38","#e54847","#716776","#E6cd32"],
    colorNum:0,
     volume: 0.2 //音量
  },
  mutations:{
    //改变音量
    changevolume(state,volume){
      state.volume+=volume;
    },
    //更换主题色
    themeColor(state){
      if(state.colorNum<5){
        state.colorNum++;
      }else{state.colorNum=0}
    },
    toIndex(state){
      state.topShow=false;
      state.rankShow=false;
      state.songSheetShow=false;
      state.singerShow=false;
    },
    // 显示rank组件
    toRank(state,rankRid){
      console.log(rankRid);
      state.topShow=true;
      state.rankShow=true;
      state.rankRid=rankRid;
    },
    // 显示songSheet组件
    toSongSheet(state,songSheetLid){
      console.log(songSheetLid);
      state.topShow=true;
      state.songSheetShow=true;
      state.songSheetLid=songSheetLid;
    },
    // 显示singer组件
    toSinger(state,singerGid){
      console.log(singerGid);
      state.topShow=true;
      state.singerShow=true;
      state.singerGid=singerGid;
    },
    updateVal(state,v){
      state.inputVal=v;
    },
    // 播放按钮的点击
    toggleplaying(state){
      state.playing=!state.playing;
    },
    //大小屏的切换
    togglefullScreen(state){
      state.fullScreen=!state.fullScreen;
      console.log("22"+state.fullScreen)
    },
    //整个歌单插入,从index播放
    setAllList(state,l){
      state.playList=l.list;
      state.currentIndex=l.index;
      state.playing=true;
      state.fullScreen=true;
      console.log(l);
    },
    //单首插入,从index播放song是歌曲对象
    setOneList(state,song){
      console.log(song,state.playList);
      if(state.playList.length==0){
        state.playList.push(song);
        state.currentIndex=state.playList.length-1;
        state.playing=true;
        state.fullScreen=true;
      }else{
        let playlist = state.playList.slice() // 赋值的是对象引用,state不允许外部修改，用slice()做个副本赋值
        let currentIndex = state.currentIndex
        //将歌曲插入当前歌曲的下一首
        currentIndex++;
        playlist.splice(currentIndex, 0, song);
        //判断列表中是否有这首歌
        var index=-1;
        for(var i=0;i<playlist.length;i++){
          if(playlist[i].sid===song.sid){//播放列表中已有该歌曲
            index=i;
            break;
          }
        }
        // 删除已存在的歌曲
        if(index!=-1){
          //歌曲在当前播放的前面
          if(currentIndex>index){
            playlist.splice(index,1);
            currentIndex--;
          }else{
            playlist.splice(index+1,1)
          }
        }
        state.fullScreen=true;
        state.playList=playlist;
        state.currentIndex=currentIndex;
        state.playing=true;
      }
    },
    //索引下一首
    setindexAdd(state){
      state.currentIndex++;
    },
    //修改索引值
    setcurrentIndex(state,index){
      state.currentIndex=index;
    },
    setplayingState(state,bool){
      state.playing=bool;
    },
    //删除一首
    delplaylistOne(state,song){
      let playlist = state.playList.slice();
      let currentIndex = state.currentIndex;
      var index=-1;
      for(var i=0;i<playlist.length;i++){
        if(playlist[i].sid===song.sid){//播放列表中已有该歌曲
          index=i;
          break;
        }
      }
      playlist.splice(index, 1) // 删除点击这条
      if (currentIndex > index || currentIndex === playlist.length) { // 如果删除的是播放前面的一条则需要把当前播放索引减一
        currentIndex--
      }
      state.playList=playlist;
      state.currentIndex=currentIndex;
      if (!playlist.length) { // 如果当前列表空了，关闭播放
        state.playing=false;
      } else {
        state.playing=true;
      }
    },
    delplaylistAll(state){
      state.currentIndex=-1;
      state.playList=[];
      state.playing=false;
    },
    //改变头像
    changeAvatar(state,avatar){
      state.userinfo[0].avatar=avatar;
    }
  },
  getters:{
    getvolume(state){
      return state.volume;
    },
    getColor(state){
      return state.color[state.colorNum];
    },
    getTopShow(state){
      return state.topShow;
    },
    getRankShow(state){
      return state.rankShow;
    },
    getRankRid(state){
      return state.rankRid;
    },
    getSongSheetShow(state){
      return state.songSheetShow;
    },
    getSongSheetLid(state){
      return state.songSheetLid;
    },
    getSingerShow(state){
      return state.singerShow;
    },
    getSingerGid(state){
      return state.singerGid;
    },
    getVal(state){
      return state.inputVal;
    },
    getplaying(state){
      return state.playing
    },
    getfullScreen(state){
      return state.fullScreen
    },
    getplayList(state){
      return state.playList
    },
    getcurrentIndex(state){
      return state.currentIndex
    },
    getcurrentSong(state){//获取当前歌曲
      return state.playList[state.currentIndex];
    }
  },
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
