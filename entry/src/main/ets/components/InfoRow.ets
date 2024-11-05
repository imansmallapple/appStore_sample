import promptAction from '@ohos.promptAction'
import pasteboard from '@ohos.pasteboard'

@Preview
@Component
export struct InfoRow {
  icon?: string | PixelMap | Resource
  title: string | Resource = ''
  info?: string | Resource
  clickHandler?: (event?: ClickEvent) => void
  showRightArrow?: boolean = true

  // constructor(title: string | Resource) {
  //   super()
  //   this.title = title
  // }

  build() {
    Flex({
      direction: FlexDirection.Row,
      justifyContent: FlexAlign.SpaceBetween,
      alignItems: ItemAlign.Center
    }) {
      Image(this.icon).width(26).height(26).borderRadius(13)
        .flexShrink(0)

      Column() {
        Text(this.title).fontSize(16).fontColor('#FF182431').alignSelf(ItemAlign.Start)
        Text(this.info)
          .fontSize(13)
          .fontColor('#99182431')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .alignSelf(ItemAlign.Start)
          .margin({ top: 4 })
      }
      .margin({ left: 14 })
      .alignItems(HorizontalAlign.Center)
      .flexGrow(1)

      if (this.showRightArrow) {
        Image($r('app.media.ic_right_arrow')).width(24).height(24).objectFit(ImageFit.Contain).flexShrink(0)
      }
    }
    .width('100%')
    .height(48)
    .onClick(this.clickHandler || ((e) => {
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,  this.info?.toString() || "")
      pasteboard.getSystemPasteboard()
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.setData(pasteData, (err, data) => {
        if (err) {
          console.error('Failed to set PasteData. Cause: ' + err.message);
          return;
        }
        console.info('Succeeded in setting PasteData.');
        // 提示
        try {
          promptAction.showToast({
            message: getContext(this).resourceManager.getStringSync($r('app.string.Copied')) + this.title,
            duration: 1000,
          });
        } catch (error) {
          console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
        }
        ;
      });
    }))
    .margin({ top: 5, bottom: 5 })
  }
}
