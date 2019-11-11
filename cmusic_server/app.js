//app.js 服务器端程序
//1:下载三个模块 
//  cors            完成跨域处理
//  express-session session对象,跟sessionStorage有区别
//  mysql           数据库驱动
//  express         web服务器
//下载命令在线  
//npm i cors express-session express  mysql
//2:将以上六个模块引入到当程序
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session"); 
const fs = require("fs");
const multer = require("multer");
//3:创建数据库连接池(池 提高效率)
var pool = mysql.createPool({
    host:"127.0.0.1", //数据库地址
    user:"root",      //数据库用户名
    password:"",      //数据库密码
    port:3306,      //数据库端口
    database:"cmusic",//库名
    connectionLimit:15//15连接
})
//4:配置跨域模块
//  允许哪个程序跨域访问服务器
//  脚手架:3001 允许3001访问我
//  服务器:4000 你
var server = express();
server.use(cors({
  //允许程序列表
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true//每次请求需要验证
}))
//5:配置session模块，在当前会话中保存用户等信息
server.use(session({
   secret:"128位字符串",//安全字符串
   resave:true,//请求时更新数据
   saveUninitialized:true//保存初始数据
}))
//6:配置项目静态目录 public
server.use(express.static("public"))
//7:创建express对象绑定4000端口
server.listen(4000);


//功能二:获取轮播图
server.get("/carousel",(req,res)=>{
//6:创建sql语句
var sql = "select carousel.cpic,song.sid,song.songName,song.song,singer.gname,song.spic from song inner join carousel on song.sid=carousel.sid inner join singer on song.gid=singer.gid;";
//7:执行sql语句
pool.query(sql,(err,result)=>{
  if(err)throw err;
  res.send({code:1,msg:"查询成功",data:result})
})
})

//测试：http://127.0.0.1:4000/carousel


//功能三:获取推荐歌单
server.get("/recommendList",(req,res)=>{
//6:创建sql语句
var sql = "SELECT linfo,listpic,lnum FROM songlist";
//7:执行sql语句
pool.query(sql,(err,result)=>{
  if(err)throw err;
  res.send({code:1,msg:"查询成功",data:result})
})
})

//测试：http://127.0.0.1:4000/recommendList


//功能四:获取推荐歌曲
server.get("/recommendMusicList",(req,res)=>{
//6:创建sql语句
var sql = "SELECT songName,spic,sid,gname,song FROM song,singer WHERE song.gid=singer.gid";
//7:执行sql语句
pool.query(sql,(err,result)=>{
  if(err)throw err;
  res.send({code:1,msg:"查询成功",data:result})
})
})

//测试：http://127.0.0.1:4000/recommendMusicList


//功能五:获取排行榜
server.get("/rank",(req,res)=>{
//6:创建sql语句
var sql = "SELECT rpic,sname0,sname1,sname2,uname0,uname1,uname2 FROM rank";
//7:执行sql语句
pool.query(sql,(err,result)=>{
  if(err)throw err;
  res.send({code:1,msg:"查询成功",data:result})
})
})


//功能六:获取详细排行榜
server.get("/rankdetail",(req,res)=>{
  var rid=req.query.rid;
//6:创建sql语句
var sql = "select rank.rtitle,rank.rpic,rankdetail.place,song.sid,song.songName,song.song,singer.gname,song.spic from song inner join rankdetail on song.sid=rankdetail.sid inner join singer on song.gid=singer.gid inner join rank on rankdetail.rid=rank.rid where rankdetail.rid=? order by rankdetail.place asc";
//7:执行sql语句
pool.query(sql,[rid],(err,result)=>{
  if(err)throw err;
  res.send({code:1,msg:"查询成功",data:result})
})
})


//功能七:获取歌手
server.get("/singers",(req,res)=>{
//6:创建sql语句
var sql = "SELECT gname,gpic,pinyin,gid FROM singer";
//7:执行sql语句
pool.query(sql,(err,result)=>{
  if(err)throw err;
  res.send({code:1,msg:"查询成功",data:result})
})
})

// 8、功能一:歌手详情列表
server.get("/detaSingerSong",(req,res)=>{
  var gid=req.query.gid;
  // (2)创建sql语句
  var sql = "SELECT sid,songName,spic,song,gname FROM song,singer WHERE song.gid=singer.gid AND singer.gid=?";
  // (3)执行sql语句
  pool.query(sql,[gid],(err,result)=>{
      // (4)获取执行结果
      if(err)throw err;
      res.send(result);
  })   
  })
