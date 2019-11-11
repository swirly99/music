<template>
    <div class="SongSheet">
        <div class="songList">
            <div class="palyAll" @click="toPlayer(0)">
                <p class="playBtn">
                    <img src="../../assets/play.png" alt="">
                    <span>播放全部<span class="miniFont">(共{{list.length}}首)</span></span>
                </p>
            </div>
            <div class="listAll">
                <div class="list" v-for="(item,index) of list" :key="index" @click="toPlayer(index)">
                    <div class="number"><p>{{index+1}}</p></div>
                    <div class="content">
                        <p class="songName">{{item.songName}}</p>
                        <p class="singerName">{{item.song.slice(4,).split("-")[0]}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
        export default {
            data(){
                return{
                    list:[]
                }
            },
            created() {
                var uid=this.$route.params.uid;
                //发送axios请求查询用户最近播放
                var url='recently';
                var obj={uid:uid};
                this.axios.get(url,{params:obj})
                .then(res=>{
                    this.list=res.data;
                })
                .catch(err=>{
                    console.log(err);
                })
            },
            methods: {
                toPlayer($index){
                     this.$store.commit("setAllList",{list:this.list,index:$index})
                },
            },
        }
</script>
<style scoped>
    .SongSheet>.songList>.palyAll{/*设置播放全部的div样式*/
        width: 100%;
        height: 36px;
        background: #FFF;
        border-bottom: 1px solid #ccc;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        margin-top: -15px;
        position: fixed;
    }
    .SongSheet>.songList>.palyAll>p.playBtn{/*设置播放全部div中内容div的样式*/
        color: #222;
        text-align: left;
        padding-left: 20px;
        font-size: 16px;
        line-height: 36px;
    }
    .SongSheet>.songList>.palyAll>p.playBtn>img{/*设置播放全部div中播放图片样式*/
       vertical-align: middle;
       margin-right: 10px;
       margin-bottom: 4px;
       width: 7%;
    }
    .SongSheet>.songList>.palyAll>p.playBtn>span>span.miniFont{/*设置播放全部div中小字体的样式——共xx首*/
       font-size: 14px;
       color: #aaa;
       margin-left: 3px;
    }
    .SongSheet>.songList>.listAll{/*设置整个列表距离页面顶部的距离*/
        padding-top: 21px;
    }
    .SongSheet>.songList>.listAll>.list{/*设置歌曲列表的样式*/
        display: flex;
        width: 100%;
        height: 55px;
        background: #fff;
        border-bottom: 1px solid #ccc;
    }
    .SongSheet>.songList>.listAll>.list>.number>p{/*设置单个歌曲列表中序号的样式*/
        line-height: 55px;
        padding: 0 20px;
        color: #666;
        width: 23px;
    }
    .SongSheet>.songList>.listAll>.list>.content{/*设置单个歌曲列表中内容的样式——歌手加歌曲名*/
        text-align: left;
        margin-top: 8px;
    }
    .SongSheet>.songList>.listAll>.list>.content>p.songName{/*设置单个歌曲列表中歌手的样式*/
        color: #222;
        font-size: 16px;
    }
    .SongSheet>.songList>.listAll>.list>.content>p.singerName{/*设置单个歌曲列表中歌曲名称的样式*/
        color: #aaa;
        font-size: 12px;
    }
</style>

