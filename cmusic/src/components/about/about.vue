<template>
    <div class="login">
        <div class="head">
            <img @click="back" class="back" src="../../assets/back.png" alt="">
            <span @click="back">返回</span>
        </div>
        <div class="logo">
            <img src="../../assets/Clogo.png" alt="">
        </div>
        <div class="edition">
            当前版本 V1.0.0.11
        </div>
    </div>
</template>
<script>
    export default{
        data() {
            return {
                
            }
        },
        methods: {
            //返回
            back(){
                this.$router.go(-1);
            },
        },
    }
</script>
<style scoped>
 .login{/*设置背景*/
    background:url(../../assets/bg.png);
    width: 100%;
    background-attachment:fixed;
    height: 100%;
    position: fixed;
    z-index: -10;
    background-repeat: no-repeat;
    background-position: 0px 0px;
    background-size: 100% 100%;
    text-align:center;
 }
 .login>.head{/*返回按钮样式 */
    display: flex;
    justify-content: start;
    color:#fff;
 }
 .login>.head img{
     width:30px;height:30px;
 }
 .login>.head span{
     margin-top:4px;
 }
 .login>.logo{/*设置logo样式*/
     padding-top: 128px;
 }
 .login>.logo>img{/*设置logo图片样式*/
     width: 50%;
 }
 .login>.edition{
     color:#fff;
     font-size:16px;
 }
</style>
