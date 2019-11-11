<template>
    <div class="login">
        <div class="head">
            <img @click="back" class="back" src="../../assets/back.png" alt="">
            <span @click="back">返回</span>
        </div>
        <div class="logo">
            <img src="../../assets/Clogo.png" alt="">
        </div>
        <mt-field label="用户名" placeholder="请输入用户名或手机号" v-model="uname" :attr="{autofocus:true}"></mt-field>
        <mt-field label="密码" placeholder="请输入密码" v-model="upwd" class="pwd" type="password"></mt-field>
        <mt-button  @click="login">登入</mt-button>
        <br>
        <router-link to="/reg" >
            <mt-button type="primary">注册</mt-button>
        </router-link>
    </div>
</template>
<script>
    export default{
        data(){
            return{
                uname:"",//输入用户名
                upwd:""//输入密码
            }
        },
        methods:{
            login(){
                //功能：完成用户登录功能
                // 1、获取用户输入的用户名
                var uname=this.uname
                // 2、获取用户输入的密码
                var upwd=this.upwd
                // 3、创建正则表达式 3~12位字母数字
                var reg=/^[a-z0-9]{3,12}$/i
                // 4、验证用户名
                if(!reg.test(uname)){
                // 5、验证不成功 提示信息 
                    this.$messagebox("用户名格式不正确")
                    return;
                }
                // 6、验证密码
                if(!reg.test(upwd)){
                // 7、验证不成功 提示信息
                    this.$messagebox("密码格式不正确")
                    return;
                }
                // 8、发送ajax请求
                var url="login";
                var obj={uname:uname,upwd:upwd};
                this.axios
                    .get(
                        url,
                        {params:obj})
                    .then(res=>{
                        if(res.data.length==1){
                            this.$toast({
                                message:"登录成功!",
                                className:"zindex"
                            })
                            this.$store.state.userinfo=res.data;
                            this.$router.push("/index");
                            
                        }else{
                            this.$messagebox("消息","用户名或密码错误");
                        }
                        });
                // 9、获取服务器返回结果
                // 10、登录失败   提示信息
                // 11、登录成功跳转/Product        
            },
            back(){
                this.$router.go(-1);
            }
        }
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
     padding-top: 57px;
 }
 .login>.logo>img{/*设置logo图片样式*/
     width: 50%;
 }
 .login>.mint-cell{/*设置输入框样式*/
    width: 76%;
    height: 27px;
    margin: 0 auto;
    border-radius: 20px;
    margin-top: 20px;
    background-color: rgba(255,255,255,0.5);
 }
 .login>.mint-cell.pwd{/*设置输入框样式*/
     margin-top: 15px;
 }
.login>>>.mint-field-core{/*设置输入框样式*/
     background-color:transparent;
     color:  rgb(6, 48, 82);;
 }
.login>.mint-button--default{/*设置登入按钮样式*/
    background-color: #fff;
    width: 70%;
    height: 45px;
    border-radius: 30px;
    color: #0069b4 ;

	bottom: -104px;
}
.login .mint-button--primary{/*设置注册按钮样式*/
    background-color:transparent;
    width: 70%;
    height: 45px;
    border-radius: 30px;
    color: #fff;
    border: 1px solid #ffffff;
    margin-top: 20px;

	bottom: -107px;
}
.login .mint-button::after {/*设置单击时按钮样式*/
    background-color: #0069b4;
    color: #fff;
}
</style>
