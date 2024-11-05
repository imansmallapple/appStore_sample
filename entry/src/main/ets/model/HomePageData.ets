import { ObjectUtils } from '../utils/ObjectUtils';

class HomePageData {
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