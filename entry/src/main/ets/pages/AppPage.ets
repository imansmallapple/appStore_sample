import { AppInfo, AppType } from '../model/AppInfo';
import AppListItem from '../components/AppListItem';
import { DataSource } from '../data/DataSource';

@Entry
@Component
export default struct App {
  appType: AppType = AppType.APP
  @State appList: AppInfo[] = []

  aboutToAppear() {
    DataSource.getAppList(this.appType, (data: AppInfo[]) => {
      this.appList = data;
    })
  }

  @Builder
  NavigationTitle() {
    Column() {
      Text(this.appType == AppType.APP ? $r('app.string.app') : $r('app.string.game'))
        .fontColor('#182431')
        .fontSize(26)
        .fontWeight(500)
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Start)
    .height('100%')
    .width('100%')
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        // 页面标题
        Navigation()
          .title(this.NavigationTitle())
          .hideToolBar(true)
          .height(56)
          .width('100%')
          .titleMode(NavigationTitleMode.Mini)
          .hideBackButton(true)
          .border({ width: { bottom: 0.5 }, color: '#c9c9c9' })
          .padding({ left: 15, right: 15 })

        Scroll() {
          Column() {
            List({ space: 0, initialIndex: 0 }) {
              ForEach(this.appList, (item: AppInfo) => {
                ListItem() {
                  AppListItem({appInfo: item})
                }
              }, (item: AppInfo, index) => index + JSON.stringify(item))
            }
            .width('auto')
            .height('auto')
            .padding({ left: 15, right: 15 })
            .divider({
              strokeWidth: 0.5,
              color: '#d6d6d6',
              startMargin: 65,
              endMargin: 0
            })
          }
          .width('100%')

          //          .margin({top: 7.5, bottom: 7.5})
        }
        .edgeEffect(EdgeEffect.Spring)
        .width('100%')
        .height('auto')
        .margin({ bottom: 56 })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffffff')
  }
}
