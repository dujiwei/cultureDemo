    //
//  DetailMainViewController.m
//  CultureDemo
//
//  Created by 王李 on 11-11-02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailMainViewController.h"
#import "DetailViewDSFromFile.h"
#import "DetailSubContainerController.h"
#import "dtCloudDelegate.h"

@implementation DetailMainViewController

@synthesize backButton;
@synthesize infoButton;
@synthesize guideView;

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
	if (self = [self initWithNibName:nil bundle:nil]) {
		_id = [theId copy];
		_dataSource = [[DetailViewDSFromFile alloc] initWithId:theId];
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
	
	if (ISPAD()) {
		self.backButton.hidden = YES;
		[self.infoButton removeFromSuperview];
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:self.infoButton] autorelease];
	}

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
	[_dataSource release];
	[_id release];
    [super dealloc];
}

- (void)reloadData {
	self.title = [_dataSource guideMapTitle];
	UIImage * image = [self.dataSource guideImage];
	[self.guideView displayImage:image];
}

- (IBAction)infoButtonClicked:(id)sender {
	DetailSubContainerController * detailC = [[DetailSubContainerController alloc] init];
	detailC.dataSource = _dataSource;
	[self.navigationController pushViewController:detailC animated:YES];
	[detailC release];
}

- (IBAction)backButtonClicked:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)setFullScreen:(BOOL)fullScreen {
	[UIApplication sharedApplication].statusBarHidden = fullScreen;
	[self.navigationController setNavigationBarHidden:fullScreen];
	// tabBar的隐藏通过在初始化方法中设置hidesBottomBarWhenPushed属性来实现。
}

@end
