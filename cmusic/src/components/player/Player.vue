<template>
  <div v-if="this.$store.getters.getplayList.length>0">
    <transition name="normal">
      <div id="player" class="player" v-show="this.$store.getters.getfullScreen">
        <div class="background">
          <div class="filter"></div>
          <img :src="'http://127.0.0.1:4000/'+this.$store.getters.getcurrentSong.spic" width="100%" height="100%"/>
        </div>
        <div class="top">
          <div class="back">
            <!--返回按钮-->
            <i class="iconfont icon-zuojiantouxiangzuoxianxing" @click="changefullScreen" style="font-size:20px;color:#ddd;"></i>
          </div>
          <!--歌名和歌手-->
          <div class="song-info">
            <div class="title"><span>{{this.$store.getters.getcurrentSong.songName}}</span></div>
            <div class="singer"><span>{{this.$store.getters.getcurrentSong.gname}}</span></div>
          </div>
          <!--分享-->
          <div class="share">
            <i class="iconfont icon-fenxiang" @click="shareShow=!shareShow" style="font-size:20px;color:#ddd;"></i>
          </div>
        </div>
        <div class="middle">
          <div class="middle-pic" v-show="currentShow === 'cd'">
            <div class="cd-wrapper">
              <div class="cd" :class="cdCls">
                <img :src="'http://127.0.0.1:4000/'+this.$store.getters.getcurrentSong.spic" class="image"/>
              </div>
            </div>
          </div>
          <!--歌词部分-->
        </div>
        <div class="bottom">
          <div class="btop">
            <!--收藏这里要变换样式-->
            <div v-if="iscollect==false"><i @click="addcollect" style="font-size:20px;color:#ddd;" class="iconfont icon-shoucang"></i></div>
            <div v-else><i @click="removecollect" style="font-size:20px;color:#f46;" class="iconfont icon-shoucang1"></i></div>
            <div><i style="font-size:20px;color:#ddd;" class="iconfont icon-yinxiao"></i></div>
            <div><i style="font-size:20px;color:#ddd;" class="iconfont icon-jianshao" @click="downVolume"></i></div>
            <div><i style="font-size:20px;color:#ddd;" class="iconfont icon-zengjia" @click="upVolume"></i></div>
            <div><i style="font-size:20px;color:#ddd;" class="iconfont icon-more" @click="songInfoShow=!songInfoShow"></i>
            </div>
          </div>
          <div class="bmiddle">
            <!--进度条-->
            <div class="ltime"><span>{{format(currentTime)}}</span></div>      
            <div class="progress-bar-item">
              <!--进度条组件-->
              <progress-bar :percent="percent" @percentChange="percentChange"></progress-bar>
            </div>
            <div class="rtime"><span>{{format(totalTime)}}</span></div>       
          </div>
          <div class="bbottom">
            <div><i style="color:#fff;font-size:20px;" class="iconfont icon-liebiaoxunhuan"></i></div>
            <div><i style="color:#fff;font-size:20px;" class="iconfont icon-shangyishou1" @click.stop="prev"></i></div>
            <div><i style="color:#fff;font-size:40px;" class="iconfont" :class="changeImg" @click.stop="changeplaying"></i></div>
            <div><i style="color:#fff;font-size:20px;" class="iconfont icon-shangyishou" @click.stop="next"></i></div>
            <div><i style="color:#fff;font-size:20px;" class="iconfont icon-bofangliebiao" @click.stop="playListShow=!playListShow;"></i></div>
          </div>
        </div>
      </div>
    </transition>
    <!--迷你播放器-->
    <div class="mini-player" v-show="this.$store.getters.getfullScreen==false" @click.stop="changefullScreen" :style="{backgroundColor:this.$store.getters.getColor,opacity:.9}">
      <div class="icon">
        <img :class="cdCls" :src="'http://127.0.0.1:4000/'+this.$store.getters.getcurrentSong.spic" width="40" height="40">
      </div>
      <div class="text">
        <h2 class="name" style="opacity:1">{{this.$store.getters.getcurrentSong.songName}}</h2>
        <div class="desc" style="opacity:1">{{this.$store.getters.getcurrentSong.gname}}</div>
      </div>
      <div class="control">
        <i style="color:#000;font-size:30px;" class="iconfont" :class="changeImg" @click.stop="changeplaying"></i>
      </div>
      <div class="control">
        <i style="color:#000;font-size:30px;" class="iconfont icon-bofangliebiao" @click.stop="playListShow=!playListShow;"></i>
      </div>
    </div>
    <van-action-sheet v-model="shareShow" title="分享">
      <p>分享方式</p>
    </van-action-sheet>
    <van-action-sheet v-model="songInfoShow" title="歌曲信息">
      <p>这里是歌曲的信息</p>
    </van-action-sheet>
    <van-action-sheet v-model="playListShow">
      <playlist></playlist>
    </van-action-sheet>
    <!--音乐播放器-->
    <audio ref="audio" @ended="songEnd" autoplay @canplay="audioReady" @timeupdate="timeUpdate" @error="audioError" :src="'http://127.0.0.1:4000/'+this.$store.getters.getcurrentSong.song"></audio>
  </div>
