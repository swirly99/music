<template>
    <div class="container">
        <!-- 歌手列表 -->
        <van-index-bar :sticky-offset-top=96 :highlight-color="this.$store.getters.getColor" :sticky="false" :index-list="indexList">
            <div v-for="(item,i) of indexList" :key="i">
                <van-index-anchor :index=item />
                <div v-for="(item2,i2) of singers[i]" :key="i2" @click="toSinger(item2.gid)">
                    <div class="singer">
                        <!-- 歌手图片 -->
                        <img :src="`http://127.0.0.1:4000/${item2.gpic}`"/>
                        <!-- 歌手名字 -->
                        <span>{{item2.gname}}</span>
                    </div>
                </div>
            </div>
        </van-index-bar>
    </div>
</template>
<script>
export default {
    data(){
        return{
            indexList:["A","B","C","D","E","F","G","H","I","J","K","L","M","P","Q","R","S","T","W","X","Y","Z"],
            singers:[]
        }
    },
    created() {
        this.axios.get("/singers")
        .then(res=>{
            var data=res.data.data;
            for(var i=0;i<this.indexList.length;i++){
                var singer=[];
                for(var j=0;j<data.length;j++){
                    if(this.indexList[i]==data[j].pinyin){
                        var str=`{"gname":"${data[j].gname}","gpic":"${data[j].gpic}","gid":"${data[j].gid}"}`;
                        singer.push(JSON.parse(str));
                    }
                }
                if(singer.length!=0){this.singers.push(singer);}
            }
            });
    },
    methods: {
        toSinger($i){
            this.$store.commit("toSinger",$i);
        }
    },
}
</script>
<style scoped>
    .container /deep/ .van-index-anchor{
        height: 20px;
        line-height: 20px;
        text-align:left;
        font-size: 11px;
        color: #fff;
        background: rgba(0,0,0,.1);
    }
    .singer{
        display:flex;
        align-items: center;
        padding: 5px 0;
        margin: 0 5px;
        border-bottom: 1px solid #e4e4e4;
    }
    .singer>img{
        width: 50px;height: 50px;
        border-radius: 3px;
    }
    .singer>span{
        padding:22px 191px 22px 20px;
        color: #2e3030;
        font-size: 14px;
    }
    .container /deep/ .van-index-bar__sidebar{top:58%;}
    .container /deep/ .van-index-bar__index{
        padding-bottom:12px;
        font-weight:600;
    }
</style>