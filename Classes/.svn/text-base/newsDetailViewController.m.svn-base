    //
//  newsDetailViewController.m
//  cultureDemo
//
//  Created by dujw on 11-11-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "newsDetailViewController.h"
#import "dtCloudDelegate.h"


@implementation newsDetailViewController
@synthesize webView,urlName;
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
	[super loadView];
	
	if(ISPAD()) {
		//self.view = [[UIView alloc] initWithFrame:CGRectMake(320, 200, 703, self.view.bounds.size.height)];
		webView = [[UIWebView alloc] initWithFrame:CGRectMake(320, 200, 703, self.view.bounds.size.height)];
	}
	else {
		webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
	}

	
	self.view  = webView;
	
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:urlName ofType:@"html"]]];
	[webView loadRequest:request];
}
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	if(ISPAD()) {
		//self.view = [[UIView alloc] initWithFrame:CGRectMake(320, 200, 703, self.view.bounds.size.height)];
		//newsView * view = [newsView alloc] initWithFrame:CGRectMake(320, 200, 703, self.view.bounds.size.height)];
		//newsView * webView = [[newsView alloc] initWithFrame:CGRectMake(320, 0, 703, self.view.bounds.size.height)];
		webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 703, self.view.bounds.size.height)];
		//[self.view addSubview: webView];
	}
	else {
		webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
	}
	[self.view addSubview:webView];
	//[self.view setAlpha:0];
	//[self.navigationController setNavigationBarHidden:NO];
	UIBarButtonItem * leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(returnIt)];
	
	[self.navigationItem setLeftBarButtonItem:leftBarItem];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:urlName ofType:@"html"]]];
	[webView loadRequest:request];
	
}
-(void)returnIt
{
	[self.navigationController popViewControllerAnimated:YES];
	//[self.navigationController setNavigationBarHidden:YES];
}

 
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
   // return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
	[webView release];
	[urlName release];
    [super dealloc];
}


@end
