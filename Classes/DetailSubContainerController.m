//
//  DetailSubContainerController.m
//  cultureDemo
//
//  Created by 王李 on 11-11-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailSubContainerController.h"
#import "DetailMainViewController.h"
#import "DetailSubListController.h"
#import "DetailInfoViewController.h"
#import "dtCloudDelegate.h"


@implementation DetailSubContainerController

@synthesize container;
@synthesize pageControl;

@synthesize dataSource = _dataSource;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = [_dataSource title];
	self.view.backgroundColor = [UIColor blackColor];

	// 计算分页相关尺寸等
	BOOL hasSubList = [_dataSource subCount] > 0;
	NSUInteger childCount = [_dataSource infoCount] + (hasSubList ? 1 : 0);
	self.pageControl.numberOfPages = childCount;
	CGRect pageFrame = self.container.frame; // iPhone上：一屏1页
	if (ISPAD()) {
		pageFrame.size.width = 351; // iPad上：一屏2页
		CGRect containerFrame = self.container.frame;
		containerFrame.size.width = pageFrame.size.width * 2;
		self.container.frame = containerFrame;
	}
	_pageWidth = pageFrame.size.width;
	self.container.contentSize = CGSizeMake(pageFrame.size.width * childCount, pageFrame.size.height);
	self.container.backgroundColor = [UIColor grayColor];
	_viewControllers = [[NSMutableArray alloc] initWithCapacity:childCount];
	
	CGRect childFrame = CGRectMake(0, 0, pageFrame.size.width - 1, pageFrame.size.height);

	// 生成第一个分页
	if (hasSubList) {
		DetailSubListController * subList = [[[DetailSubListController alloc] init] autorelease];
		[_viewControllers addObject:subList];
		subList.dataSource = _dataSource;
		subList.navController = self.navigationController;
		subList.view.frame = childFrame;
		childFrame.origin.x = childFrame.origin.x + pageFrame.size.width;
		subList.view.autoresizingMask = UIViewAutoresizingFlexibleHeight; // 高度自动，宽度固定。
		[self.container addSubview:subList.view];
	}

	// 生成其他分页
	for (int i = 0; i < [_dataSource infoCount]; ++i) {
		DetailInfoViewController * childViewController = [[[DetailInfoViewController alloc] init] autorelease];
		[_viewControllers addObject:childViewController];
		childViewController.dataSource = _dataSource;
		childViewController.index = i;
		childViewController.navController = self.navigationController;
		childViewController.view.frame = childFrame;
		childFrame.origin.x = childFrame.origin.x + pageFrame.size.width;
		childViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight; // 高度自动，宽度固定。
		[self.container addSubview:childViewController.view];
	}
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
	return SHOULD_AUTOROTATE_TO_INTERFACE_ORIENTATION(interfaceOrientation);
}

- (void)viewWillAppear:(BOOL)animated {
	if (!ISPAD()) {
		[self.navigationController setNavigationBarHidden:YES];
	}
}

- (void)viewWillDisappear:(BOOL)animated {
	if (!ISPAD()) {
		[self.navigationController setNavigationBarHidden:NO];
	}
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


- (void)dealloc {
	[_dataSource release];
	[_viewControllers release];
    [super dealloc];
}

- (void)setPageControlByScrollView {
	NSUInteger newPage = self.container.contentOffset.x / _pageWidth;
	if (newPage != self.pageControl.currentPage) {
		self.pageControl.currentPage = newPage;
	}
}

- (void)setScrollViewByPageControl {
	NSUInteger oldPage = self.container.contentOffset.x / _pageWidth;
	NSUInteger newPage = self.pageControl.currentPage;
	if (newPage != oldPage) {
		self.container.contentOffset = CGPointMake(_pageWidth * newPage, 0);
	}
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate { // called on finger up if user dragged. decelerate is true if it will continue moving afterwards
	[self setPageControlByScrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {      // called when scroll view grinds to a halt
	[self setPageControlByScrollView];
}

- (IBAction)pageControlValueChanged:(id)sender {
	[self setScrollViewByPageControl];
}

@end
