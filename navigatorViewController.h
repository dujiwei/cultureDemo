//
//  navigatorViewController.h
//  cultureDemo
//
//  Created by dujw on 11-10-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dtCloudDelegate.h"
#import "RootViewController.h"
@class subStyleController;
@interface navigatorViewController : UIViewController {
	
	
	NSArray *imageNames;
	//所要显示的数组，里面包括了每个9宫格按钮所调用的controller的信息。进行封装调用。九宫格数据来源：写死即可。
	//NSMutableArray * dtInfoForSpecificItem;
	//定义字典，用于传递给九宫格调用后的数据，包括logo图片，标题，副标题（公里），分类，评分，是否再导航里面等信息。
		subStyleController * subController;

	NSDictionary *tDict;//配置文件读取
	
	
}
@property (nonatomic,retain) NSArray *imageNames;
@property (nonatomic,retain) subStyleController * subController;

-(void) btnPressed:(id)sender;
-(void) initInfoForSpecificItem: (int) tempi;

@end
