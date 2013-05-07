//
//  navigatorViewController.m
//  cultureDemo
//
//  Created by dujw on 11-10-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "navigatorViewController.h"
#import "subStyleController.h"
#import "dtCloudSlider.h"
#import "meetingOpenViewController.h"
#import "paimaiViewController.h"

static NSString * NINESQUAREGRIDLISTNAME = @"nineSquareGrid";
static NSString * kImageShowKey = @"image";
static NSString * kTitleShowKey = @"title";
static NSString * kImageShowIPADKey = @"imageIpad";
static NSString * kViewControllerKey = @"controller";
static NSString * kSubStyleKey = @"subTitle";
#define COLUMNCOUNT 3
#define BUTTONWIDTH 57
#define BUTTONHEIGHT 57
#define XOFFSET  25 //4个为15

#define YOFFSET 25
 
@implementation navigatorViewController
@synthesize imageNames;
@synthesize subController;
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
   
	subController = [[subStyleController alloc] init];
//	navigationBar=[[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 768, 44)];
//	[self.view addSubview:navigationBar];
	tDict = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:NINESQUAREGRIDLISTNAME ofType:@"plist"]];
			 			 
	UIButton *Btn ;
	UILabel  *label;
	if (ISPAD()) {
		
		
		imageNames =[[ tDict objectForKey:@"items"] retain] ;
		for (int i=0; i<[imageNames count]; i++) {
			CGRect btnframe,labelFrame;
			Btn = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
			[Btn setImage:[UIImage imageNamed:[[imageNames objectAtIndex:i] valueForKey:kImageShowIPADKey ]] forState:UIControlStateNormal];
			Btn.tag = i;
			
			btnframe.size.width = BUTTONWIDTH *2;
			btnframe.size.height = BUTTONHEIGHT *2;
			
			btnframe.origin.x = (i%COLUMNCOUNT) *(BUTTONWIDTH*2 +110) +XOFFSET*2; //4个为20
			btnframe.origin.y = floor(i/COLUMNCOUNT) *(BUTTONHEIGHT*2 +110) +YOFFSET*2;//4个为50
			
			
			
			[Btn setBackgroundColor:[UIColor clearColor]];
			[Btn setFrame:btnframe];
			
			labelFrame.size.width = 100*2;
			labelFrame.size.height = 30*2;
			labelFrame.origin.x = btnframe.origin.x+5;
			labelFrame.origin.y = btnframe.origin.y+100;
			
			label = [[[UILabel alloc] initWithFrame:labelFrame] retain];
			[label setFont:[UIFont systemFontOfSize:22]];
			[label setText:[[imageNames objectAtIndex:i] valueForKey:kTitleShowKey]];
			[label setBackgroundColor:[UIColor clearColor]];
			
			[Btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:Btn];
			[self.view addSubview:label];
			[Btn release];
			[label release];
			
		}
	}
	else
	{
		UIBarButtonItem * backItemButton = [[UIBarButtonItem alloc] init];
		backItemButton.title = @"返回";
		self.navigationItem.backBarButtonItem = backItemButton;
		
		imageNames =[ tDict objectForKey:@"items"] ;
	for (int i=0; i<[imageNames count]; i++) {
		CGRect btnframe,labelFrame;
		Btn = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		[Btn setImage:[UIImage imageNamed:[[imageNames objectAtIndex:i] valueForKey:kImageShowKey ]] forState:UIControlStateNormal];
		Btn.tag = i;
		
		btnframe.size.width = BUTTONWIDTH;
		btnframe.size.height = BUTTONHEIGHT;
		
		btnframe.origin.x = (i%COLUMNCOUNT) *(BUTTONWIDTH +45) +XOFFSET; //4个为20
		btnframe.origin.y = floor(i/COLUMNCOUNT) *(BUTTONHEIGHT +55) +YOFFSET;//4个为50
		

		
		[Btn setBackgroundColor:[UIColor clearColor]];
		[Btn setFrame:btnframe];
		
		labelFrame.size.width = 100;
		labelFrame.size.height = 30;
		labelFrame.origin.x = btnframe.origin.x-5;
		labelFrame.origin.y = btnframe.origin.y+60;
		
		label = [[[UILabel alloc] initWithFrame:labelFrame] retain];
		[label setText:[[imageNames objectAtIndex:i] valueForKey:kTitleShowKey]];
		[label setBackgroundColor:[UIColor clearColor]];
		
		[Btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:Btn];
		[self.view addSubview:label];
		[Btn release];
		[label release];
		
	}
  }
	self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"bj.png"]];
	//self.view.backgroundColor = [UIColor whiteColor];
}

