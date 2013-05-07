    //
//  meetingOpenViewController.m
//  cultureDemo
//
//  Created by dujw on 11-11-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "meetingOpenViewController.h"
#import "dtCloudSlider.h"
#import "detailViewController.h"
#import "dtCloudDelegate.h"
#import "SummaryViewController.h"
#import "SummaryViewDSFromRes.h"
#import "dataBaseOperate.h"

@implementation meetingOpenViewController
@synthesize dtCloudTableViewCell;
@synthesize tableView;
@synthesize tableData;
@synthesize dtInfoForSpecificItem;
@synthesize paramPass;
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
	UIBarButtonItem * backItemButton = [[UIBarButtonItem alloc] init];
	backItemButton.title = @"返回";
	self.navigationItem.backBarButtonItem = backItemButton;
	self.tableView =  [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)
												   style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
	//  [tableView reloadData];
    [self.view addSubview:tableView];
	dtInfoForSpecificItem = meetingDataOfmainStyle(paramPass);
}

-(void)viewWillAppear:(BOOL)animated
{
	[tableView reloadData];
	
	
}



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

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (ISPAD()) 
		return 120;
	else
		return 84;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	//NSLog(@"%d",[dtInfoForSpecificItem count]);
    return [dtInfoForSpecificItem count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tempTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *MyIdentifier = @"MyIdentifier";
	dtCloudSlider *slider;
    UITableViewCell *cell = [tempTableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
		
		if (ISPAD()) {
			[[NSBundle mainBundle] loadNibNamed:@"meetingTableCell-ipad" owner:self options:nil];
			cell = dtCloudTableViewCell;
			
			self.dtCloudTableViewCell = nil;
			slider = [[dtCloudSlider alloc] initWithDTFrame:CGRectMake(185, 65, 200, 60) 
												  leftImage:[UIImage imageNamed:@"ipadLeft.png"] 
												 rightImage:[UIImage imageNamed:@"ipadRight.png"]];
			slider.tag = SLIDER_TAG;
			[cell.contentView addSubview:slider];
		}
		else {
			[[NSBundle mainBundle] loadNibNamed:@"meetingTableCell" owner:self options:nil];
			cell = dtCloudTableViewCell;
			
			self.dtCloudTableViewCell = nil;
			slider = [[dtCloudSlider alloc] initWithDTFrame:CGRectMake(98, 55, 94, 23) 
												  leftImage:[UIImage imageNamed:@"left.png"] 
												 rightImage:[UIImage imageNamed:@"right.png"]];
			slider.tag = SLIDER_TAG;
			[cell.contentView addSubview:slider];
			
	    }
		
		
		
		
    }
	UIImageView * imageView; 
	UILabel *label;
	dtCloudSlider *slide ;
	
	imageView = (UIImageView *)[cell viewWithTag:MAINIMAGE_TAG];  //前面的大图片。
	
	
	
	[imageView setImage:[UIImage imageNamed:[[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kMainImageNameKey]]] ;
	
	//  [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kMainImageNameKey]];
	
    label = (UILabel *)[cell viewWithTag:MAINLABEL_TAG];  //顶头的title，为上页带来的title
    label.text = [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kMainTitleKey]; 
	
    label = (UILabel *)[cell viewWithTag:SECONDLABEL_TAG];//公里显示
    //label.text = [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kDistanceKey];
	label.text = @"7公里";
	
	label = (UILabel *)[cell viewWithTag:DETAIL_TAG];//类别显示
	// label.text =[[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kSubTitleKey];
	label.text = self.title;
	
	slide = (dtCloudSlider *)[cell viewWithTag:SLIDER_TAG]; //滑块图标
	
	
	[slide setValue:[[[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kScoreKey] intValue]];
	
	imageView  = (UIImageView *)[cell viewWithTag:SECONDIMAGE_TAG]; //是否再我的导航里面显示
	NSString * tempValue = [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kSubImageKey];
	if ([tempValue isEqualToString:@"1"]) {
		[imageView setImage:[UIImage imageNamed:@"isMypack.png"]];  //设置大头针，是否在我的导航里面
	}
	imageView  = (UIImageView *)[cell viewWithTag:THIRDIMAGE_TAG]; //是否再我的导航里面显示
	tempValue = [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kThirdImageKey];
	if ([tempValue isEqualToString:@"1"]) {
		[imageView setImage:[UIImage imageNamed:@"isDownLoad.png"]];   //设置，是否已经下载到本地
	}
	//[imageView setImage:[[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kSubImageKey]];
	
	
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString * theId = [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:@"subCode"];
	
	SummaryViewController * summaryViewController = [[[SummaryViewController alloc] initWithId:theId] autorelease];
	
	[self.navigationController pushViewController:summaryViewController animated:YES];
	
	
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
	[tableView release];
	[dtInfoForSpecificItem release];
	[tableData release];
	[dtCloudTableViewCell release];
	
    [super dealloc];
}


@end
