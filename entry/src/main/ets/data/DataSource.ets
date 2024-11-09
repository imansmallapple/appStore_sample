import { HomePageData } from '../model/HomePageData';
import {AppInfo, AppType} from '../model/AppInfo';
import http from '@ohos.net.http';

// 服务器地址
// 本地调试请拉取F-OH-Data仓库到本地，并启动一个静态资源服务器，使用本地服务器，尽量避免使用线上服务器地址
// const ds_server: string = "";
const ds_server: string = "http://80.158.63.151:5000/"
// API Path
const api_homePageData: string = ds_server + "/homePageData.json";
const api_allAppList: string = ds_server + "/allAppList.json";

class DataSource {
  public static allAppList: AppInfo[] = [];

  constructor() {
  }

  /**
   * 获取首页数据
   */
  static getHomePageData(success: Function, error: Function) {
    let httpRequest = http.createHttp();
    httpRequest.request(api_homePageData, {
      method: http.RequestMethod.GET
    }, (err, data) => {
      if (!err && data.responseCode == 200) {
        let dataJson = JSON.parse(data.result as string) as Object
        let dataObj = new HomePageData(dataJson)
        success(dataObj);
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
        error(err);
      }
    });
  }

  /**
   * 获取应用列表数据
   */
  static getAppList(appType: AppType, success: Function) {
    let httpRequest = http.createHttp();
    httpRequest.request(api_allAppList, {
      method: http.RequestMethod.GET
    }, (err, data) => {
      if (!err && data.responseCode == 200) {
        // JSON字符串 转 数组（这里直接 as AppInfo[] 会导致元数据之外的属性不存在）
        let dataArr = JSON.parse(data.result as string) as []
        // 数组 转 数组对象
        let tmpList: AppInfo[] = [];
        dataArr.map((item)=>{
          tmpList.push(new AppInfo(item))
        })
        DataSource.allAppList = tmpList;
        // 过滤类型
        let filterData: AppInfo[] = DataSource.allAppList.filter((item, index, array)=>{
          return item.type == appType;
        })
        success(filterData, dataArr.length);
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    });
  }

  async fetchHttpCode(): Promise<number> {
    try {
      let httpRequest = http.createHttp();
      const response = await new Promise<number>((resolve, reject) => {
        httpRequest.request(ds_server, (err: Error, data: http.HttpResponse) => {
          if (!err) {
            resolve(data.responseCode);
          } else {
            reject(err);
          }
        });
      });
      return response; // 返回响应码
    } catch (error) {
      console.error('Error fetching HTTP code:', error);
      return -1; // 返回一个错误码
    }
  }
}

export {DataSource, ds_server}
