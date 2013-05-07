    //
//  subSystemDetailController.m
//  cultureDemo
//
//  Created by dujw on 11-10-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "subSystemDetailController.h"

@implementation subSystemDetailController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithPageNumber:(int)page
{
    if (self = [super init])
    {
        pageNumber = page;
		webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 44, 300, 436)];
    }
    return self;
}

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
	
	
	UIView * view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	self.view = view;
	[self.view setBackgroundColor:[UIColor blackColor]];
	UINavigationBar * navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	[navBar setBackgroundColor:[UIColor blueColor]];
	
	
	[self.view addSubview:navBar];
	
	NSString * path;
	if (pageNumber>0) {
		 path = [[[NSBundle mainBundle] bundlePath] stringByAppendingFormat:@"/content/001.Gugong/info/%d.html", pageNumber];
		NSLog(@"%@",path);
		NSURLRequest * tempR = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
		
		
		[webView loadRequest:tempR];
		
		[self.view addSubview:webView];
		
     }
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
    [super dealloc];
}


@end
