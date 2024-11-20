/*
 * Copyright (C) 2023 westinyang https://gitee.com/ohos-dev
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
export class AppInfo {
  id: number = 0;
  logo: Resource ;
  name: string | Resource ;
  desc: string | Resource ;

  constructor(id: number = 0, logo: Resource,) {
    this.id = id;
    this.logo = logo;

  }
}
export let AppInfo1: AppInfo = new AppInfo(0, $r('app.media.mock_element'));
AppInfo1.name = 'Element: Secure Messenger';
AppInfo1.desc = 'Encrypted chat for privacy and security.';

export let AppInfo2: AppInfo = new AppInfo(1, $r('app.media.mock_pdf_reader'));
AppInfo2.name = 'PDF Reader: Viewer & Editor';
AppInfo2.desc = 'Read and annotate PDF documents on the go.';

export let AppInfo3: AppInfo = new AppInfo(2, $r('app.media.mock_signal'));
AppInfo3.name = 'Signal: Private Messenger';
AppInfo3.desc = 'Privacy-focused chat app for secure communication.';

export let AppInfo4: AppInfo = new AppInfo(3, $r('app.media.mock_Wikipedia'));
AppInfo4.name = 'Wikipedia: The Free Encyclopedia';
AppInfo4.desc = 'Read and edit articles from the largest free encyclopedia.';
export let mockAppInfo: Array<AppInfo> = [AppInfo1,AppInfo2,AppInfo3,AppInfo4]