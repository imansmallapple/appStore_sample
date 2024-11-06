import webview from '@ohos.web.webview';
import hilog from '@ohos.hilog';
import systemparameter from '@ohos.systemParameterEnhance';
import router from '@ohos.router'
import WindowStageUtil from '../utils/WindowStageUtil';
import window from '@ohos.window';

interface RouterParams {
  title: string,
  url: string
}

interface ExtObj {
  test: (str: string) => string;
}

// 自定义UA
const PAD_USER_AGENT: string = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTMl, like Gecko) Chrome/99.0.4844.88 Safari/537.36'
const PHONE_USER_AGENT: string = 'Mozilla/5.0 (Linux; Android 10.0; ohos) AppleWebKit/537.36 (KHTMl, like Gecko) Chrome/99.0.4844.88 HuaweiBrowser/13.0.4.302 Mobile Safari/537.36'

@Entry
@Component
struct Browser {
  @State title: string = ''
  @State url: string = ''
  @State isPhone: boolean = true
  controller: webview.WebviewController = new webview.WebviewController()

  onPageShow() {
    const windowStage = AppStorage.get<window.WindowStage>("windowStage");
    let params = router.getParams() as RouterParams
    this.title = params.title
    this.url = params.url
    console.info('AboutComponent onPageShow');
    WindowStageUtil.setLayoutFullScreen(windowStage, WindowStageUtil.COLOR_WHITE, WindowStageUtil.COLOR_BLACK, WindowStageUtil.COLOR_WHITE, WindowStageUtil.COLOR_BLACK);
  }

  @Builder
  NavigationTitle() {
    Column() {
      Text(this.title)
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
    Column() {
      // 页面标题
      Navigation()
        .title(this.NavigationTitle())
        .hideToolBar(true)
        .height(56)
        .width('100%')
        .titleMode(NavigationTitleMode.Mini)
        .hideBackButton(false)
      // 加载在线网页
      Web({ src: this.url, controller: this.controller })
        .width('100%')
        .height('100%')
        .padding({ bottom: 56 })
        .javaScriptAccess(true)
        .javaScriptProxy({
          object: this.extObj,
          name: "extObj",
          methodList: ["test"],
          controller: this.controller,
        })
        .fileAccess(true)
        .domStorageAccess(true)
        .onControllerAttached(() => {
          this.controller.loadUrl(this.url)
          this.controller.setCustomUserAgent(this.isPhone ? PHONE_USER_AGENT : PAD_USER_AGENT)
        })
        .onPageBegin((event) => {
          hilog.info(0x0, '[Index]', `onPageBegin= ${JSON.stringify(event)}`)
        })
        .onPageEnd((event) => {
          hilog.info(0x0, '[Index]', `onPageEnd= ${JSON.stringify(event)}`)
        })
        .onProgressChange((event) => {
          hilog.info(0x0, '[Index]', `onProgressChange`)
        })
    }
  }

  aboutToAppear() {
    try {
      let deviceType = systemparameter.getSync("const.build.characteristics")
      // 修改为：default 也认为是 phone
      if (deviceType === 'phone' || deviceType === 'default') {
        this.isPhone = true
      }
    } catch (e) {
      hilog.info(0x0, '[Index]', `getSync unexpected error: ${e}`)
    }
  }

  // 扩展浏览器对象
  extObj: ExtObj = {
    test: (str) => {
      console.log("extObj.test: " + str)
      return "test " + str
    }
  }
}
