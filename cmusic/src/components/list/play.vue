<template>
    <div class="play"> 
        <div class="pic">
            <img src="../../assets/Mplay.jpg" alt="">
        </div>
        <div class="txt">
            <p class="songName">BINGBIAN病变（prod.jurrivh）</p>
            <p class="singerName">Cubi/Aydo$/BRGang</p>
        </div>
        <div class="playBtn">
        </div>
        <div class="nav">
            <img src="../../assets/nav.png" alt="">
        </div>
    </div>
</template>
<script>
    export default {
        
    }
</script>
<style scoped>
.play{/*设置整个播放条的背景颜色*/
    background: #fff;
    display: flex;
    width: 100%;
    height: 60px;
    border: 1px solid red;
}
.play>.pic>img{/*设置播放条中图片的样式*/
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin: 5px 10px 0 20px;
}
.play>.txt{/*设置文本内容*/
    font-size: 14px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.play>.txt>p{/*设置文本内容*/
    text-align: left;
}
.play>.txt>p.singerName{/*设置文本内容——歌手*/
    font-size: 12px;
}
.play>.nav{/*设置歌曲列表按钮样式*/
    margin: 14px 0;
}
</style>
