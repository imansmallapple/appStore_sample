import promptAction from '@ohos.promptAction'
import constant from '@ohos.bluetooth.constant'
import { fonts } from '../../font/fonts'

const ToastDuration = 2000

@Component
export struct HomePage {
  @State changeValue: string = ''
  private controller: SearchController = new SearchController()
  private swiperController: SwiperController = new SwiperController()
  @State totalCount: number = 0;
  @State appCount: number = 0;
  @State gameCount: number = 0;

  ResourceToString(resource:Resource):string{
    return getContext(this).resourceManager.getStringSync(resource)
  }

  @Builder
  NavigationTitle() {
    Column() {
      Text('Oniro')
        .fontColor('#182431')
        .fontSize(26)
        .fontWeight(500)
        .fontFamily(fonts.italic.familyName)
    }.alignItems(HorizontalAlign.Start)
    .width('100%')
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Scroll() { // 使用滚动容器确保可见
          Column() {
            // 页面标题
            Navigation()
              .title(this.NavigationTitle())
              .hideToolBar(true)
              .height(56)
              .width('100%')
              .titleMode(NavigationTitleMode.Mini)
              .hideBackButton(true)

            // 搜索
            Search({
              value: this.changeValue,
              placeholder: (Object)($r('app.string.app_game_search')),
              controller: this.controller
            }) // todo: Replace the 'Search' text into resource type
               //.searchButton(this.ResourceToString($r('app.string.search')))
              .searchButton('搜索')
              .width('100%')
              .height(40)
              .backgroundColor('#F5F5F5')
              .placeholderColor(Color.Grey)
              .placeholderFont({ size: 14, weight: 400 })
              .textFont({ size: 14, weight: 400 })
              .onSubmit((value: string) => {
                promptAction.showToast({ message: $r('app.string.few_apps_no_search'), duration: ToastDuration });
              })
              .onChange((value: string) => {
              })
              .focusable(false)

            // 滚动图 main_banner
            Swiper(this.swiperController) {
              Image($r("app.media.ONIRO_Masterbrand_horizontal")).width('100%').height(150).borderRadius(15)
              Image($r("app.media.ONIRO_Masterbrand_horizontal_black")).width('100%').height(150).borderRadius(15)
              Image($r("app.media.ONIRO_Masterbrand_horizontal_Reversed_color"))
                .width('100%')
                .height(150)
                .borderRadius(15)
            }
            .cachedCount(3)
            .index(0)
            .autoPlay(true)
            .interval(5000)
            .indicator(true)
            .loop(true)
            .duration(1000)
            .itemSpace(20)
            .curve(Curve.Linear)
            .onChange((index: number) => {
              console.info(index.toString())
              console.info(getContext(this).resourceManager.getStringSync($r('app.string.search')).toString())
            })
            .margin({ top: 10 })

            // 收录统计: 使用弹性布局将三个列容器组件排列在一起
            Column() {
              Text($r('app.string.inclusion_stats')).fontSize(20).width('100%').margin({ bottom: 10 })
                .fontFamily(fonts.regular.familyName)
              Flex({
                direction: FlexDirection.Row,
                justifyContent: FlexAlign.SpaceBetween,
                alignItems: ItemAlign.Center
              }) {
                Column() {
                  Column() {
                    Text($r('app.string.total'))
                      .height(30)
                      .fontSize(16)
                      .fontColor('#333')
                      .fontFamily(fonts.regular.familyName)
                  }.width('100%').border({ width: { bottom: 1 }, color: '#fff' })

                  Column() {
                    Text(this.totalCount.toString())
                      .height(30)
                      .fontSize(16)
                      .fontColor('#555')
                      .fontFamily(fonts.regular.familyName)
                  }.width('100%')
                }
                .width('100%')
                .margin({ right: 10 })
                .padding({ left: 5, right: 5 })
                .flexGrow(1)
                .backgroundImage($r('app.media.main_card_1'))
                .backgroundImageSize(ImageSize.Cover)
                .border({ width: 0.7, radius: 15, color: '#ebebeb' })

                Column() {
                  Column() {
                    Text($r('app.string.app'))
                      .height(30)
                      .fontSize(16)
                      .fontColor('#333')
                      .fontFamily(fonts.regular.familyName)
                  }.width('100%').border({ width: { bottom: 1 }, color: '#fff' })

                  Column() {
                    Text(this.appCount.toString())
                      .height(30)
                      .fontSize(16)
                      .fontColor('#555')
                      .fontFamily(fonts.regular.familyName)
                  }.width('100%')
                }
                .width('100%')
                .margin({ left: 5, right: 5 })
                .padding({ left: 5, right: 5 })
                .flexGrow(0)
                .backgroundImage($r('app.media.main_card_1'))
                .backgroundImageSize(ImageSize.Cover)
                .border({ width: 0.7, radius: 15, color: '#ebebeb' })

                Column() {
                  Column() {
                    Text($r('app.string.game'))
                      .height(30)
                      .fontSize(16)
                      .fontColor('#333')
                      .fontFamily(fonts.regular.familyName)
                  }.width('100%').border({ width: { bottom: 1 }, color: '#fff' })

                  Column() {
                    Text(this.gameCount.toString())
                      .height(30)
                      .fontSize(16)
                      .fontColor('#555')
                      .fontFamily(fonts.regular.familyName)
                  }.width('100%')
                }
                .width('100%')
                .margin({ left: 10 })
                .padding({ left: 5, right: 5 })
                .flexGrow(0)
                .backgroundImage($r('app.media.main_card_1'))
                .backgroundImageSize(ImageSize.Cover)
                .border({ width: 0.7, radius: 15, color: '#ebebeb' })
              }
            }.margin({ top: 15 })

          }
          .width('100%')
          .padding({
            left: 15, right: 15
          })
          .alignItems(HorizontalAlign.Start)
        }
        .edgeEffect(EdgeEffect.None)
        .width('100%')
        .height('auto')
        .margin({ bottom: 56 })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%').height('100%').backgroundColor('#ffffff')
  }
}