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
// 定义 Font 接口
export interface Font {
  familyName: string;
  familySrc: string;
}

// 定义 Fonts 对象的接口
// 定义具体的 Fonts 对象类型
interface Fonts {
  semi_bold: Font;
  bold: Font;
  medium: Font;
  light: Font;
  regular: Font;
  extraBold: Font;
  italic: Font;
}

//define fonts as lists of objects
export const fonts: Fonts = {
  semi_bold: {
    familyName: 'SemiBold',
    familySrc: '/font/PlusJakartaSans-semiBold.ttf',
  },
  bold: {
    familyName: 'Bold',
    familySrc: '/font/PlusJakartaSans-Bold.ttf',
  },
  medium:{
    familyName: 'Medium',
    familySrc: '/font/PlusJakartaSans-Medium.ttf',
  },
  light: {
    familyName: 'Light',
    familySrc: '/font/PlusJakartaSans-Light.ttf',
  },
  regular: {
    familyName: 'Regular',
    familySrc: '/font/PlusJakartaSans-Regular.ttf',
  },
  extraBold: {
    familyName: 'ExtraBold',
    familySrc: '/font/PlusJakartaSans-ExtraBold.ttf',
  },
  italic:{
    familyName: 'Italic',
    familySrc: '/font/PlusJakartaSans-Italic.ttf',
  }
};

// export default fonts;
