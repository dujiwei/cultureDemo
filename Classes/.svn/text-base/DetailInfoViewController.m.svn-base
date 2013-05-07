    //
//  DetailInfoViewController.m
//  cultureDemo
//
//  Created by 王李 on 11-11-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailInfoViewController.h"
#import "DetailMainViewController.h"
#import "dtCloudDelegate.h"


@implementation DetailInfoViewController

@synthesize dataSource = _dataSource;
@synthesize index = _index;
@synthesize navController = _navController;

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.autoresizesSubviews = YES;
	
	CGRect barFrame = CGRectMake(0, 0, self.view.frame.size.width, 44);
	_navBar = [[UINavigationBar alloc] initWithFrame:barFrame];
	_navBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	UINavigationItem * navItem = [[[UINavigationItem alloc] init] autorelease];
	if (!ISPAD()) {
//		navItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
//																				   target:self 
//																				   action:@selector(backButtonClicked:)] autorelease];
//		navItem.leftBarButtonItem.title = NSLocalizedString(@"Back", @"");
		navItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", @"") 
																	  style:UIBarButtonItemStyleBordered 
																	 target:self 
																	 action:@selector(backButtonClicked:)] autorelease];
	}
	_navBar.items = [NSArray arrayWithObject:navItem];
	[self.view addSubview:_navBar];

	_navBar.topItem.title = [_dataSource infoTitleAtIndex:_index];

	CGFloat barHeight = barFrame.size.height;
	CGRect webFrame = CGRectMake(0, barHeight, self.view.frame.size.width, self.view.frame.size.height - barHeight);
	_webView = [[UIWebView alloc] initWithFrame:webFrame];
	_webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:_webView];

	NSURL * url = [NSURL fileURLWithPath:[_dataSource infoHtmlPathAtIndex:_index]];
	NSURLRequest * req = [NSURLRequest requestWithURL:url];
	[_webView loadRequest:req];
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


- (void)dealloc {
	[_dataSource release];
	[_navController release];
	[_navBar release];
	[_webView release];
    [super dealloc];
}

- (void)backButtonClicked:(id)sender {
	[_navController popViewControllerAnimated:YES];
}


@end