</template>

<script>
import PlayList from './PlayList';
import ProgressBar from './ProgressBar';
export default {
  components: {
    "playlist": PlayList,
    "progress-bar": ProgressBar
  },
  data() {
    return {
      shareShow:false,
      songInfoShow:false,
      playListShow:false,
      currentShow:"cd",
      iscollect:false,
      songReadey: false,  //能否跳转下一首
      currentTime:"",//当前时间
      totalTime:"",//总时间
    }
  },
  created() {
    this.touch={}
  },
  methods: {
    changeplaying(){
      this.$store.commit("toggleplaying");
    },
    changefullScreen(){
      this.$store.commit("togglefullScreen");
    },
    addcollect() {//收藏功能
      if(this.$store.state.userinfo.length==0){
        console.log(1);
        this.$toast({
          message:"请先登录",
          className:"zindex"
        });
      }else{
        var sid = this.currentSong.sid;
        var uid = this.$store.state.userinfo[0].uid;
        var url = 'addcollect';
        var obj = {uid:uid,sid:sid};
        this.axios.get(url,{params:obj})
        .then(res=>{
          console.log(res);
          this.iscollect=true;
        });
      }
    },
    removecollect(){//取消收藏
      var sid = this.currentSong.sid;
      var uid = this.$store.state.userinfo[0].uid;
      var url = 'removecollect';
      var obj = {uid:uid,sid:sid};
      this.axios.get(url,{params:obj})
      .then(res=>{
        console.log(res);
        this.iscollect=false;
      });
    },
    //停止播放的切换
    changeplaying(){
      this.$store.commit("toggleplaying");
      if(this.$refs.audio.paused===true){
        this.$refs.audio.play();
      }else{
        this.$refs.audio.pause();
      }
    },
    //大小屏的切换
    changefullScreen(){
      console.log("play"+this.$store.getters.getfullScreen)
      this.$store.commit("togglefullScreen");
    },
    //格式化歌曲的时间
    format(interval) {
      interval = interval | 0;
      var min = (interval / 60) | 0;
      var sec = interval % 60;
      if (sec.toString().length === 1) {
        sec = `0${sec}`;
      }
      return `${min}:${sec}`;
    },
    //上一首
    prev(){
      if (!this.songReadey) {
        return;
      }
      if (this.$store.getters.getplayList.length === 1) {
        this.songLoop();
      } else {
        let index = this.$store.getters.getcurrentIndex - 1;
        if (index === -1) {
          index = this.$store.getters.getplayList.length - 1;
        }
        this.$store.commit("setcurrentIndex",index);
        this.$store.commit("setplayingState",true); // 点击上一曲后自动播放
      }
      this.songReadey = false;
    },
    //下一首
    next(){
      if (!this.songReadey) {
        return;
      }
      if (this.$store.getters.getplayList.length === 1) {
        this.songLoop();
      } else {
        let index = this.$store.getters.getcurrentIndex + 1;
        if (index === this.$store.getters.getplayList.length) {
          index = 0;
        }
        this.$store.commit("setcurrentIndex",index);
        this.$store.commit("setplayingState",true); // 点击下一曲后自动播放
      }
      this.songReadey = false;
    },
    // @canplay:浏览器能够开始播放指定的音频或视频
    audioReady(){
      this.songReadey=true;
      this.$refs.audio.volume=this.$store.getters.getvolume;
      this.currentTime=this.$refs.audio.currentTime;
      this.totalTime=this.$refs.audio.duration;
    },
    // @error:在音频或视频加载发生错误时触发
    audioError(){
      this.$toast({
        message: "当前歌曲加载失败,请尝试其他歌曲!",
        className: "zindex"
      });
      this.songReadey=true;
    },
    // @timeupdate:播放位置改变时触发[注意:播放和调整指示定位时都会触发]
    timeUpdate(e){
      this.currentTime=e.target.currentTime;
    },
    // @ended:音频或视频文件播放完毕后触发
    songEnd(){
      this.next();
    },
    //单曲循环(用于只有一首歌的时候)
    songLoop(){
      this.$refs.audio.currentTime = 0;
      this.$refs.audio.play();
    },
    /* 歌曲进度条触摸后改变歌曲播放进度 */
    percentChange(precent) {
      const currentTime = this.totalTime * precent;
      this.$refs.audio.currentTime = currentTime;
    },
    downVolume(){
      if(Math.round(this.$store.getters.getvolume*10)>0){
        this.$store.commit("changevolume",-0.1);
        this.$refs.audio.volume=this.$store.getters.getvolume;
        this.$toast({
          message: "当前音量："+Math.round(this.$store.getters.getvolume*10),
          className: "zindex"
        })
      }else{
        this.$toast({
          message: "当前音量已最小,无法降低!",
          className: "zindex"
        })
      }
    },
    upVolume(){
      if(Math.round(this.$store.getters.getvolume*10)<10){
        this.$store.commit("changevolume",0.1);
        this.$refs.audio.volume=this.$store.getters.getvolume;
        this.$toast({
          message: "当前音量："+Math.round(this.$store.getters.getvolume*10),
          className: "zindex"
        })
      }else{
        this.$toast({
          message: "当前音量已最大,无法提升!",
          className: "zindex"
        })
      }
    }
  },
  watch: {
    currentSong(){
        //查询用户是否收藏该歌曲
        var currentSong = this.$store.getters.getcurrentSong
        if(this.$store.state.userinfo.length==0){
          return
        }else{
          var sid = currentSong.sid;
          var uid = this.$store.state.userinfo[0].uid;
          var url = 'iscollect';
          var obj = {uid:uid,sid:sid};
          this.axios.get(url,{params:obj})
          .then(res=>{
            if(res.data.code==-1){
              this.iscollect=false;
            }else{
              this.iscollect=true;
            }
          });
        }
        var url2 = 'isrecently';
        this.axios.get(url2,{params:obj})
        .then(res=>{
          if(res.data.code==1){
            console.log(res.data);
            return;
          }else{
            var url3 = 'addrecently';
            //添加到最近播放
            this.axios.get(url3,{params:obj})
            .then(res=>{
              console.log(res);
            })
          }
        })
    }
  },
  computed: {
    cdCls () {
      return this.$store.getters.getplaying==true ? 'play' : 'play pause'
    },
    changeImg(){
      return this.$store.getters.getplaying==true ? 'icon-zanting' : 'icon-bofang'
    },
    currentSong:{
      get(){
        return this.$store.getters.getcurrentSong;
      }
    },
    percent(){
      return this.currentTime/this.totalTime;
    }
  },
}
</script>


