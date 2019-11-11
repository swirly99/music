<template>
    <div>
        <!-- 搜索框 -->
        <div class="search-head"  :style="{backgroundColor:this.$store.getters.getColor}">
            <img @click="back" class="back" src="../../assets/back.png" alt="">
            <input v-model="Val" type="text" placeholder="搜索歌曲、歌手"  :style="{backgroundColor:this.$store.getters.getColor}">
            <img class="clean" @click="clean" src="../../assets/close.png" alt="">
        </div>
        <!-- 调用子组件 -->
        <search v-if="Val==''"></search>
        <search2 v-else></search2>
    </div>
</template>

<script>
//引入子组件
import search from '../search/search.vue'
import search2 from '../search/search2.vue'
export default {
    //注册子组件
    components:{
        "search":search,
        "search2":search2
    },
    data() {
        return {

        }
    },
    computed:{
        Val:{   //获取和设置vuex全局输入框变量
            get(){
                return this.$store.state.inputVal;
            },
            set(value){
                this.$store.commit("updateVal",value)
            }
        }
    },
    watch: {    //监听输入框变化进行搜索
        Val(newVal,oldVal){
            clearTimeout(this.timer);
            this.timer = setTimeout(()=>{
                //获取输入内容
                var $val = newVal;
                //创建url
                var url = "find";
                var obj = {val:$val};
                this.axios.get(url,{params:obj})
                .then(res=>{
                    this.$store.state.searchList = res;
                })
            },800)
        }
    },
    methods: {
        //返回首页
        back(){
            this.$router.push('/index');
        },
        //输入框发生改变时自动执行搜索功能

        //清除输入框内容
        clean(){
            this.Val="";
        },
        //搜索功能

    }
}
</script>

<style scoped>
    *{margin:0;padding:0;}
    .search-head{
        display: flex;
        justify-content: space-between;
        padding: 5px;
    }
    input{
        width:80%;
        border:0;
        outline: 0;
        color: #fff;
    }
    ::-webkit-input-placeholder{
        color: #eee;
        opacity: .8;
    }
    img{
        width:30px;height:30px;
    }
</style>