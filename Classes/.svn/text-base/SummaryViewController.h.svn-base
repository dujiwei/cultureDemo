//
//  SummaryViewController.h
//  CultureDemo
//
//  Created by 王李 on 11-10-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollerController.h"

// 数据源
@protocol SummaryViewDataSource<PhotoScrollerDataSource>

- (NSString *)mainTitle;
- (NSString *)mainDescription;
- (NSString *)subTitleAtIndex:(NSUInteger)index;
- (NSString *)subDescriptionAtIndex:(NSUInteger)index;
- (NSString *)videoFile;

@end


// 视图控制器
@interface SummaryViewController : UIViewController<PhotoScrollerDelegate> {
	PhotoScrollerController * _photoScrollerController;
	id<SummaryViewDataSource> _dataSource;
	NSUInteger _index;
	NSString * _id;
	BOOL _hasDetailData;
}

@property (nonatomic, retain) IBOutlet UIButton * backButton;
@property (nonatomic, retain) IBOutlet UIButton * infoButton;
@property (nonatomic, retain) IBOutlet UIButton * playButton;
@property (nonatomic, retain) IBOutlet UILabel * mainTitleField;
@property (nonatomic, retain) IBOutlet UILabel * mainDescriptionField;
@property (nonatomic, retain) IBOutlet UILabel * subTitleField;
@property (nonatomic, retain) IBOutlet UITextView * subDescriptionField;
@property (nonatomic, retain) IBOutlet UILabel * subIndexField;

@property (nonatomic, retain) PhotoScrollerController * photoScrollerController;
@property (nonatomic, retain) id<SummaryViewDataSource> dataSource;

- (id)initWithId:(NSString *)theId;

- (IBAction)infoButtonClicked:(id)sender;
- (IBAction)backButtonClicked:(id)sender;
- (IBAction)playButtonClicked:(id)sender;

- (void)reloadData;
- (void)imageClicked:(UIGestureRecognizer *)gestureRecognizer;
- (void)setFullScreen:(BOOL)fullScreen;

@end