server.get("/detaSingerSinger",(req,res)=>{
  var gid=req.query.gid;
  // (2)创建sql语句
  var sql = "SELECT * FROM singer where gid=?";
  // (3)执行sql语句
  pool.query(sql,[gid],(err,result)=>{
      // (4)获取执行结果
      if(err)throw err;
      res.send(result);
  })   
  })

// 8.5、功能一:排行详情列表
server.get("/detarankSong",(req,res)=>{
  // (2)创建sql语句
  var sql = "SELECT sid,songName,spic,song,gname FROM song,singer WHERE song.gid=singer.gid AND gid=5";
  // (3)执行sql语句
  pool.query(sql,(err,result)=>{
  // (4)获取执行结果
  if(err)throw err;
  res.send(result);
  }) 
})
server.get("/detarankrank",(req,res)=>{
  // (2)创建sql语句
  var sql = "SELECT * FROM rank where rid=1";
  // (3)执行sql语句
  pool.query(sql,(err,result)=>{
  // (4)获取执行结果
  if(err)throw err;
  res.send(result);
  }) 
})

// 9、歌单详情列表
server.get("/detaPackName",(req,res)=>{
  var lid=req.query.lid;
  var sql="SELECT * FROM songlist where lid=?";
  pool.query(sql,[lid],(err,result)=>{
      if(err)throw err;
      res.send(result);
  })
})
server.get("/detaPackSong",(req,res)=>{
  var lid=req.query.lid;
  // (2)创建sql语句
  var sql = "SELECT sid,songName,song,spic,gname FROM song,singer WHERE song.gid=singer.gid AND lid=?";
  // (3)执行sql语句
  pool.query(sql,[lid],(err,result)=>{
      // (4)获取执行结果
      if(err)throw err;
      res.send(result);
  })   
  })

//10.热门搜索
server.get("/hotSearch",(req,res)=>{
  //创建sql
  var sql = "select content from hot";
  //执行sql并将结果返回
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    res.send(result);
  })
})

//11.搜索记录
server.get("/search",(req,res)=>{
  //创建sql
  var sql = "select content from search";
  //执行sql并返回结果
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    res.send(result);
  })
})

//12.模糊查询
server.get("/find",(req,res)=>{
  //获取参数
  var val = req.query.val;
  //创建sql
  var sql = `SELECT sid,songName,spic,gname,song FROM song,singer WHERE singer.gid=song.gid AND ( songName LIKE '%${val}%' OR gname LIKE '%${val}%' ) `;
  //执行sql
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    res.send(result);
  })
})

//13.登入验证
server.get("/login",(req,res)=>{
  //(1)获取脚手架参数 uname upwd
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var phone = req.query.uname;
  //(2)创建sql语句查询
  var sql = "SELECT * FROM user WHERE uname=? AND upwd = ? or phone=? AND upwd = ?";
  //(3)执行sql语句
  pool.query(sql,[uname,upwd,phone,upwd],(err,result)=>{
   if(err)throw err;
   //(4)获取执行结果
   //(5)判断查询是否成功 result.length
   if(result.length==0){
     res.send({code:-1,msg:"用户名或密码有误"})
   }else{
     res.send(result)
   }
   //(6)将结果返回脚手架
  })
})
//14.注册
server.get("/reg",(req,res)=>{
  //(1)获取脚手架参数 uname upwd
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var userName = req.query.userName;
  var phone = req.query.phone;
  var avatar = "avatar/user.png"
  //(2)创建sql语句
  var sql = "INSERT INTO user(uname,upwd,userName,phone,avatar) VALUES (?,?,?,?,?)";
  //(3)执行sql语句
  pool.query(sql,[uname,upwd,userName,phone,avatar],(err,result)=>{
   if(err)throw err;
   //(4)获取执行结果
   //(5)判断
   if(result.affectedRows>0){
     res.send({code:1,msg:"注册成功"})
   }
   //(6)将结果返回脚手架
  })
})
//用户名重复查询
server.get("/uname",(req,res)=>{
  // (2)创建sql语句
  var uname = req.query.uname;
  var sql = "SELECT * FROM user WHERE uname=?";
  // (3)执行sql语句
  pool.query(sql,[uname],(err,result)=>{
    if(err)throw err;
      // (4)获取执行结果
      if(result.length>0){
        res.send({code:1,msg:"用户名已存在"})
      }
  })   
  })
  //手机重复查询
server.get("/phone",(req,res)=>{
  // (2)创建sql语句
  var phone = req.query.phone;
  var sql = "SELECT * FROM user WHERE phone=?";
  // (3)执行sql语句
  pool.query(sql,[phone],(err,result)=>{
    if(err)throw err;
      // (4)获取执行结果
      if(result.length>0){
        res.send({code:1,msg:"手机号已注册"})
      }
  })   
  })
