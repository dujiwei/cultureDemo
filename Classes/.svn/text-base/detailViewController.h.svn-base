//
//  detailViewController.h
//  cultureDemo
//
//  Created by dujw on 11-10-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
/*
   设计思路：
 
    controller： detailViewController
    
	modual:
 
        读取config.list文件里面的值，存储到数组或者dictronary中，
        config.list设计模式如下：
          每个主题对应一个list文件，避免list文件过大。
          采用config1.list的方式。
       目前demo就只读取config.list文件。			
    view：
     点击进入，显示相关的场景信息。
 
 
 */

#import <UIKit/UIKit.h>


@interface detailViewController : UIViewController {

	UIScrollView * scrollView;
	NSString * selectedWhichConfigFile;//前一个页面传递过来，用于核定究竟是调用哪个config.plist，例如文化场馆是config1.plist
	NSString * selectedWhichKeyString ;//前一个页面窜底过来，用于核定config.plist里面究竟选中的是哪个场景。例如001－gugong代表故宫
    NSDictionary *totalDict;
	NSArray *AudioArray;
	NSDictionary *InfoDictionary;
}
@property (nonatomic,retain) NSString *selectedWhichConfigFile;
@property (nonatomic,retain) NSString * selectedWhichKeyString;
-(void) detailClick;
@end
