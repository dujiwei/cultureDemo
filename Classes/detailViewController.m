//
//  detailViewController.m
//  cultureDemo
//
//  Created by dujw on 11-10-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "detailViewController.h"
#import "MoveScaleImageView.h"
#import "showSubSystemController.h"
#import "dtCloudDelegate.h"

@implementation detailViewController
@synthesize selectedWhichConfigFile;
@synthesize selectedWhichKeyString;
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
-(void)loadView
{
	[super loadView];
	UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"详情" 
																  style:UIBarButtonItemStyleDone 
																 target:self 
																 action:@selector(detailClick)];
	[self.navigationItem setRightBarButtonItem:rightItem];
	[rightItem release];
	//--读取content文件里面的config.list文件。
	selectedWhichConfigFile = @"Config"; //demo在这里写死
	selectedWhichKeyString = @"001.Gugong";//demo写死
	
	NSString * pConfigPath = [[NSBundle mainBundle] pathForResource:selectedWhichConfigFile ofType:@"plist"];
	
	NSDictionary * temptotalDict = [[NSDictionary alloc]initWithContentsOfFile:pConfigPath];
	
	totalDict = [temptotalDict objectForKey:selectedWhichKeyString];//读取001。gugong的dictronary
	
	NSDictionary * info = [totalDict objectForKey:@"Info"];
	
	NSLog(@"%@",[info description]);
	
	NSArray * Html = [info objectForKey:@"Html"];
	for (int i=0; i<Html.count; i++) {
		NSLog(@"%@",[Html objectAtIndex:i]);
	}
	
	
	
	
	
	
	
	
	UIImage *image = [UIImage imageNamed:@"demo.jpg"];
	MoveScaleImageView * fileContent = [[MoveScaleImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	[fileContent setImage:image];
	[fileContent setBackgroundColor:[UIColor blueColor]];
	self.view = fileContent ;

}
-(void) detailClick
{
	showSubSystemController * showSub = [[showSubSystemController alloc] initWithNibName:@"showSubSystemController" bundle:nil];
    [self presentModalViewController:showSub animated:YES];
	[showSub release ];
	
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
	if (ISPAD())
	{
		return (interfaceOrientation ==UIInterfaceOrientationLandscapeLeft );
		//return YES;
	}
	else {
		return (interfaceOrientation == UIInterfaceOrientationPortrait);
		
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
    [super dealloc];
}


@end
