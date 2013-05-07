//
//  DetailMainViewController.h
//  CultureDemo
//
//  Created by 王李 on 11-11-02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScrollView.h"

// 数据源
@protocol DetailViewDataSource<NSObject>

- (NSString *)title;
- (NSString *)guideMapTitle;
- (UIImage *)guideImage;

- (NSString *)subListTitle;
- (NSUInteger)subCount;
- (NSString *)subTitleAtIndex:(NSUInteger)index;
- (NSString *)subHtmlPathAtIndex:(NSUInteger)index;

- (NSUInteger)infoCount;
- (NSString *)infoTitleAtIndex:(NSUInteger)index;
- (NSString *)infoHtmlPathAtIndex:(NSUInteger)index;

@end


// 视图控制器
@interface DetailMainViewController : UIViewController {
	id<DetailViewDataSource> _dataSource;
	NSString * _id;
}

@property (nonatomic, retain) IBOutlet UIButton * backButton;
@property (nonatomic, retain) IBOutlet UIButton * infoButton;
@property (nonatomic, retain) IBOutlet ImageScrollView * guideView;

@property (nonatomic, retain) id<DetailViewDataSource> dataSource;

- (id)initWithId:(NSString *)theId;

- (IBAction)infoButtonClicked:(id)sender;
- (IBAction)backButtonClicked:(id)sender;

- (void)reloadData;
- (void)setFullScreen:(BOOL)fullScreen;

@end
