#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS cmusic;
#创建数据库，设置编码
CREATE DATABASE cmusic CHARSET=UTF8;
#进入创建的数据库
USE cmusic;

#创建数据库表
#用户表
CREATE TABLE user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(20) NOT NULL,
  upwd VARCHAR(20) NOT NULL,
  userName VARCHAR(20),
  phone VARCHAR(11),
  avatar VARCHAR(255)
);

#轮播图表
CREATE TABLE carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  sid INT,
  cpic VARCHAR(255) 
);

INSERT INTO carousel VALUES
(null,1,"img/carousel/carousel1.jpg"),
(null,2,"img/carousel/carousel2.jpg"),
(null,3,"img/carousel/carousel3.jpg"),
(null,4,"img/carousel/carousel4.jpg");


#歌单表
CREATE TABLE songlist(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  linfo VARCHAR(255),
  listpic VARCHAR(255),
  lnum INT
);

INSERT INTO songlist VALUES
(null,"[华语速爆新歌] 最新华语音乐推荐","img/songlist/songlist1.jpg",62052),
(null,"学习太枯燥，为它加点“糖”","img/songlist/songlist2.jpg",18),
(null,"世界它太小，小到容不下爱人的心","img/songlist/songlist3.jpg",246),
(null,"经典老歌，久听不厌","img/songlist/songlist4.jpg",13027),
(null,"评论过万的英文歌与潜力股","img/songlist/songlist5.jpg",8398),
(null,"百首良曲|刷（抄）作业必备燃曲","img/songlist/songlist6.jpg",11688),
(null,"怀旧 | 闲暇细数90后的回忆杀","img/songlist/songlist7.jpg",7155),
(null,"『好听的翻唱Cover集』","img/songlist/songlist8.jpg",12424),
(null,"你会爱上这个流行歌单","img/songlist/songlist9.jpg",3147),
(null,"精选 | 嗨 伙计 要来首10w+吗?","img/songlist/songlist10.jpg",5761),
(null,"网络流行歌曲2019♡","img/songlist/songlist11.jpg",4337),
(null,"华语百首 | 回忆伤人无声，唱不尽世间遗憾","img/songlist/songlist12.jpg",13566),
(null,"[旋律控] 超级好听的良曲","img/songlist/songlist13.jpg",30652),
(null,"确认过旋律，是独处一人的模式","img/songlist/songlist14.jpg",356),
(null,"前奏跪 × 开口脆","img/songlist/songlist15.jpg",5281);


#排行表
CREATE TABLE rank(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  rtitle VARCHAR(255),
  rpic VARCHAR(255),
  sname0 VARCHAR(255),
  uname0 VARCHAR(255),
  sname1 VARCHAR(255),
  uname1 VARCHAR(255),
  sname2 VARCHAR(255),
  uname2 VARCHAR(255)
);

INSERT INTO rank VALUES
(null,"云音乐国电榜","img/rank/rank1.jpg","攀登 (Live)","潘玮柏,G.E.M.邓紫棋,艾热","不得不爱","潘玮柏,弦子","后继者","任然"),
(null,"云音乐说唱榜","img/rank/rank2.jpg","野狼disco","宝石gem","庆功酒","福克斯,隆历奇","飞行随笔","福克斯,Ice Paper,隆历奇"),
(null,"云音乐新歌榜","img/rank/rank3.jpg"," Walk On Water","G.E.M.邓紫棋","芒种(南山之南)","黄诗扶","脱焦","秦昊"),
(null,"云音乐ACG音乐榜","img/rank/rank4.jpg","Lemon","米津玄師","LOSER","米津玄師","空空如也","任然"),
(null,"网易原创歌曲榜","img/rank/rank5.jpg","芒种(南山之南)","黄诗扶","脱焦","秦昊","家国天下","颜人中"),
(null,"云音乐热歌榜","img/rank/rank6.jpg","背对背拥抱","林俊杰","齐天","华晨宇","春夏秋冬","张国荣"),
(null,"云音乐飙升榜","img/rank/rank7.jpg","来自天堂的魔鬼","G.E.M.邓紫棋","All Falls Down","Alan Walker,Noah Cyrus,Digital Farm Animals","Move Your Body","Sia,Alan Walker");


#详细排行表
CREATE TABLE rankdetail(
  id INT PRIMARY KEY AUTO_INCREMENT,
  sid INT,
  rid INT ,
  place INT
);

