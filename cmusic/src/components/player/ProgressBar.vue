<template>
  <div class="progress-bar" ref="progressBar" @click="progressClick">

    <div class="bar-inner">
      <!-- 已经播放的长度 -->
      <div class="progress" ref="progress"></div>
      <!-- 进度条的按钮 -->
      <div class="progress-btn-wrapper" ref="progressBtn" @touchstart.prevent="progressTouchStart" @touchmove.prevent="progressTouchMove" @touchend="progressTouchEnd">
        <div class="progress-btn" ref="progressBtn"></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    percent: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
      progressBtnWidth:""
    }
  },
  created() {
    this.touch={}
  },
  methods: {
    progressTouchStart(e){
      this.touch.initiated = true; // 记录已点击
      this.touch.startX = e.touches[0].pageX; // 记录横向坐标
      this.touch.left = this.$refs.progress.clientWidth; // 记录进度条长度
    },
    progressTouchMove(e){
      if (!this.touch.initiated) {
        return;
      }
      const deltaX = e.touches[0].pageX - this.touch.startX; // 当前横向坐标-初始点击横向坐标
      const offsetWidth = Math.min(
        this.$refs.progressBar.clientWidth - this.progressBtnWidth,
        Math.max(0, this.touch.left + deltaX)
      );
      this._offset(offsetWidth);
    },
    progressTouchEnd(){
      this.touch.initiated = false;
      this._triggerPercent();
    },
    progressClick(e){
      const rect = this.$refs.progressBar.getBoundingClientRect();
      const offsetWidth = e.pageX - rect.left;
      this._offset(offsetWidth);
      // 这里当我们点击 progressBtn 的时候，e.offsetX 获取不对
      // this._offset(e.offsetX)
      this._triggerPercent();
    },
    _triggerPercent() {
      const barWidth =
        this.$refs.progressBar.clientWidth - this.progressBtnWidth;
      const percent = this.$refs.progress.clientWidth / barWidth;
      this.$emit("percentChange", percent);
    },
    /* 得知播放过的百分比时操作ui变化 */
    _offset(offsetWidth) {
      this.$refs.progress.style.width = `${offsetWidth}px`;
      this.$refs.progressBtn.style.transform = `translate3d(${offsetWidth}px,0,0)`;
    }
  },
  watch: {
    percent(newPercent) {
      if (newPercent >= 0 && !this.touch.initiated) {
        // 拖动时不能自动跳动
        this.progressBtnWidth = this.$refs.progressBtn.clientWidth / 2; // 按钮宽度
        const barWidth =
          this.$refs.progressBar.clientWidth - this.progressBtnWidth; // 总宽-按钮宽度
        const offsetWidth = newPercent * barWidth;
        this._offset(offsetWidth);
      }
    }
  },
}
</script>

<style scoped>
.progress-bar{
  width:100%;
  height:20%;
  margin-bottom:2%;
  display:inline-block;
  vertical-align:middle;
}

/*进度线*/
.bar-inner{
  position: relative;
  top: 0;
  height: 100%;
  background: rgba(0, 0, 0,.3);
}

.progress{
  position: absolute;
  height:100%;
  background: rgb(255,205,50);
}

.progress-btn-wrapper {
  position: absolute;
  height: 100%;
}

.progress-btn {
  position: absolute;
  box-sizing: border-box;
  top: -50%;
  width: 10px;
  height:10px;
  border: 2px solid #fff;
  border-radius: 50%;
  background: rgb(255, 205, 50);
}
</style>