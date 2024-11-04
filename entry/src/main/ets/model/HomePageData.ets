import { ObjectUtils } from '../utils/ObjectUtils';

class HomePageData {
  // static defaultAnnouncement = 'F-OH 是一个 OpenHarmony 平台上 FOSS（Free and Open Source Software，自由开源软件）的应用中心';
  static defaultAnnouncement = '';

  constructor(source: Partial<Object>) {
    ObjectUtils.assign(this, source as Object);
  }

  // 显示公告
  showAnnouncement: boolean = true;
  // 公告内容
  announcement: string = "";
}

export {HomePageData}