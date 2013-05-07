

#import "FirstDetailViewController.h"
#import "dtCloudDelegate.h"
#import "SummaryViewController.h"
#import "SummaryViewDSFromRes.h"
#import "dataBaseOperate.h"
#import "DetailSubContainerController.h"
#import "DetailViewDSFromFile.h"
#import "DetailMainViewController.h"
@implementation FirstDetailViewController

@synthesize toolbar,newsTableView,hotTableView,dateLabel;

#pragma mark -
#pragma mark View lifecycle

-(void) viewDidLoad
{
	//imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"tp.png"]];
//	[self.view addSubview:imageView];
	//[imageView release];
	newsTableView.delegate = self;
	newsTableView.dataSource = self;
	hotTableView.delegate = self;
	hotTableView.dataSource = self;
	newsArray = [[NSArray alloc] initWithObjects:@"[社会] 福建一位公交司机边开车边睡觉",
				@"[国际] 英海军“机敏”级核潜艇建造计划将推迟8年",
				 @"[国际] 印度财长说本财年减赤目标恐难完成",
				 @"[国际] 两枚火箭弹在阿富汗大支尔格会议会场附近爆炸",
				 @"[国内] 深圳2011年自发债额度22亿元",
				 nil];
	
	hotArray = [[NSArray alloc] initWithObjects:@"电影《丁丁历险记》国内即将放映",
				@"第七届 舞动北京－群众舞蹈大赛",
				@"京津唐地区最新拍卖资讯",
				@"近期北京名牌展会推荐",
				nil];
   
	NSDateFormatter * formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] autorelease]];
	[formatter setDateFormat:@"yyyy年M月d日 EEEE"];
	NSString * todayString = [formatter stringFromDate:[NSDate date]];
	self.dateLabel.text = todayString;
};

- (void)viewDidUnload {
	[super viewDidUnload];
	
	self.toolbar = nil;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (tableView ==newsTableView) {
		return newsArray.count;
	}
	else {
		return hotArray.count;
	}
 
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tempTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
if (tempTableView == newsTableView) {
	
	static NSString *MyIdentifier = @"MyIdentifierNews";

    UITableViewCell *cell = [tempTableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];	
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	  
	}
	[cell.textLabel setTextColor:[UIColor whiteColor]];
	[cell.textLabel setFont:[UIFont systemFontOfSize:14]];
	
	
		
		cell.textLabel.text = [newsArray objectAtIndex:indexPath.row];
	return cell;
		
	}
	
	if (tempTableView == hotTableView) {
		
		static NSString *MyIdentifier = @"MyIdentifierHots";
		
		UITableViewCell *cell = [tempTableView dequeueReusableCellWithIdentifier:MyIdentifier];
		if (cell == nil) {
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];	
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			
		}
		[cell.textLabel setTextColor:[UIColor whiteColor]];
		[cell.textLabel setFont:[UIFont systemFontOfSize:14]];
		
		
		cell.textLabel.text = [hotArray objectAtIndex:indexPath.row];
		return cell;
	}
	
	
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (tableView == newsTableView) {
		
		NSString * theId = @"01000001";
		
		SummaryViewController * summaryViewController = [[[SummaryViewController alloc] initWithId:theId] autorelease];
		
		[self.navigationController pushViewController:summaryViewController animated:YES];
	}
	else {
		
		switch (indexPath.row) {
			case 0:
			{ 
				NSString * theId = @"03020001";
				DetailViewDSFromFile * dataSource = [[DetailViewDSFromFile alloc] initWithId:theId];
				
				DetailSubContainerController * detailC = [[DetailSubContainerController alloc] init];
				detailC.dataSource = dataSource;
				[self.navigationController pushViewController:detailC animated:YES];
				[detailC release];
				
				[dataSource release];
				break;
			}
			case 1:
			{
				NSString * theId = @"06000003";
				
				SummaryViewController * summaryViewController = [[[SummaryViewController alloc] initWithId:theId] autorelease];
				
				[self.navigationController pushViewController:summaryViewController animated:YES];
				
				break;
			}
			case 2:
			{
				NSString * theId = @"08010001";
				
				SummaryViewController * summaryViewController = [[[SummaryViewController alloc] initWithId:theId] autorelease];
				
				[self.navigationController pushViewController:summaryViewController animated:YES];
				
				break;
			}
			case 3:
			{
				NSString * theId = @"07000001";
				
				SummaryViewController * summaryViewController = [[[SummaryViewController alloc] initWithId:theId] autorelease];
				
				[self.navigationController pushViewController:summaryViewController animated:YES];
				
				break;
			}
				
			default:
				break;
		}
		
	}

}



#pragma mark -
#pragma mark Managing the popover

- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
    // Add the popover button to the toolbar.
    NSMutableArray *itemsArray = [toolbar.items mutableCopy];
    [itemsArray insertObject:barButtonItem atIndex:0];
    [toolbar setItems:itemsArray animated:NO];
    [itemsArray release];
}


- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
    // Remove the popover button from the toolbar.
    NSMutableArray *itemsArray = [toolbar.items mutableCopy];
    [itemsArray removeObject:barButtonItem];
    [toolbar setItems:itemsArray animated:NO];
    [itemsArray release];
}


#pragma mark -
#pragma mark Rotation support

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
   // return YES;
	//return (interfaceOrientation ==UIInterfaceOrientationLandscapeLeft);
	return SHOULD_AUTOROTATE_TO_INTERFACE_ORIENTATION(interfaceOrientation);
	
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[imageView release];
    [toolbar release];
    [super dealloc];
}	


@end
