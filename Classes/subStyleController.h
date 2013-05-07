//
//  subStyleController.h
//  cultureDemo
//
//  Created by dujw on 11-10-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class culturePlaceViewController;

@interface subStyleController : UITableViewController {

	NSArray * myData;//数据，从上一级页面传递进来。是上页读取的plist进行的传递
	NSString * title;
	culturePlaceViewController *dhcpController;
	
	
}
@property (nonatomic,retain) culturePlaceViewController *dhcpController;
@property (retain,nonatomic) NSArray * myData;
@property (nonatomic,retain) NSString * title;

@end
