    //
//  paimaiViewController.m
//  cultureDemo
//
//  Created by dujw on 11-11-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "paimaiViewController.h"
#import "dtCloudDelegate.h"
#import "dataBaseOperate.h"
#import "SummaryViewController.h"
#import "SummaryViewDSFromRes.h"
static NSString * kPaimaiNewsTitleKey = @"newsTitle";
static NSString * kPaimaiNewDescriptionKey = @"newsDescription";
static NSString * kHtmlLoadViewControllerKey = @"viewController";
@implementation paimaiViewController
@synthesize dtCloudTableViewCell;

@synthesize tableData;
@synthesize dtInfoForSpecificItem;
@synthesize tableView;
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


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
	
    [self.view addSubview:tableView];
	dtInfoForSpecificItem = baseDataOfMainStyle(paramPass);
	/*dtInfoForSpecificItem = [[NSArray alloc] initWithObjects:
							[NSDictionary dictionaryWithObjectsAndKeys:
							 @"佳士得印象派与现代艺术主题拍卖惨淡收",kPaimaiNewsTitleKey,
							 @"  国内，各大拍卖公司艺术品秋拍正如火如荼的进行中，国外，纽约佳士得举行于11月1日举行的印象派与现代艺术主题拍卖...",kPaimaiNewDescriptionKey,
							 @"news1.html",kHtmlLoadViewControllerKey,
							 nil],
							 [NSDictionary dictionaryWithObjectsAndKeys:
							  @"秋拍看点：季羡林藏书成交比率达98%",kPaimaiNewsTitleKey,
							  @"  名家效应造就的拍卖热潮是一浪推着一浪，近日，2011年中国嘉德秋拍“季羡林藏书”专场落槌，成交率高达98%...",kPaimaiNewDescriptionKey,
							  @"news2.html",kHtmlLoadViewControllerKey,
							  nil],
							 [NSDictionary dictionaryWithObjectsAndKeys:
							  @"北京艺融2011秋拍七大专场助阵首届拍卖",kPaimaiNewsTitleKey,
							  @"  11月16日至19日，北京艺融国际拍卖有限公司2011年秋季艺术品大型拍卖会将在北京千禧大酒店举行。...",kPaimaiNewDescriptionKey,
							  @"news3.html",kHtmlLoadViewControllerKey,
							  nil],
							 [NSDictionary dictionaryWithObjectsAndKeys:
							  @"荣宝秋拍首次推出当代水墨专场+成交率达72.87%",kPaimaiNewsTitleKey,
							  @"  为期三天的北京荣宝2011秋季艺术品拍卖会已于11月13日完美落槌，而在最后一天中，北京荣宝拍卖公司首次推出的...",kPaimaiNewDescriptionKey,
							  @"news4.html",kHtmlLoadViewControllerKey,
							  nil],
							 nil];*/
}

-(void)viewWillAppear:(BOOL)animated
{
	[tableView reloadData];
	
	
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}*/



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
  //  return (interfaceOrientation == UIInterfaceOrientationPortrait);
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

    UITableViewCell *cell = [tempTableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
	{
        if (ISPAD())
		{
			[[NSBundle mainBundle] loadNibNamed:@"paimaiTableCell-ipad" owner:self options:nil];
			cell = dtCloudTableViewCell;
			
			self.dtCloudTableViewCell = nil;
		}
		else {
			[[NSBundle mainBundle] loadNibNamed:@"paimaiTableCell" owner:self options:nil];
			cell = dtCloudTableViewCell;
			
			self.dtCloudTableViewCell = nil;
		}
		
	}
	UIImageView * imageView; 
	UILabel *label;
	 
	
	imageView = (UIImageView *)[cell viewWithTag:1];  //前面的大图片。
	
	
	
	[imageView setImage:[UIImage imageNamed:[[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kMainImageNameKey]]] ;
	
	//  [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kMainImageNameKey]];
	
    label = (UILabel *)[cell viewWithTag:2];  //顶头的title，为上页带来的title
    label.text = [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kMainTitleKey]; 
	
     label = (UILabel *)[cell viewWithTag:4];//细节显示
     label.text = [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kScoreKey];
	//label.text = @"7公里";
	
	label = (UILabel *)[cell viewWithTag:3];//日期显示
//	 label.text =[[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:kGradeCountKey];
	NSDateFormatter * formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] autorelease]];
	[formatter setDateFormat:@"yyyy年M月d日"];
	NSString * todayString = [formatter stringFromDate:[NSDate date]];
	label.text = todayString;
	
	 
	
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString * theId = [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:@"subCode"];
	
	SummaryViewController * summaryViewController = [[[SummaryViewController alloc] initWithId:theId] autorelease];
	
	[self.navigationController pushViewController:summaryViewController animated:YES];
	[theId release];
	
	
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