INSERT INTO rankdetail VALUES
(null,40,1,1),
(null,41,1,2),
(null,42,1,3),
(null,43,1,4),
(null,44,1,5),
(null,45,1,6),
(null,46,1,7),
(null,47,1,8),
(null,48,1,9),
(null,49,1,10),
(null,50,1,11),
(null,51,1,12),
(null,52,1,13),
(null,9,2,1),
(null,24,2,2),
(null,25,2,3),
(null,34,2,4),
(null,35,2,5),
(null,40,2,6),
(null,58,2,7),
(null,1,3,1),
(null,2,3,2),
(null,3,3,3),
(null,4,3,4),
(null,9,3,5),
(null,18,3,6),
(null,19,3,7),
(null,20,3,8),
(null,21,3,9),
(null,32,3,10),
(null,34,3,11),
(null,38,4,1),
(null,39,4,2),
(null,43,4,3),
(null,30,4,4),
(null,31,4,5),
(null,32,4,6),
(null,20,4,7),
(null,21,4,8),
(null,17,4,9),
(null,2,5,1),
(null,3,5,2),
(null,4,5,3),
(null,16,5,4),
(null,18,5,5),
(null,20,5,6),
(null,21,5,7),
(null,24,5,8),
(null,69,6,1),
(null,68,6,2),
(null,60,6,3),
(null,56,6,4),
(null,57,6,5),
(null,54,6,6),
(null,38,6,7),
(null,36,6,8),
(null,53,6,9),
(null,31,6,10),
(null,41,6,11),
(null,26,6,12),
(null,27,7,1),
(null,5,7,2),
(null,6,7,3),
(null,1,7,4),
(null,48,7,5),
(null,67,7,6),
(null,66,7,7),
(null,65,7,8),
(null,64,7,9),
(null,63,7,10),
(null,53,7,11),
(null,51,7,12),
(null,50,7,13),
(null,57,7,14),
(null,42,7,15);



#歌曲表
CREATE TABLE song(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  songName VARCHAR(100),
  gid INT,
  spic VARCHAR(255),
  lyric VARCHAR(255),
  song VARCHAR(255),
  lid INT
);