<style scoped>
div /deep/ .van-action-sheet{
  height: 55%;
  z-index:9990 !important;
}
div /deep/ .van-overlay{
  z-index:9990 !important;
}
.player{
  background-image: linear-gradient(to bottom,#000 0%,#333 100%);
  position: fixed;
  width:100%;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  z-index: 9900;
}

.background{
  position: absolute;
  left: -100%;
  top: -120%;
  width: 300%;
  height: 300%;
  z-index: -1;
  opacity: 0.6;
  filter:blur(25px);
}

.top{
  display:flex;
  justify-content:space-around;
  align-items:center;
  width:100%;
  height:8%;
  padding:0.5rem 0;
}

.back{
  width:12.5%;
  text-align:center;
}

.song-info{
  display:flex;
  flex-direction:column;
  justify-content:space-around;
  align-items:center;
  text-align:center;
  width:75%;
}

.title{
  width: 100%;
  color:white;
  font-size:18px;
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
}

.singer{
  color:#aaa;
  font-size:14px;
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
}


.share{
  width:12.5%;
  text-align:center;
}

.icon-xiangzuo:before {
  content: "\e61d";
  color:white;
  font-size:20px;
}

.icon-fenxiang-1:before {
  content: "\e60b";
  color:white;
  font-size:20px;
}

.icon-xiangyou:before {
  content: "\e683";
  font-size:8px;
}

.middle{
  display: flex;
  align-items: center;
  width: 100%;
  white-space: nowrap;
  font-size: 0;
  height:67%;
}

.middle-pic{
  display:inline-block;
  vertical-align:top;
  position:relative;
  width:100%;
  height:0;
  padding-top:70%;
}

.cd-wrapper{
  position:absolute;
  left:15%;
  width:70%;
  top:0;
  height:100%;
}

.cd{
  width:100%;
  height:100%;
  box-sizing:border-box;
  background-image:linear-gradient(135deg,black 0%,rgba(40,40,40,.6) 40%,rgba(50,50,50,.1) 50%,rgba(40,40,40,.6) 60%,black 100%);
  border-radius:50%;
}

.cd.play{
  animation:rotate 20s linear infinite;
}

.cd.pause{
  animation-play-state:paused;
}

.cd .image{
  position:absolute;
  left:15%;
  top:15%;
  width:70%;
  height:70%;
  border-radius:50%;
}

@keyframes rotate {
  0% {
    transform: rotate(0);
  }
  100% {
    transform: rotate(360deg);
  }
}

.bottom{
  width:100%;
  height:25%;
  display:flex;
  flex-direction:column;
}

.btop{
  display:flex;
  justify-content:space-around;
  align-items:center;
  width:100%;
  height:30%;
}

.btop div{
  text-align:center;
  width:20%;
}

.btop div:first-child{
  margin-left:1rem;
}
.btop div:last-child{
  margin-right:1rem;
}


.bmiddle{
  display:flex;
  justify-content:space-around;
  align-items:center;
  width:100%;
  height:20%;
}

.bmiddle>div{
  width: 20%;
}

.ltime{
  font:12px Arial;
  color: #ccc;
  text-align: right;
}

.bmiddle .progress-bar-item{
  width: 70%;
  height: 50%;
  padding: 0 5%;
}

.rtime{
  font:12px Arial;
  color: #ccc;
  text-align: left;
}

.bbottom{
  display:flex;
  justify-content:space-around;
  align-items:center;
  width:100%;
  height:50%;
  padding-bottom:1rem;
}

.bbottom div{
  text-align:center;
  width:19%;
}

.bbottom div:nth-child(3){
  width:24%;
}

.bbottom div:first-child{
  margin-left:1rem;
}

.bbottom div:last-child{
  margin-right:1rem;
}

.icon-xiangzuo:before {
  content: "\e61d";
}

.icon-suijibofang:before {
  content: "\e6f1";
}

.icon-xiayigexiayishou:before {
  content: "\e7a5";
}



.mini-player{
  display:flex;
  align-items:center;
  justify-content:space-around;
  position:fixed;
  left:0;
  bottom:0;
  z-index:9990;
  width:100%;
  height:8%;
}

.icon{
  width:15%;
  text-align:right;
  padding-top:1%;
}

.icon img{
  border-radius:50%;
}

.icon img.play{
  animation:rotate 10s linear infinite;
}

.icon img.pause{
  animation-play-state:paused;
}

.text{
  display:flex;
  flex-direction:column;
  justify-content:center;
  width:65%;
  flex:1;
  overflow:hidden;
  padding-left:2%;
  text-align:left;
}

.text .name{
  margin-bottom:2px;
  line-height:14px;
  font-size:14px;
  color:#2e3030;
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
}

.text .desc{
  font-size:12px;
  color:#2e3030;
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
}

.control{
  flex: 0 0 30px;
  width: 10%;
  text-align:center;
  margin-right:2%;
}

/* transition动画 */
.normal-enter-active,
.normal-leave-active {
  transition: opacity 0.3s;
}
.normal-enter,.normal-leave-to {
  opacity: 0;
}

</style>