// 15.用户最近播放查询
server.get("/recently",(req,res)=>{
  //获取参数
  var uid = req.query.uid;
  //创建sql语句
  var sql="select * from song inner join recently on song.sid=recently.sid and recently.uid=?";
  //执行sql语句
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    //获取结果
    res.send(result);
  })
})
// 16.用户收藏列表查询
server.get("/collect",(req,res)=>{
  //获取参数
  var uid = req.query.uid;
  //创建sql语句
  var sql="select * from song inner join collect on song.sid=collect.sid and collect.uid=?";
  //执行sql语句
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    //获取结果
    res.send(result);
})
})
// 17.用户是否收藏
server.get("/iscollect",(req,res)=>{
  //获取参数
  var uid = req.query.uid;
  var sid = req.query.sid;
  //创建sql语句
  var sql="select * from collect where uid=? and sid=?";
  //执行sql语句
  pool.query(sql,[uid,sid],(err,result)=>{
    if(err)throw err;
    //返回信息
    if(result.length<1){
      res.send({code:-1,msg:"未收藏"})
    }else{
      res.send({code:1,msg:"已收藏"})
    }
  })
})
// 18.添加收藏列表
server.get("/addcollect",(req,res)=>{
  //获取参数
  var uid = req.query.uid;
  var sid = req.query.sid;
  //创建sql语句
  var sql="insert into collect(uid,sid) values(?,?)";
  //执行sql语句
  pool.query(sql,[uid,sid],(err,result)=>{
    if(err)throw err;
    //返回信息
    res.send({code:1,msg:"添加成功"});
  })
})
// 19.取消收藏
server.get("/removecollect",(req,res)=>{
  //获取参数
  var uid = req.query.uid;
  var sid = req.query.sid;
  //创建sql语句
  var sql="delete from collect where uid=? and sid=?";
  //执行sql语句
  pool.query(sql,[uid,sid],(err,result)=>{
    if(err)throw err;
    //返回信息
    res.send({code:1,msg:"删除成功"});
  })
})
// 20.是否在最近播放
server.get("/isrecently",(req,res)=>{
  //获取参数
  var uid = req.query.uid;
  var sid = req.query.sid;
  //创建sql语句
  var sql="select * from recently where uid=? and sid=?";
  //执行sql语句
  pool.query(sql,[uid,sid],(err,result)=>{
    if(err)throw err;
    //返回信息
    if(result.length<1){
      res.send({code:-1,msg:"未播放"})
    }else{
      res.send({code:1,msg:"已播放"})
    }
  })
})
// 21.添加最近播放
server.get("/addrecently",(req,res)=>{
  //获取参数
  var uid = req.query.uid;
  var sid = req.query.sid;
  //创建sql语句
  var sql="insert into recently(uid,sid) values(?,?)";
  //执行sql语句
  pool.query(sql,[uid,sid],(err,result)=>{
    if(err)throw err;
    //返回信息
    if(result.affectedRows>0){
      res.send({code:1,msg:'添加到最近播放'})
    }
  })
})

//修改头像(文件上传)
var uploadFolder = "./public/avatar";
// 通过 filename 属性定制
var storage = multer.diskStorage({
  //目标:目录
  destination: function (req, file, cb) {
      cb(null, uploadFolder);    // 保存的路径，备注：需要自己创建
  },
  filename: function (req, file, cb) {
      // 将保存文件名设置为 字段名 + 时间戳，比如 logo-1478521468943
      var idx = file.originalname.lastIndexOf('.');
      var suff = file.originalname.substring(idx);
      cb(null, file.fieldname + '-' + Date.now()+suff);
  }
});

// 通过 storage 选项来对 上传行为 进行定制化
var upload = multer({ storage: storage })

// 单图上传
server.post('/upload', upload.single('avatar'), function(req, res, next){
  // console.log(req.body.uid)
  var file = req.file;
  var uid=req.body.uid;
  // console.log(file);
  var sql = "UPDATE user SET avatar=? WHERE uid=?"
  pool.query(sql,["avatar/"+file.filename,uid],(err,result)=>{
    if(err)throw err;
    var sql = "SELECT avatar FROM user WHERE uid=?";
    pool.query(sql,[uid], (err,result)=>{
      if(err) throw err;
      res.send({code:1,msg:"上传成功",data:result})
    })
  })
});

server.get('/form', function(req, res, next){
  var form = fs.readFileSync('./form.html', {encoding: 'utf8'});
  res.send(form);
});
