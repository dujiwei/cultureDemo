//
//  DetailMainViewController.h
//  CultureDemo
//
//  Created by 王李 on 11-11-02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NAMapView.h"
#import <AVFoundation/AVFoundation.h>
#import "AudioPlayPanelView.h"
// 数据源
/*@protocol DetailViewDataSource<NSObject>

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

@end*/


// 视图控制器
@interface mapAudioViewController : UIViewController {
	//id<DetailViewDataSource> _dataSource;
	NSString * _id;
    NSArray* _mapDataArray;
    NSString* _rootDir;
    NSDictionary *_data;
    NSString *_operaterDir;
    
    AVAudioPlayer* _player;                    // 播放器
    NSInteger      _curPalyTag;                //当前播放索引
    AudioPlayPanelView *_panelView;            // 播放面板view
    UIView * floatView ;
}
@property (retain, nonatomic) IBOutlet UIButton *actionPlayPanel;
@property (retain, nonatomic)  UILabel* mainLabel ;
@property (nonatomic, retain) IBOutlet UIButton * backButton;
@property (nonatomic, retain) IBOutlet UIButton * infoButton;

@property (retain, nonatomic) IBOutlet NAMapView *guideView;
- (IBAction)actionPlayPanel:(id)sender;

//@property (nonatomic, retain) id<DetailViewDataSource> dataSource;

- (id)initWithId:(NSString *)theId;

- (IBAction)infoButtonClicked:(id)sender;
- (IBAction)backButtonClicked:(id)sender;

- (void)reloadData:(NSUInteger) ACount;
- (void)setFullScreen:(BOOL)fullScreen;

@end