-(void) btnPressed:(id)sender
{

	UIButton * btn = (UIButton *)sender;
	NSUInteger i = btn.tag;
		
	//NSString * tempControllerString = [[self.imageNames objectAtIndex:i] valueForKey:kViewControllerKey];
	//得到类别，根据这个判断执行哪些架构代码
	if (i==0) {
		
		/*meetingOpenViewController * meetingController = [[meetingOpenViewController  alloc] init];
		[meetingController setParamPass:@"01"];
		
		[self.navigationController pushViewController:meetingController animated:YES];
		[meetingController release];*/
		 paimaiViewController * meetingController = [[paimaiViewController  alloc] init];
		 [meetingController setParamPass:@"01"];
		 
		 [self.navigationController pushViewController:meetingController animated:YES];
		 [meetingController release];  
	}
	
	else if 	(i==5) //文化活动
	{
		paimaiViewController * meetingController = [[paimaiViewController  alloc] init];
		[meetingController setParamPass:@"06"];
		
		[self.navigationController pushViewController:meetingController animated:YES];
		//
		[meetingController release];  
		
	}
	
	else if 	(i==6) //会展
	{
		meetingOpenViewController * meetingController = [[meetingOpenViewController  alloc] init];
		[meetingController setParamPass:@"07"];
		
		[self.navigationController pushViewController:meetingController animated:YES];
		[meetingController release];
	}
	else if 	(i==7) //
	{
		paimaiViewController * meetingController = [[paimaiViewController  alloc] init];
		[meetingController setParamPass:@"08"];
		
		[self.navigationController pushViewController:meetingController animated:YES];
		[meetingController release];  
		
	}
	
//	if ([tempControllerString isEqualToString :@"nullForArea" ]) {//区域场合的执行本架构代码
	else
	{
		subController.title = [[imageNames objectAtIndex:i] valueForKey:kTitleShowKey];
	
		[subController setMyData:[[imageNames objectAtIndex:i] valueForKey:kSubStyleKey]];//传递参数
		
	
	    [self.navigationController pushViewController:subController animated:YES];

	}
	
	//[tempControllerString release];
	
	
			

}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
	if (ISPAD())
	{
		//return YES;
		return (interfaceOrientation ==UIInterfaceOrientationLandscapeLeft);
	}
	else {
		 return (interfaceOrientation == UIInterfaceOrientationPortrait);
		
	}

   
}
#pragma mark -
#pragma mark Managing the popover


#pragma mark -
#pragma mark Managing the popover
/*
- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    // Add the popover button to the left navigation item.
//    [navigationBar.topItem setLeftBarButtonItem:barButtonItem animated:NO];
	UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:MENUNAME];  
	navItem.leftBarButtonItem = barButtonItem;  

	[navigationBar pushNavigationItem:navItem animated:NO];
	[navItem release];
	
}


- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    // Remove the popover button.
//    [navigationBar.topItem setLeftBarButtonItem:nil animated:NO];

//	[navigationBar popNavigationItemAnimated:NO];
	
}*/


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	imageNames  = nil;
}
- (void)dealloc {
	[tDict release];
	[subController release];
	[imageNames release];
	//[dtInfoForSpecificItem release];
    [super dealloc];
}


@end
