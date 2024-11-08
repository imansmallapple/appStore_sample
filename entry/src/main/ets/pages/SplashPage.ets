import router from '@ohos.router';

@Entry
@Component
struct SplashPage {
  @State flag: boolean = false;

  onPageShow(): void {
    animateTo({
      duration: 2000,
      onFinish:()=>{
        //when the animation finish go the main page
        setTimeout(()=>{
          router.replaceUrl({url: 'pages/Index'})
        }, 200)
      }
    }, () => {
      this.flag = true
    })
  }

  build() {
    Column() {
      if (this.flag) {
        Image($r('app.media.ONIRO'))
          .logoStyle()
          .transition({
            type: TransitionType.Insert,
            opacity: 0,
            translate: { x: -150 },
            scale:{
              x:5,
              y:5
            }
          })
        Text($r('app.string.oniro_appStore'))
          .titleStyle()
          .transition({
            type: TransitionType.Insert,
            opacity: 0,
            translate: { x: 150 }
          })
      }
      Blank()
    }
    .bgStyle()
  }
}

@Extend(Image)
function logoStyle() {
  .width(90)
  .height(90)
  .margin({ top: 120 })
}

@Extend(Text)
function titleStyle() {
  .fontSize(21)
  .fontColor(Color.Black)
  .fontWeight(FontWeight.Bold)
  .margin({ top: 15 })
}

@Styles
function bgStyle() {
  .width('100%')
  .height('100%')
  .backgroundColor(Color.White)
  .backgroundImageSize({ width: '100%', height: '100%' })
}

@Extend(Text)
function footerStyle() {
  .fontSize(12)
  .fontColor('#ff7ba416')
  .fontWeight(FontWeight.Bold)
  .margin({ bottom: 30 })
}

