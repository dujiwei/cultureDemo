    //
//  SummaryViewController.m
//  CultureDemo
//
//  Created by 王李 on 11-10-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SummaryViewController.h"
#import "SummaryViewDSFromRes.h"

#import "DetailMainViewController.h"
#import "dtCloudDelegate.h"
#import "DetailViewDSFromFile.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation SummaryViewController

@synthesize backButton;
@synthesize infoButton;
@synthesize playButton;
@synthesize mainTitleField;
@synthesize mainDescriptionField;
@synthesize subTitleField;
@synthesize subDescriptionField;
@synthesize subIndexField;

@synthesize photoScrollerController = _photoScrollerController;
@synthesize dataSource = _dataSource;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (id)initWithId:(NSString *)theId {
//	if (ISPAD()) {
//		self = [self initWithNibName:@"SummaryViewController-ipad" bundle:nil];
//	} else {
//		self = [self initWithNibName:@"SummaryViewController" bundle:nil];
//	}
	self = [self initWithNibName:@"SummaryViewController" bundle:nil];
	
	if (self) {
		_id = [theId copy];
		_dataSource = [[SummaryViewDSFromRes alloc] initWithId:theId];
		_hasDetailData = [DetailViewDSFromFile hasDataWithId:theId];
	}

	return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	self.infoButton.hidden = !_hasDetailData;
	self.playButton.hidden = ![[NSFileManager defaultManager] fileExistsAtPath:[self.dataSource videoFile]];
	
	if (ISPAD()) {
		self.backButton.hidden = YES;
		[self.infoButton removeFromSuperview];
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:self.infoButton] autorelease];

		// 增大排版空间（使得位于视图底部的控件有空间可被放置）
		CGRect viewFrame = self.view.frame;
		viewFrame.size.height = [UIScreen mainScreen].bounds.size.width;
		self.view.frame = viewFrame;
		
		self.title = [_dataSource mainTitle];
	}
	
	// 构造图片滚动器
	CGRect photoScrollerFrame;
	if (ISPAD())
		photoScrollerFrame = CGRectMake(0, 70, 700, 400);
	else
		photoScrollerFrame = CGRectMake(0, 70, 320, 200);
	self.photoScrollerController = [[PhotoScrollerController alloc] initWithFrame:photoScrollerFrame];
	self.photoScrollerController.dataSource = self.dataSource;
	self.photoScrollerController.delegate = self;
	self.photoScrollerController.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.photoScrollerController.view];

	// 为图片滚动器添加单击响应
	UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClicked:)];
	[singleTap setNumberOfTapsRequired:1];	
	[self.photoScrollerController.view addGestureRecognizer:singleTap];
	[singleTap release];

	// 根据图片滚动器的位置，对位于它下方的控件进行排版
	CGFloat offset = self.photoScrollerController.view.frame.origin.y + self.photoScrollerController.view.frame.size.height - self.subTitleField.frame.origin.y + 10;
	self.subTitleField.frame = CGRectOffset(self.subTitleField.frame, 0, offset);
	self.subIndexField.frame = CGRectOffset(self.subIndexField.frame, 0, offset);
	self.subDescriptionField.frame = CGRectOffset(self.subDescriptionField.frame, 0, offset);
	CGRect subDescriptionFrame = subDescriptionField.frame;
	subDescriptionFrame.size.height = self.view.frame.size.height - 22 - self.subDescriptionField.frame.origin.y;
	self.subDescriptionField.frame = subDescriptionFrame;

	// 加载数据
	[self reloadData];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
	return SHOULD_AUTOROTATE_TO_INTERFACE_ORIENTATION(interfaceOrientation);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
	if (!ISPAD()) {
		[self setFullScreen:YES];
	}
}

- (void)viewWillDisappear:(BOOL)animated {
	if (!ISPAD()) {
		[self setFullScreen:NO];
	}
}

- (void)dealloc {
	[self.mainTitleField release];
	[self.mainDescriptionField release];
	[self.subTitleField release];
	[self.subDescriptionField release];
	[self.subIndexField release];
	[_photoScrollerController release];
	[_dataSource release];
	[_id release];
    [super dealloc];
}

- (void)reloadData {
	self.mainTitleField.text = [self.dataSource mainTitle];
	self.mainDescriptionField.text = [self.dataSource mainDescription];
	self.subTitleField.text = [self.dataSource subTitleAtIndex:_index];
	self.subDescriptionField.text = [self.dataSource subDescriptionAtIndex:_index];
	self.subIndexField.text = [NSString stringWithFormat:@"%d/%d", _index + 1, [self.dataSource imageCount]];
}

- (void)photoScrollerIndexDidChange:(PhotoScrollerController *)photoScroller index:(NSUInteger)index {
	_index = index;
	[self reloadData];
}

- (IBAction)infoButtonClicked:(id)sender {
	[self imageClicked:nil];
}

- (IBAction)backButtonClicked:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

//#define MPMovieControlStyle_EmbeddedOrFullscreen

- (IBAction)playButtonClicked:(id)sender {
	self.playButton.enabled = NO;

	NSURL * theUrl = [NSURL fileURLWithPath:[self.dataSource videoFile]];
	MPMoviePlayerController* theMovie=[[MPMoviePlayerController alloc] initWithContentURL:theUrl];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myMovieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:theMovie];
	[self.view addSubview:theMovie.view];
#ifdef MPMovieControlStyle_EmbeddedOrFullscreen
	theMovie.controlStyle = MPMovieControlStyleEmbedded;
	theMovie.view.frame = CGRectMake(0.0f, 0.0f, 600.0f, 400.0f);
#else
	theMovie.controlStyle = MPMovieControlStyleFullscreen;
#endif
	theMovie.fullscreen = YES;
	[theMovie play];
}

- (void)myMovieFinishedCallback:(NSNotification*)aNotification {
    MPMoviePlayerController* theMovie=[aNotification object];
#ifdef MPMovieControlStyle_EmbeddedOrFullscreen
	[theMovie.view removeFromSuperview];
#endif
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:theMovie];
    [theMovie release];

	self.playButton.enabled = YES;
}

- (void)imageClicked:(UIGestureRecognizer *)gestureRecognizer {
	if (_hasDetailData) {
		DetailMainViewController * detailC = [[DetailMainViewController alloc] initWithId:_id];
		[self.navigationController pushViewController:detailC animated:YES];
		[detailC release];
	}
}

- (void)setFullScreen:(BOOL)fullScreen {
	[UIApplication sharedApplication].statusBarHidden = fullScreen;
	[self.navigationController setNavigationBarHidden:fullScreen];
	// tabBar的隐藏通过在初始化方法中设置hidesBottomBarWhenPushed属性来实现。
}

@end
