import WindowStageUtil from '../utils/WindowStageUtil'
import { HomePage } from './HomePage'
import window from '@ohos.window';


@Entry
@Component
struct Index {
  private controller: TabsController = new TabsController()
  @State currentIndex: number = 0
  @State selectedFontColor: string = '#007DFF'
  @State fontColor: string = '#182431'
  windowStage?: window.WindowStage

  @Builder
  TabBarBuilder(index: number, title: string | Resource, icon: Resource, iconSelected: Resource) {
    Column() {
      Image(this.currentIndex === index ? iconSelected : icon)
        .width(24)
        .height(24)
        .margin(5)
        .objectFit(ImageFit.Contain)
      Text(title)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
    .backgroundColor('#f7f7f7')
    .border({ width: { top: 0.5 }, color: '#bbbbbb' })
  }

  build() {
    Column() {
      Tabs({
        barPosition: BarPosition.End,
        controller: this.controller,
        index: this.currentIndex
      }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBarBuilder(0, $r('app.string.home'), $r('app.media.ic_home_normal'), $r('app.media.ic_home_active')))

        TabContent() {
          //App({appType: AppType.APP})
          Text('Applications')
        }
        .tabBar(this.TabBarBuilder(1, $r('app.string.app'), $r('app.media.ic_app_normal'), $r('app.media.ic_app_active')))

        TabContent() {
          //App({appType: AppType.GAME})
          Text('Games')
        }
        .tabBar(this.TabBarBuilder(2, $r('app.string.game'), $r('app.media.ic_game_normal'), $r('app.media.ic_game_active')))

        TabContent() {
          //Settings()
          Text('Settings')
        }
        .tabBar(this.TabBarBuilder(3, $r('app.string.settings'), $r('app.media.ic_search_normal'), $r('app.media.ic_search_active')))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .barHeight(66)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
  }

  changeLFS() {
    if (this.currentIndex == 3) {
      WindowStageUtil.setLayoutFullScreen(this.windowStage, '#f3f4f6', WindowStageUtil.COLOR_BLACK, '#f7f7f7', WindowStageUtil.COLOR_BLACK);
    } else {
      WindowStageUtil.setLayoutFullScreen(this.windowStage, WindowStageUtil.COLOR_WHITE, WindowStageUtil.COLOR_BLACK, '#f7f7f7', WindowStageUtil.COLOR_BLACK);
    }
  }
}