INSERT INTO song VALUES
(null,"Walk On Water",11,"img/song/song1.jpg","lrc/1.lrc","mp3/G.E.M.邓紫棋 - Walk On Water.mp3",1),
(null,"南山之南",32,"img/song/song2.jpg","lrc/2.lrc","mp3/黄诗扶 - 南山之南.mp3",1),
(null,"脱焦",33,"img/song/song3.jpg","lrc/3.lrc","mp3/秦昊 - 脱焦.mp3",1),
(null,"家国天下",34,"img/song/song4.jpg","lrc/4.lrc","mp3/颜人中 - 家国天下.mp3",15),
(null,"All Falls Down",1,"img/song/song5.jpg","lrc/5.lrc","mp3/Alan Walker,Noah Cyrus,Digital Farm Animals - All Falls Down.mp3",5),
(null,"Move Your Body (Alan Walker Remix)",1,"img/song/song6.jpg","lrc/6.lrc","mp3/Sia,Alan Walker - Move Your Body (Alan Walker Remix).mp3",5),
(null,"给我一个理由忘记",2,"img/song/song7.jpg","lrc/7.lrc","mp3/A-Lin - 给我一个理由忘记.mp3",2),
(null,"拿走了什么",2,"img/song/song8.jpg","lrc/8.lrc","mp3/A-Lin - 拿走了什么.mp3",2),
(null,"野狼disco",3,"img/song/song9.jpg","lrc/9.lrc","mp3/宝石gem - 野狼disco.mp3",2),
(null,"光辉岁月",4,"img/song/song10.jpg","lrc/10.lrc","mp3/Beyond - 光辉岁月.mp3",4),
(null,"海阔天空",4,"img/song/song11.jpg","lrc/11.lrc","mp3/Beyond - 海阔天空.mp3",4),
(null,"富士山下",5,"img/song/song12.jpg","lrc/12.lrc","mp3/陈奕迅 - 富士山下.mp3",3),
(null,"好久不见",5,"img/song/song13.jpg","lrc/13.lrc","mp3/陈奕迅 - 好久不见.mp3",3),
(null,"浮夸",5,"img/song/song14.jpg","lrc/14.lrc","mp3/陈奕迅 - 浮夸.mp3",3),
(null,"阴天快乐",5,"img/song/song15.jpg","lrc/15.lrc","mp3/陈奕迅 - 阴天快乐.mp3",4),
(null,"光",6,"img/song/song16.jpg","lrc/16.lrc","mp3/陈粒 - 光.mp3",8),
(null,"易燃易爆炸",6,"img/song/song17.jpg","lrc/17.lrc","mp3/陈粒 - 易燃易爆炸.mp3",8),
(null,"绿色",7,"img/song/song18.jpg","lrc/18.lrc","mp3/陈雪凝 - 绿色.mp3",11),
(null,"假装",7,"img/song/song19.jpg","lrc/19.lrc","mp3/陈雪凝 - 假装.mp3",11),
(null,"关山酒",8,"img/song/song20.jpg","lrc/20.lrc","mp3/等什么君 - 关山酒.mp3",11),
(null,"辞九门回忆",8,"img/song/song21.jpg","lrc/21.lrc","mp3/等什么君 - 辞九门回忆.mp3",11),
(null,"Shape of You",9,"img/song/song22.jpg","lrc/22.lrc","mp3/Ed Sheeran - Shape of You.mp3",5),
(null,"Galway Girl",9,"img/song/song23.jpg","lrc/23.lrc","mp3/Ed Sheeran - Galway Girl.mp3",5),
(null,"庆功酒(Jungle Juice)",10,"img/song/song24.jpg","lrc/24.lrc","mp3/福克斯,隆历奇 - 庆功酒(Jungle Juice).mp3",6),
(null,"飞行随笔(Airplane Freestyle)",10,"img/song/song25.jpg","lrc/25.lrc","mp3/福克斯,Ice Paper,隆历奇 - 飞行随笔(Airplane Freestyle).mp3",6),
(null,"画 (Live Piano Session II)",11,"img/song/song26.jpg","lrc/26.lrc","mp3/G.E.M.邓紫棋 - 画 (Live Piano Session II).mp3",14),
(null,"来自天堂的魔鬼",11,"img/song/song27.jpg","lrc/27.lrc","mp3/G.E.M.邓紫棋 - 来自天堂的魔鬼.mp3",14),
(null,"烟火里的尘埃",12,"img/song/song28.jpg","lrc/28.lrc","mp3/华晨宇 - 烟火里的尘埃.mp3",14),
(null,"国王与乞丐",12,"img/song/song29.jpg","lrc/29.lrc","mp3/华晨宇,杨宗纬 - 国王与乞丐.mp3",14),
(null,"삐삐",13,"img/song/song30.jpg","lrc/30.lrc","mp3/IU - 삐삐.mp3",15),
(null,"봄 사랑 벚꽃 말고",13,"img/song/song31.jpg","lrc/31.lrc","mp3/High4,IU - 봄 사랑 벚꽃 말고.mp3",15),
(null,"10,000 Hours",14,"img/song/song32.jpg","lrc/32.lrc","mp3/Dan + Shay,Justin Bieber - 10,000 Hours.mp3",5),
(null,"Despacito (Remix)",14,"img/song/song33.jpg","lrc/33.lrc","mp3/Luis Fonsi,Daddy Yankee,Justin Bieber - Despacito (Remix).mp3",13),
(null,"这一生关于你的风景",15,"img/song/song34.jpg","lrc/34.lrc","mp3/枯木逢春 - 这一生关于你的风景.mp3",10),
(null,"这城市风总是很大",15,"img/song/song35.jpg","lrc/35.lrc","mp3/枯木逢春 - 这城市风总是很大.mp3",10),
(null,"修炼爱情",16,"img/song/song36.jpg","lrc/36.lrc","mp3/林俊杰 - 修炼爱情.mp3",7),
(null,"江南",16,"img/song/song37.jpg","lrc/37.lrc","mp3/林俊杰 - 江南.mp3",7),
(null,"Lemon",17,"img/song/song38.jpg","lrc/38.lrc","mp3/米津玄師 - Lemon.mp3",15),
(null,"LOSER",17,"img/song/song39.jpg","lrc/39.lrc","mp3/米津玄師 - LOSER.mp3",13),
(null,"攀登 (Live)",18,"img/song/song40.jpg","lrc/40.lrc","mp3/潘玮柏,G.E.M.邓紫棋,艾热 - 攀登 (Live).mp3",13),
(null,"不得不爱",18,"img/song/song41.jpg","lrc/41.lrc","mp3/潘玮柏,弦子 - 不得不爱.mp3",1),
(null,"后继者",19,"img/song/song42.jpg","lrc/42.lrc","mp3/任然 - 后继者.mp3",8),
(null,"空空如也",19,"img/song/song43.jpg","lrc/43.lrc","mp3/任然 - 空空如也.mp3",6),
(null,"遇见",20,"img/song/song44.jpg","lrc/44.lrc","mp3/孙燕姿 - 遇见.mp3",12),
(null,"我怀念的",20,"img/song/song45.jpg","lrc/45.lrc","mp3/孙燕姿 - 我怀念的.mp3",12),
(null,"你就不要想起我",21,"img/song/song46.jpg","lrc/46.lrc","mp3/田馥甄 - 你就不要想起我.mp3",12),
(null,"魔鬼中的天使",21,"img/song/song47.jpg","lrc/47.lrc","mp3/田馥甄 - 魔鬼中的天使.mp3",12),
(null,"我和我的祖国",22,"img/song/song48.jpg","lrc/48.lrc","mp3/王菲 - 我和我的祖国.mp3",12),
(null,"匆匆那年",22,"img/song/song49.jpg","lrc/49.lrc","mp3/王菲 - 匆匆那年.mp3",7),
(null,"演员",23,"img/song/song50.jpg","lrc/50.lrc","mp3/薛之谦 - 演员.mp3",7),
(null,"你还要我怎样",23,"img/song/song51.jpg","lrc/51.lrc","mp3/薛之谦 - 你还要我怎样.mp3",7),
(null,"野孩子",24,"img/song/song52.jpg","lrc/52.lrc","mp3/杨千嬅 - 野孩子.mp3",7),
(null,"处处吻",24,"img/song/song53.jpg","lrc/53.lrc","mp3/杨千嬅 - 处处吻.mp3",2),
(null,"芒种",25,"img/song/song54.jpg","lrc/54.lrc","mp3/音阙诗听,赵方婧 - 芒种.mp3",2),
(null,"轻描淡写",25,"img/song/song55.jpg","lrc/55.lrc","mp3/赵方婧 - 轻描淡写.mp3",9),
(null,"吻别",26,"img/song/song56.jpg","lrc/56.lrc","mp3/张学友 - 吻别.mp3",4),
(null,"饿狼传说",26,"img/song/song57.jpg","lrc/57.lrc","mp3/张学友 - 饿狼传说.mp3",4),
(null,"过客",27,"img/song/song58.jpg","lrc/58.lrc","mp3/周思涵 - 过客.mp3",9),
(null,"失眠",27,"img/song/song59.jpg","lrc/59.lrc","mp3/周思涵 - 失眠.mp3",9),
(null,"春夏秋冬",28,"img/song/song60.jpg","lrc/60.lrc","mp3/张国荣 - 春夏秋冬.mp3",4),
(null,"当年情(Live)",28,"img/song/song61.jpg","lrc/61.lrc","mp3/张国荣 - 当年情(Live).mp3",4),
(null,"成都",29,"img/song/song62.jpg","lrc/62.lrc","mp3/赵雷 - 成都.mp3",3),
(null,"南方姑娘",29,"img/song/song63.jpg","lrc/63.lrc","mp3/赵雷 - 南方姑娘.mp3",3),
(null,"天下",30,"img/song/song64.jpg","lrc/64.lrc","mp3/张杰 - 天下.mp3",6),
(null,"这,就是爱",30,"img/song/song65.jpg","lrc/65.lrc","mp3/张杰 - 这,就是爱.mp3",8),
(null,"断点",31,"img/song/song66.jpg","lrc/66.lrc","mp3/张敬轩 - 断点.mp3",8),
(null,"不吐不快",31,"img/song/song67.jpg","lrc/67.lrc","mp3/张敬轩 - 不吐不快.mp3",6),
(null,"齐天",12,"img/song/song68.jpg","lrc/68.lrc","mp3/华晨宇 - 齐天.mp3",9),
(null,"背对背拥抱",16,"img/song/song69.jpg","lrc/69.lrc","mp3/林俊杰 - 背对背拥抱.mp3",9),
(null,"Walk On Water",11,"img/song/song1.jpg","lrc/1.lrc","mp3/G.E.M.邓紫棋 - Walk On Water.mp3",1),
(null,"南山之南",32,"img/song/song2.jpg","lrc/2.lrc","mp3/黄诗扶 - 南山之南.mp3",1),
(null,"脱焦",33,"img/song/song3.jpg","lrc/3.lrc","mp3/秦昊 - 脱焦.mp3",1),
(null,"家国天下",34,"img/song/song4.jpg","lrc/4.lrc","mp3/颜人中 - 家国天下.mp3",15),
(null,"All Falls Down",1,"img/song/song5.jpg","lrc/5.lrc","mp3/Alan Walker,Noah Cyrus,Digital Farm Animals - All Falls Down.mp3",5),
(null,"Move Your Body (Alan Walker Remix)",1,"img/song/song6.jpg","lrc/6.lrc","mp3/Sia,Alan Walker - Move Your Body (Alan Walker Remix).mp3",5),
(null,"给我一个理由忘记",2,"img/song/song7.jpg","lrc/7.lrc","mp3/A-Lin - 给我一个理由忘记.mp3",2),
(null,"拿走了什么",2,"img/song/song8.jpg","lrc/8.lrc","mp3/A-Lin - 拿走了什么.mp3",2),
(null,"野狼disco",3,"img/song/song9.jpg","lrc/9.lrc","mp3/宝石gem - 野狼disco.mp3",2),
(null,"光辉岁月",4,"img/song/song10.jpg","lrc/10.lrc","mp3/Beyond - 光辉岁月.mp3",4),
(null,"海阔天空",4,"img/song/song11.jpg","lrc/11.lrc","mp3/Beyond - 海阔天空.mp3",4),
(null,"富士山下",5,"img/song/song12.jpg","lrc/12.lrc","mp3/陈奕迅 - 富士山下.mp3",3),
(null,"好久不见",5,"img/song/song13.jpg","lrc/13.lrc","mp3/陈奕迅 - 好久不见.mp3",3),
(null,"浮夸",5,"img/song/song14.jpg","lrc/14.lrc","mp3/陈奕迅 - 浮夸.mp3",3),
(null,"阴天快乐",5,"img/song/song15.jpg","lrc/15.lrc","mp3/陈奕迅 - 阴天快乐.mp3",4),
(null,"光",6,"img/song/song16.jpg","lrc/16.lrc","mp3/陈粒 - 光.mp3",8),
(null,"易燃易爆炸",6,"img/song/song17.jpg","lrc/17.lrc","mp3/陈粒 - 易燃易爆炸.mp3",8),
(null,"绿色",7,"img/song/song18.jpg","lrc/18.lrc","mp3/陈雪凝 - 绿色.mp3",11),
(null,"假装",7,"img/song/song19.jpg","lrc/19.lrc","mp3/陈雪凝 - 假装.mp3",11),
(null,"关山酒",8,"img/song/song20.jpg","lrc/20.lrc","mp3/等什么君 - 关山酒.mp3",11),
(null,"辞九门回忆",8,"img/song/song21.jpg","lrc/21.lrc","mp3/等什么君 - 辞九门回忆.mp3",11),
(null,"Shape of You",9,"img/song/song22.jpg","lrc/22.lrc","mp3/Ed Sheeran - Shape of You.mp3",5),
(null,"Galway Girl",9,"img/song/song23.jpg","lrc/23.lrc","mp3/Ed Sheeran - Galway Girl.mp3",5),
(null,"庆功酒(Jungle Juice)",10,"img/song/song24.jpg","lrc/24.lrc","mp3/福克斯,隆历奇 - 庆功酒(Jungle Juice).mp3",6),
(null,"飞行随笔(Airplane Freestyle)",10,"img/song/song25.jpg","lrc/25.lrc","mp3/福克斯,Ice Paper,隆历奇 - 飞行随笔(Airplane Freestyle).mp3",6),
(null,"画 (Live Piano Session II)",11,"img/song/song26.jpg","lrc/26.lrc","mp3/G.E.M.邓紫棋 - 画 (Live Piano Session II).mp3",14),
(null,"来自天堂的魔鬼",11,"img/song/song27.jpg","lrc/27.lrc","mp3/G.E.M.邓紫棋 - 来自天堂的魔鬼.mp3",14),
(null,"烟火里的尘埃",12,"img/song/song28.jpg","lrc/28.lrc","mp3/华晨宇 - 烟火里的尘埃.mp3",14),
(null,"国王与乞丐",12,"img/song/song29.jpg","lrc/29.lrc","mp3/华晨宇,杨宗纬 - 国王与乞丐.mp3",14),
(null,"삐삐",13,"img/song/song30.jpg","lrc/30.lrc","mp3/IU - 삐삐.mp3",15),
(null,"봄 사랑 벚꽃 말고",13,"img/song/song31.jpg","lrc/31.lrc","mp3/High4,IU - 봄 사랑 벚꽃 말고.mp3",15),
(null,"10,000 Hours",14,"img/song/song32.jpg","lrc/32.lrc","mp3/Dan + Shay,Justin Bieber - 10,000 Hours.mp3",5),
(null,"Despacito (Remix)",14,"img/song/song33.jpg","lrc/33.lrc","mp3/Luis Fonsi,Daddy Yankee,Justin Bieber - Despacito (Remix).mp3",13),
(null,"这一生关于你的风景",15,"img/song/song34.jpg","lrc/34.lrc","mp3/枯木逢春 - 这一生关于你的风景.mp3",10),
(null,"这城市风总是很大",15,"img/song/song35.jpg","lrc/35.lrc","mp3/枯木逢春 - 这城市风总是很大.mp3",10),
(null,"修炼爱情",16,"img/song/song36.jpg","lrc/36.lrc","mp3/林俊杰 - 修炼爱情.mp3",7),
(null,"江南",16,"img/song/song37.jpg","lrc/37.lrc","mp3/林俊杰 - 江南.mp3",7),
(null,"Lemon",17,"img/song/song38.jpg","lrc/38.lrc","mp3/米津玄師 - Lemon.mp3",15),
(null,"LOSER",17,"img/song/song39.jpg","lrc/39.lrc","mp3/米津玄師 - LOSER.mp3",13),
(null,"攀登 (Live)",18,"img/song/song40.jpg","lrc/40.lrc","mp3/潘玮柏,G.E.M.邓紫棋,艾热 - 攀登 (Live).mp3",13),
(null,"不得不爱",18,"img/song/song41.jpg","lrc/41.lrc","mp3/潘玮柏,弦子 - 不得不爱.mp3",1),
(null,"后继者",19,"img/song/song42.jpg","lrc/42.lrc","mp3/任然 - 后继者.mp3",8),
(null,"空空如也",19,"img/song/song43.jpg","lrc/43.lrc","mp3/任然 - 空空如也.mp3",6),
(null,"遇见",20,"img/song/song44.jpg","lrc/44.lrc","mp3/孙燕姿 - 遇见.mp3",12),
(null,"我怀念的",20,"img/song/song45.jpg","lrc/45.lrc","mp3/孙燕姿 - 我怀念的.mp3",12),
(null,"你就不要想起我",21,"img/song/song46.jpg","lrc/46.lrc","mp3/田馥甄 - 你就不要想起我.mp3",12),
(null,"魔鬼中的天使",21,"img/song/song47.jpg","lrc/47.lrc","mp3/田馥甄 - 魔鬼中的天使.mp3",12),
(null,"我和我的祖国",22,"img/song/song48.jpg","lrc/48.lrc","mp3/王菲 - 我和我的祖国.mp3",12),
(null,"匆匆那年",22,"img/song/song49.jpg","lrc/49.lrc","mp3/王菲 - 匆匆那年.mp3",7),
(null,"演员",23,"img/song/song50.jpg","lrc/50.lrc","mp3/薛之谦 - 演员.mp3",7),
(null,"你还要我怎样",23,"img/song/song51.jpg","lrc/51.lrc","mp3/薛之谦 - 你还要我怎样.mp3",7),
(null,"野孩子",24,"img/song/song52.jpg","lrc/52.lrc","mp3/杨千嬅 - 野孩子.mp3",7),
(null,"处处吻",24,"img/song/song53.jpg","lrc/53.lrc","mp3/杨千嬅 - 处处吻.mp3",2),
(null,"芒种",25,"img/song/song54.jpg","lrc/54.lrc","mp3/音阙诗听,赵方婧 - 芒种.mp3",2),
(null,"轻描淡写",25,"img/song/song55.jpg","lrc/55.lrc","mp3/赵方婧 - 轻描淡写.mp3",9),
(null,"吻别",26,"img/song/song56.jpg","lrc/56.lrc","mp3/张学友 - 吻别.mp3",4),
(null,"饿狼传说",26,"img/song/song57.jpg","lrc/57.lrc","mp3/张学友 - 饿狼传说.mp3",4),
(null,"过客",27,"img/song/song58.jpg","lrc/58.lrc","mp3/周思涵 - 过客.mp3",9),
(null,"失眠",27,"img/song/song59.jpg","lrc/59.lrc","mp3/周思涵 - 失眠.mp3",9),
(null,"春夏秋冬",28,"img/song/song60.jpg","lrc/60.lrc","mp3/张国荣 - 春夏秋冬.mp3",4),
(null,"当年情(Live)",28,"img/song/song61.jpg","lrc/61.lrc","mp3/张国荣 - 当年情(Live).mp3",4),
(null,"成都",29,"img/song/song62.jpg","lrc/62.lrc","mp3/赵雷 - 成都.mp3",3),
(null,"南方姑娘",29,"img/song/song63.jpg","lrc/63.lrc","mp3/赵雷 - 南方姑娘.mp3",3),
(null,"天下",30,"img/song/song64.jpg","lrc/64.lrc","mp3/张杰 - 天下.mp3",6),
(null,"这,就是爱",30,"img/song/song65.jpg","lrc/65.lrc","mp3/张杰 - 这,就是爱.mp3",8),
(null,"断点",31,"img/song/song66.jpg","lrc/66.lrc","mp3/张敬轩 - 断点.mp3",8),
(null,"不吐不快",31,"img/song/song67.jpg","lrc/67.lrc","mp3/张敬轩 - 不吐不快.mp3",6),
(null,"齐天",12,"img/song/song68.jpg","lrc/68.lrc","mp3/华晨宇 - 齐天.mp3",9),
(null,"背对背拥抱",16,"img/song/song69.jpg","lrc/69.lrc","mp3/林俊杰 - 背对背拥抱.mp3",9),
(null,"Walk On Water",11,"img/song/song1.jpg","lrc/1.lrc","mp3/G.E.M.邓紫棋 - Walk On Water.mp3",1),
(null,"南山之南",32,"img/song/song2.jpg","lrc/2.lrc","mp3/黄诗扶 - 南山之南.mp3",1),
(null,"脱焦",33,"img/song/song3.jpg","lrc/3.lrc","mp3/秦昊 - 脱焦.mp3",1),
(null,"家国天下",34,"img/song/song4.jpg","lrc/4.lrc","mp3/颜人中 - 家国天下.mp3",15),
(null,"All Falls Down",1,"img/song/song5.jpg","lrc/5.lrc","mp3/Alan Walker,Noah Cyrus,Digital Farm Animals - All Falls Down.mp3",5),
(null,"Move Your Body (Alan Walker Remix)",1,"img/song/song6.jpg","lrc/6.lrc","mp3/Sia,Alan Walker - Move Your Body (Alan Walker Remix).mp3",5),
(null,"给我一个理由忘记",2,"img/song/song7.jpg","lrc/7.lrc","mp3/A-Lin - 给我一个理由忘记.mp3",2),
(null,"拿走了什么",2,"img/song/song8.jpg","lrc/8.lrc","mp3/A-Lin - 拿走了什么.mp3",2),
(null,"野狼disco",3,"img/song/song9.jpg","lrc/9.lrc","mp3/宝石gem - 野狼disco.mp3",2),
(null,"光辉岁月",4,"img/song/song10.jpg","lrc/10.lrc","mp3/Beyond - 光辉岁月.mp3",4),
(null,"海阔天空",4,"img/song/song11.jpg","lrc/11.lrc","mp3/Beyond - 海阔天空.mp3",4),
(null,"富士山下",5,"img/song/song12.jpg","lrc/12.lrc","mp3/陈奕迅 - 富士山下.mp3",3),
(null,"好久不见",5,"img/song/song13.jpg","lrc/13.lrc","mp3/陈奕迅 - 好久不见.mp3",3),
(null,"浮夸",5,"img/song/song14.jpg","lrc/14.lrc","mp3/陈奕迅 - 浮夸.mp3",3),
(null,"阴天快乐",5,"img/song/song15.jpg","lrc/15.lrc","mp3/陈奕迅 - 阴天快乐.mp3",4),
(null,"光",6,"img/song/song16.jpg","lrc/16.lrc","mp3/陈粒 - 光.mp3",8),
(null,"易燃易爆炸",6,"img/song/song17.jpg","lrc/17.lrc","mp3/陈粒 - 易燃易爆炸.mp3",8),
(null,"绿色",7,"img/song/song18.jpg","lrc/18.lrc","mp3/陈雪凝 - 绿色.mp3",11),
(null,"假装",7,"img/song/song19.jpg","lrc/19.lrc","mp3/陈雪凝 - 假装.mp3",11),
(null,"关山酒",8,"img/song/song20.jpg","lrc/20.lrc","mp3/等什么君 - 关山酒.mp3",11),
(null,"辞九门回忆",8,"img/song/song21.jpg","lrc/21.lrc","mp3/等什么君 - 辞九门回忆.mp3",11),
(null,"Shape of You",9,"img/song/song22.jpg","lrc/22.lrc","mp3/Ed Sheeran - Shape of You.mp3",5),
(null,"Galway Girl",9,"img/song/song23.jpg","lrc/23.lrc","mp3/Ed Sheeran - Galway Girl.mp3",5),
(null,"庆功酒(Jungle Juice)",10,"img/song/song24.jpg","lrc/24.lrc","mp3/福克斯,隆历奇 - 庆功酒(Jungle Juice).mp3",6),
(null,"飞行随笔(Airplane Freestyle)",10,"img/song/song25.jpg","lrc/25.lrc","mp3/福克斯,Ice Paper,隆历奇 - 飞行随笔(Airplane Freestyle).mp3",6),
(null,"画 (Live Piano Session II)",11,"img/song/song26.jpg","lrc/26.lrc","mp3/G.E.M.邓紫棋 - 画 (Live Piano Session II).mp3",14),
(null,"来自天堂的魔鬼",11,"img/song/song27.jpg","lrc/27.lrc","mp3/G.E.M.邓紫棋 - 来自天堂的魔鬼.mp3",14),
(null,"烟火里的尘埃",12,"img/song/song28.jpg","lrc/28.lrc","mp3/华晨宇 - 烟火里的尘埃.mp3",14),
(null,"国王与乞丐",12,"img/song/song29.jpg","lrc/29.lrc","mp3/华晨宇,杨宗纬 - 国王与乞丐.mp3",14),
(null,"삐삐",13,"img/song/song30.jpg","lrc/30.lrc","mp3/IU - 삐삐.mp3",15),
(null,"봄 사랑 벚꽃 말고",13,"img/song/song31.jpg","lrc/31.lrc","mp3/High4,IU - 봄 사랑 벚꽃 말고.mp3",15),
(null,"10,000 Hours",14,"img/song/song32.jpg","lrc/32.lrc","mp3/Dan + Shay,Justin Bieber - 10,000 Hours.mp3",5),
(null,"Despacito (Remix)",14,"img/song/song33.jpg","lrc/33.lrc","mp3/Luis Fonsi,Daddy Yankee,Justin Bieber - Despacito (Remix).mp3",13),
(null,"这一生关于你的风景",15,"img/song/song34.jpg","lrc/34.lrc","mp3/枯木逢春 - 这一生关于你的风景.mp3",10),
(null,"这城市风总是很大",15,"img/song/song35.jpg","lrc/35.lrc","mp3/枯木逢春 - 这城市风总是很大.mp3",10),
(null,"修炼爱情",16,"img/song/song36.jpg","lrc/36.lrc","mp3/林俊杰 - 修炼爱情.mp3",7),
(null,"江南",16,"img/song/song37.jpg","lrc/37.lrc","mp3/林俊杰 - 江南.mp3",7),
(null,"Lemon",17,"img/song/song38.jpg","lrc/38.lrc","mp3/米津玄師 - Lemon.mp3",15),
(null,"LOSER",17,"img/song/song39.jpg","lrc/39.lrc","mp3/米津玄師 - LOSER.mp3",13),
(null,"攀登 (Live)",18,"img/song/song40.jpg","lrc/40.lrc","mp3/潘玮柏,G.E.M.邓紫棋,艾热 - 攀登 (Live).mp3",13),
(null,"不得不爱",18,"img/song/song41.jpg","lrc/41.lrc","mp3/潘玮柏,弦子 - 不得不爱.mp3",1),
(null,"后继者",19,"img/song/song42.jpg","lrc/42.lrc","mp3/任然 - 后继者.mp3",8),
(null,"空空如也",19,"img/song/song43.jpg","lrc/43.lrc","mp3/任然 - 空空如也.mp3",6),
(null,"遇见",20,"img/song/song44.jpg","lrc/44.lrc","mp3/孙燕姿 - 遇见.mp3",12),
(null,"我怀念的",20,"img/song/song45.jpg","lrc/45.lrc","mp3/孙燕姿 - 我怀念的.mp3",12),
(null,"你就不要想起我",21,"img/song/song46.jpg","lrc/46.lrc","mp3/田馥甄 - 你就不要想起我.mp3",12),
(null,"魔鬼中的天使",21,"img/song/song47.jpg","lrc/47.lrc","mp3/田馥甄 - 魔鬼中的天使.mp3",12),
(null,"我和我的祖国",22,"img/song/song48.jpg","lrc/48.lrc","mp3/王菲 - 我和我的祖国.mp3",12),
(null,"匆匆那年",22,"img/song/song49.jpg","lrc/49.lrc","mp3/王菲 - 匆匆那年.mp3",7),
(null,"演员",23,"img/song/song50.jpg","lrc/50.lrc","mp3/薛之谦 - 演员.mp3",7),
(null,"你还要我怎样",23,"img/song/song51.jpg","lrc/51.lrc","mp3/薛之谦 - 你还要我怎样.mp3",7),
(null,"野孩子",24,"img/song/song52.jpg","lrc/52.lrc","mp3/杨千嬅 - 野孩子.mp3",7),
(null,"处处吻",24,"img/song/song53.jpg","lrc/53.lrc","mp3/杨千嬅 - 处处吻.mp3",2),
(null,"芒种",25,"img/song/song54.jpg","lrc/54.lrc","mp3/音阙诗听,赵方婧 - 芒种.mp3",2),
(null,"轻描淡写",25,"img/song/song55.jpg","lrc/55.lrc","mp3/赵方婧 - 轻描淡写.mp3",9),
(null,"吻别",26,"img/song/song56.jpg","lrc/56.lrc","mp3/张学友 - 吻别.mp3",4),
(null,"饿狼传说",26,"img/song/song57.jpg","lrc/57.lrc","mp3/张学友 - 饿狼传说.mp3",4),
(null,"过客",27,"img/song/song58.jpg","lrc/58.lrc","mp3/周思涵 - 过客.mp3",9),
(null,"失眠",27,"img/song/song59.jpg","lrc/59.lrc","mp3/周思涵 - 失眠.mp3",9),
(null,"春夏秋冬",28,"img/song/song60.jpg","lrc/60.lrc","mp3/张国荣 - 春夏秋冬.mp3",4),
(null,"当年情(Live)",28,"img/song/song61.jpg","lrc/61.lrc","mp3/张国荣 - 当年情(Live).mp3",4),
(null,"成都",29,"img/song/song62.jpg","lrc/62.lrc","mp3/赵雷 - 成都.mp3",3),
(null,"南方姑娘",29,"img/song/song63.jpg","lrc/63.lrc","mp3/赵雷 - 南方姑娘.mp3",3),
(null,"天下",30,"img/song/song64.jpg","lrc/64.lrc","mp3/张杰 - 天下.mp3",6),
(null,"这,就是爱",30,"img/song/song65.jpg","lrc/65.lrc","mp3/张杰 - 这,就是爱.mp3",8),
(null,"断点",31,"img/song/song66.jpg","lrc/66.lrc","mp3/张敬轩 - 断点.mp3",8),
(null,"不吐不快",31,"img/song/song67.jpg","lrc/67.lrc","mp3/张敬轩 - 不吐不快.mp3",6),
(null,"齐天",12,"img/song/song68.jpg","lrc/68.lrc","mp3/华晨宇 - 齐天.mp3",9),
(null,"背对背拥抱",16,"img/song/song69.jpg","lrc/69.lrc","mp3/林俊杰 - 背对背拥抱.mp3",9);


