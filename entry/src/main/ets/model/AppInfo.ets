

// todo: uncomment after import ds_server
// class AppInfo {
//   constructor(source: Partial<AppInfo>) {
//     Object.assign(this, source);
//   }
//
//   /* 元数据 */
//   id: number
//   name: string
//   desc: string
//   icon: string
//   vender: string
//   packageName: string
//   version: string
//   hapUrl: string
//   type: string
//   tags: string
//   openSourceAddress: string
//   releaseTime: string
//
//   /* 扩展数据 */
//   // 应用状态
//   status: AppStatus = AppStatus.NOT_INSTALLED
//   // 操作按钮文本
//   actionText: AppActionText = AppActionText.INSTALL
//
//   getIcon() {
//     return this.icon ? ds_server + this.icon : this.icon;
//   }
//
//   getHapUrl() {
//     return this.hapUrl ? ds_server + this.hapUrl : this.hapUrl;
//   }
//
//   public ResourceToString(resource:Resource):string{
//     return getContext(this).resourceManager.getStringSync(resource)
//   }
//
// }

enum AppType {
  APP = 'app',
  GAME = 'game'
}

enum AppStatus {
  NOT_INSTALLED = 0,  // 未安装
  INSTALLED = 1,      // 已安装
  UPDATABLE = 2,      // 可更新
}

enum AppActionText {
  OPEN = "打开",
  INSTALL = "安装",
  UPDATE = "更新"
}
