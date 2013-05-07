//
//  dataBaseOperate.h
//  cultureDemo
//
//  Created by dujw on 11-11-1.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
/*
 数据库名称：detailData.db
 数据表名：detailOfCity.dbf
 数据表结构：subCode(场景编码),subTitle(场景名称),subStyle(场景所属中类，例如：0201)，mainStyle(所属大类，例如02)
 imageName(代表的image图标名称),用户评测平均分，评分次数，是否加入到我的导览，是否下载。
 
 
 */

#import <Foundation/Foundation.h>
#import "dtCloudDelegate.h"
/*
typedef struct __DetailCityInfo {
	
} DetailCityInfo;
*/
void closeDatabase(void);
BOOL createDetailDataTable (void);
NSArray* getDetailDataOfSubStyle(NSString * subStyle);
NSArray* myPackDataOfSubStyle (NSString * isMyPack);
NSArray* getDetailDataOfShow(NSString * subStyle);
NSArray* meetingDataOfmainStyle (NSString * _mainStyle);
NSArray* baseDataOfMainStyle (NSString * _mainStyle);