#歌手表
CREATE TABLE singer(
  gid INT PRIMARY KEY AUTO_INCREMENT,
  gname VARCHAR(100),
  gpic VARCHAR(255),
  pinyin VARCHAR(5)
);

INSERT INTO singer VALUES
(null,"Alan Walker","img/singer/singer1.jpg","A"),
(null,"A-Lin","img/singer/singer2.jpg","A"),
(null,"宝石gem","img/singer/singer3.jpg","B"),
(null,"Beyond","img/singer/singer4.jpg","B"),
(null,"陈奕迅","img/singer/singer5.jpg","C"),
(null,"陈粒","img/singer/singer6.jpg","C"),
(null,"陈雪凝","img/singer/singer7.jpg","C"),
(null,"等什么君","img/singer/singer8.jpg","D"),
(null,"Ed Sheeran","img/singer/singer9.jpg","E"),
(null,"福克斯","img/singer/singer10.jpg","F"),
(null,"G.E.M.邓紫棋","img/singer/singer11.jpg","G"),
(null,"华晨宇","img/singer/singer12.jpg","H"),
(null,"IU","img/singer/singer13.jpg","I"),
(null,"Justin Bieber","img/singer/singer14.jpg","J"),
(null,"枯木逢春","img/singer/singer15.jpg","K"),
(null,"林俊杰","img/singer/singer16.jpg","L"),
(null,"米津玄師","img/singer/singer17.jpg","M"),
(null,"潘玮柏","img/singer/singer18.jpg","P"),
(null,"任然","img/singer/singer19.jpg","R"),
(null,"孙燕姿","img/singer/singer20.jpg","S"),
(null,"田馥甄","img/singer/singer21.jpg","T"),
(null,"王菲","img/singer/singer22.jpg","W"),
(null,"薛之谦","img/singer/singer23.jpg","X"),
(null,"杨千嬅","img/singer/singer24.jpg","Y"),
(null,"赵方婧","img/singer/singer25.jpg","Z"),
(null,"张学友","img/singer/singer26.jpg","Z"),
(null,"周思涵","img/singer/singer27.jpg","Z"),
(null,"张国荣","img/singer/singer28.jpg","Z"),
(null,"赵雷","img/singer/singer29.jpg","Z"),
(null,"张杰","img/singer/singer30.jpg","Z"),
(null,"张敬轩","img/singer/singer31.jpg","Z"),
(null,"黄诗扶","img/singer/singer32.jpg","H"),
(null,"秦昊","img/singer/singer33.jpg","Q"),
(null,"颜人中","img/singer/singer34.jpg","Y");

#热门搜索表
CREATE TABLE hot(
  id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(100)
);

INSERT INTO hot VALUES
(null,"我和我的祖国"),
(null,"南山之南"),
(null,"拿走了什么"),
(null,"Walk On Water"),
(null,"给我一个理由忘记"),
(null,"富士山下");

#搜索历史表
CREATE TABLE search(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  content VARCHAR(100) 
);

INSERT INTO search VALUES
(null,null,"大田后生仔"),
(null,null,"林俊杰");

#播放列表(用户单独的播放表)
CREATE TABLE playlist(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  sid INT
);

#收藏表
CREATE TABLE collect(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  sid INT
);

#最近播放表
CREATE TABLE recently(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  sid INT
);
