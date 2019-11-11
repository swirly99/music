<template>
    <div>
        <!-- 头部立即登录与信息显示 -->
        <div class="head" :style="{backgroundColor:this.$store.getters.getColor}">
            <!-- 信息显示 -->
            <div v-if="user.length>=1" v-for="(item,i) of user" :key="i" class="user_info">
                <img :src="'http://127.0.0.1:4000/'+item.avatar" alt="">
                <input type="file" @change="uploadFile($event)" class="change-avater" ref="input">
                <div class="user_name">{{item.userName}}</div>
                <div class="user_phone">{{item.phone.replace(/(\d{3})\d{4}(\d{4})/,"$1****$2")}}</div>
            </div>
            <!-- 立即登录 -->
            <div v-if="user.length==0" class="login">
                <img src="../../assets/user.png" alt="">
                <router-link to="/login">
                    <div>立即登录</div>
                </router-link>
            </div>
        </div>
        <!-- 功能列表 -->
        <div class="body">
            <ul class="list">
                <li @click="recently()"><img src="../../assets/played.png" alt="" :style="{backgroundColor:this.$store.getters.getColor,borderBottomColor:this.$store.getters.getColor}"><span>最近播放</span></li>
                <li @click="collection"><img src="../../assets/collect.png" alt="" :style="{backgroundColor:this.$store.getters.getColor,borderBottomColor:this.$store.getters.getColor}"><span>收藏列表</span></li>
                <li @click="$store.commit('themeColor')"><img src="../../assets/theme.png" alt="" :style="{backgroundColor:this.$store.getters.getColor,borderBottomColor:this.$store.getters.getColor}"><span>更换主题</span></li>
                <li @click="about"><img src="../../assets/about.png" alt="" :style="{backgroundColor:this.$store.getters.getColor,borderBottomColor:this.$store.getters.getColor}"><span>关于我们</span></li>
                <li @click="quit"><img src="../../assets/quit.png" alt="" :style="{backgroundColor:this.$store.getters.getColor,borderBottomColor:this.$store.getters.getColor}"><span>退出登录</span></li>
            </ul>

        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            user:[],
            files:[],
        }
    },
    created() {
        this.user=this.$store.state.userinfo;
    },
    methods: {
        recently(){
            if(this.user.length==0){
                this.$messagebox("你还未登录！");
            }else{
                this.$router.push({name:"CollectionLately",params:{uid:this.user[0].uid,$i:"tab-container2"}})
            }
        },
        collection(){
            if(this.user.length==0){
                this.$messagebox("你还未登录！");
            }else{
                this.$router.push({name:"CollectionLately",params:{uid:this.user[0].uid}})
            }
        },
        about(){
            this.$router.push('/about');
        },
        quit(){
            if(this.user.length==0){
                this.$messagebox("你还未登录！");
            }else{
                this.$messagebox.confirm("确定要退出吗？").then(action=>{
                this.user=this.$store.state.userinfo=[];
            }).catch(err=>{

            });
            }
        },
        uploadFile(){
            var item = {
                name: this.$refs.input[0].files[0].name,
                uploadPercentage: 0
            };
            this.files.push(item);
            var fd = new FormData();
            fd.append('avatar', this.$refs.input[0].files[0]);
            fd.append('uid', this.$store.state.userinfo[0].uid);
            // 发送请求
            this.axios.post("/upload",fd,{
                onUploadProgress: (progressEvent) => {
                    //这里要用箭头函数
                    //不然这个this的指向会有问题
                    this.rate=parseInt((progressEvent.loaded/progressEvent.total)*100);
                }
            }).then(res=>{
                let url = res.data.data[0].avatar
                this.$store.commit("changeAvatar",url);
            });
        }
    },
}
</script>

<style scoped>
        /* 头部登录与用户信息 */
        .head{
            width: 100%;height:200px;
        }
        .head::before{
            display: table;
            content: "";
        }
        .head>.user_info,.head>.login{
            margin:30px auto;
            text-align: center;
        }
        .head>.user_info>img,.head>.login>img{
            width:80px;height:80px;
            border-radius: 50%;
        }
        .head>.user_info>div,.head>.login div{
            margin-top:10px;
            color:#383838;
        }
        .head>.login div{
            text-decoration: underline;
        }
        /* 功能列表样式 */
        .body{
            width:100%;
        }
        .list{
            list-style: none;
            margin-top:25px;
        }
        .list>li{
            height:60px;
            color:#383838;
            line-height: 30px;
            position: relative;
            border-bottom-width:1px;
            border-bottom-style:solid;
        }
        .list>li img{
            position: absolute;
            width:30px;height:30px;
            top:15px;;left:20px;
            border-radius:5px;
        }
        .list>li span{
            line-height: 60px;
            margin-left:65px;
        }

        .change-avater{
            position: absolute;
            top: 30px;
            left: 110px;
            height: 80px;
            width: 80px;
            display: block;
            outline: 0;
            border-radius: 50%;
            opacity: 0;
        }
</style>