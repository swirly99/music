<template>
    <div>
        <!-- 热门搜索 -->
        <div class="hot">
            <div class="hot-search">热门搜索</div>
            <div @click="replace" class="content">
                <span v-for="(item,i) of hotsearch" :key="i">{{item.content}}</span>
            </div>
        </div>
        <!-- 搜索历史 -->
        <div class="del">
            <div class="del-history" v-show="bool=='true'">
                <span>搜索历史</span>
                <img @click="delAll" src="../../assets/delete.png" alt="">
            </div>
            <div class="content" v-for="(item,index) of history">
                <div>
                    <span>{{item.content}}</span>
                    <a @click="del(index)">×</a>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            history:[],     //搜索历史记录
            hotsearch:[],
            bool:"true"
        }
    },
    created(){
        //页面创建时获取热门搜索,搜索记录
        // 1.创建url
        var url="hotSearch";
        var url2="search";
        // 2.发送ajax请求
        this.axios.get(url)
        .then(res=>{
        // 3.将服务器返回得数据保存hotsearch
            var hots = res.data;
            this.hotsearch = hots;
        })
        //搜索记录查询
        this.axios.get(url2)
        .then(res=>{
            var search = res.data;
            this.history = search;
            if(this.history.length==0){
                this.bool=false;
            }
        })
    },
    methods: {
        //标签替换文本框内容
        replace(e){
            if(e.target.nodeName=="SPAN"){
            var str = e.target.innerHTML;
            this.$store.state.inputVal=str;
            }
        },
        //单个删除搜索记录
        del(index){
            this.history.splice(index,1);
            //如果删完记录了
            if(this.history.length<1){
                this.bool=false;
            }
        },
        //删除所有记录
        delAll(){
            this.history.splice(0);
            //并且隐藏搜索历史
            this.bool=false;
        },
    },
}
</script>

<style scoped>
    *{margin:0;padding:0;}
    .hot{
        width:90%;
        margin:0 auto;
    }
    .hot .hot-search{
        font-size: 14px;
        color:#999;
        margin-top:20px;
        margin-bottom:10px;
        margin-left:5px;
        text-align:left;
    }
    .hot .content{
        display: flex;
        justify-content: start;
        flex-wrap: wrap;
        overflow: hidden;
    }
    .hot .content span{
        padding:4px;
        border:1px solid #999;
        border-radius: 5px;
        margin:5px;
    }
    .del{
        width:90%;
        margin:0 auto;
    }
    .del .del-history{
        font-size: 14px;
        color:#999;
        margin:20px 0 0 5px;
        display: flex;
        justify-content: space-between;
    }
    .del .del-history img{
        width:25px;height:25px;
    }
    .del .content div{
        display: flex;
        justify-content: space-between;
        margin:10px 0 0 5px;
    }
    .del .content div a{
        margin-right:7px;
    }
</style>