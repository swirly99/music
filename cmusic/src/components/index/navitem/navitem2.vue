<template>
    <div class="container">
        <!-- 榜单 -->
        <ul class="ranking-list">
            <li class="ranking-item" v-for="(item,i) of rankingList" :key="i" @click="toRank(i+1)">
                <!-- 榜单左侧图片 -->
                <img :src="`http://127.0.0.1:4000/${item.rpic}`"/>
                <ul class="ranking-music">
                    <!-- 榜单右侧：歌曲-歌手 -->
                    <li><p>1.{{item.sname0}} - {{item.uname0}}</p></li>
                    <li><p>2.{{item.sname1}} - {{item.uname1}}</p></li>
                    <li><p>3.{{item.sname2}} - {{item.uname2}}</p></li>
                </ul>
            </li>
        </ul>
    </div>
</template>
<script>
export default {
    data(){
        return{
            rankingList:[]
        }
    },
    created() {
        //获取排行榜
        this.axios.get("/rank")
        .then(res=>{this.rankingList=res.data.data});
    },
    methods: {
        toRank($i){
            this.$store.commit("toRank",$i);
        }
    },
}
</script>
<style scoped>
    .ranking-list{
        padding:0 10px;
        display:flex;
        align-items:center;
        flex-wrap:wrap;
    }
    .ranking-list img{width:100px;}
    .ranking-item{
        display:flex;
        padding: 3px 0;
        border-bottom: 1px solid #e4e4e4;
        justify-content:left;
        width:100%;
    }
    .ranking-music{
        display:flex;
        flex-direction: column;
        justify-content: center;
    }
    .ranking-music>li p{
        font-size:12px;
        padding:0 20px;
        overflow: hidden;
        text-overflow:ellipsis;
        white-space: nowrap;
        line-height:24px;
        text-align:left;
    }
    @media screen and (max-width:576px){
        .ranking-music>li p{max-width:248px;}
    }
</style>