<template>
    <div class="reg">
        <div class="head">
            <img @click="back" class="back" src="../../assets/back.png" alt="">
            <span @click="back">返回</span>
        </div>
        <div class="logo">
            <img src="../../assets/Clogo.png" alt="">
        </div>
        <div class="regIpt">
            <mt-field label="用户名" placeholder="请输入用户名" v-model="uname" :attr="{autofocus:true}" @blur.native.capture="checkName"></mt-field>
            <mt-field label="密码" placeholder="请输入密码" v-model="upwd" class="pwd" type="password"></mt-field>
            <mt-field label="确认密码" placeholder="再次输入密码" v-model="cpwd" class="cpwd" type="password"></mt-field>
            <mt-field label="姓名" placeholder="请输入姓名" v-model="userName"></mt-field>
            <mt-field label="手机号" placeholder="请输入手机号" type="tel" v-model="phone" @blur.native.capture="checkPhone"></mt-field>
        </div>
        <mt-button type="primary" @click="reg">注册</mt-button>
    </div>
</template>
<script>
    export default{
        data(){
            return{
                uname:"",//输入用户名
                upwd:"",//输入密码
                cpwd:"",//确认密码
                userName:"",//输入姓名
                phone:"",//输入手机号
                regTrue:true
            }
        },
        methods:{
            reg(){
                if(this.regTrue==true){
                    var uname=this.uname
                    var upwd=this.upwd
                    var cpwd=this.cpwd
                    var userName=this.userName
                    var phone=this.phone
                    var reg=/^[a-z0-9]{3,12}$/i//用户名 密码
                    var nreg=/^[a-z]{3,10}$/i //姓名
                    var preg=/^1[0-9]{10}$///手机号
                    if(!reg.test(uname)){
                        this.$messagebox("用户名格式不正确（需3~12位数字或字母）")
                        this.regTrue=false;
                        return;
                    }
                    if(!reg.test(upwd)){
                        this.regTrue=false;
                        this.$messagebox("密码格式不正确（需3~12位数字或字母）")
                        return;
                    }
                    if(cpwd!=upwd){
                        this.$messagebox("两次输入密码不同")
                        this.regTrue=false;
                        return;
                    }
                    if(!nreg.test(userName)){
                        this.$messagebox("姓名格式不正确（需3~10位字母)")
                        this.regTrue=false;
                        return;
                    }
                    if(!preg.test(phone)){
                        this.$messagebox("手机号格式不正确（需11位数字)")
                        this.regTrue=false;
                        return;
                    }
                    // 8、发送ajax请求
                    var url="reg";
                    var obj={uname,upwd,userName,phone};
                    this.axios
                        .get(
                            url,
                            {params:obj})
                        .then(res=>{
                            if(res.data.code>0){
                                this.$messagebox("消息","注册成功").then(action => {
                                    this.$router.push("/login");
                                    })
                                }
                        });
                    // 9、获取服务器返回结果
                    // 10、登录失败   提示信息
                    // 11、登录成功跳转/Product  
                }else{
                    this.$messagebox("消息","注册失败，请重新输入");
                }
            },
            checkName(){
                var uname=this.uname;
                var url="uname";
                var obj={uname};
                this.axios
                    .get(url,{params:obj})
                    .then(res=>{
                        if(res.data.code>0){
                            this.$messagebox("消息","用户名已存在");
                            this.regTrue=false;
                            return;
                        }
                    })  
            },
            checkPhone(){
                var regTrue=this.regTrue;
                var phone=this.phone;
                var url="phone";
                var obj={phone};
                this.axios
                    .get(url,{params:obj})
                    .then(res=>{
                        if(res.data.code>0){
                            this.$messagebox("消息","该手机号已注册");
                                regTrue=false;
                                return;
                        }
                    })  
            },
            back(){
                this.$router.go(-1);
            }
        },
        watch: {
            uname(){this.regTrue=true;},
            upwd(){this.regTrue=true;},
            cpwd(){this.regTrue=true;},
            userName(){this.regTrue=true;},
            phone(){this.regTrue=true;}
        },
    }
</script>
<style scoped>
 .reg{/*设置背景*/
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
.reg>.head{/*返回按钮样式 */
    display: flex;
    justify-content: start;
    color:#fff;
 }
 .reg>.head img{
     width:30px;height:30px;
 }
 .reg>.head span{
     margin-top:4px;
 }
 .reg>.logo{/*设置logo样式*/
     padding-top: 57px;
 }
 .reg>.logo>img{/*设置logo图片样式*/
     width: 50%;
 }
 .reg>.regIpt{/*设置输入框样式——外div*/
    margin-top: -10px;
 }
 .reg>.regIpt>.mint-cell{/*设置输入框样式*/
    width: 76%;
    height: 27px;
    margin: 0 auto;
    border-radius: 20px;
    margin-top: 10px;
    background-color: rgba(255,255,255,0.5);
 }
.reg>.regIpt>>>.mint-field-core{/*设置输入框样式*/
     background-color:transparent;
     color:  rgb(6, 48, 82);;
 }
.reg .mint-button--primary{/*设置注册按钮样式*/
    background-color:transparent;
    width: 70%;
    height: 45px;
    border-radius: 30px;
    color: #fff;
    border: 1px solid #ffffff;
    margin-top: 20px;
    position: relative;;
	bottom: -10px;
}
.reg>.mint-button::after {/*设置单击时按钮样式*/
    background-color: #0069b4;
    color: #fff;
}
</style>
