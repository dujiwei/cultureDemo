//
//  culturePlaceViewController.m
//  cultureDemo
//
//  Created by dujw on 11-10-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "culturePlaceViewController.h"

#import "dtCloudSlider.h"
#import "detailViewController.h"
#import "dtCloudDelegate.h"
#import "SummaryViewController.h"
#import "SummaryViewDSFromRes.h"

#import "mapAudioViewController.h"

@implementation culturePlaceViewController
@synthesize mySearchBar;
@synthesize dtCloudTableViewCell;
@synthesize tableView;
@synthesize tableData;
@synthesize dtInfoForSpecificItem;
#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

//	UIBarButtonItem * backItemButton = [[UIBarButtonItem alloc] init];
//	backItemButton.title = @"返回";
//	self.navigationItem.backBarButtonItem = backItemButton;
	
	
	//---创建搜索bar －－用于搜索。
/*	UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:
											[NSArray arrayWithObjects:
											 [UIImage imageNamed:@"segment_search.png"],
											// [UIImage imageNamed:@"segment_tools.png"],
											 nil]];
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
	//segmentedControl.selectedSegmentIndex = 0;
	segmentedControl.momentary = YES;
	segmentedControl.frame = CGRectMake(0, 0, 40, 30);
	[segmentedControl setBackgroundColor:[UIColor clearColor]];
	[segmentedControl setAlpha:0.5];
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
	[self.navigationItem setRightBarButtonItem:rightButton];
	[segmentedControl release];
	*/
/*	
	self.mySearchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 40.0)] autorelease];
    self.mySearchBar.delegate = self;
	self.mySearchBar.showsCancelButton = YES;
	[self.mySearchBar setBackgroundColor:[UIColor blackColor]];
	[self.view addSubview:self.mySearchBar];
	*/
	
	self.tableView =  [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)
								   style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
  //  [tableView reloadData];
    [self.view addSubview:tableView];
    
	
}
- (void)segmentAction:(id)sender
{
	//NSLog(@"segmentAction: selected segment = %d", [sender selectedSegmentIndex]);
	/*switch ([sender selectedSegmentIndex]) {
		case 0:
		
			if (self.mySearchBar.hidden ==YES) {
				
				self.mySearchBar.hidden =NO;
				[self.tableView setCenter:CGPointMake(self.tableView.center.x, self.tableView.center.y+40) ];
			}
			else {
				self.mySearchBar.hidden = YES;
				[self.tableView setCenter:CGPointMake(self.tableView.center.x, self.tableView.center.y-40) ];
			}

			
			break;
		default:
			break;
			
	}*/
	
}

// called when keyboard search button pressed
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[self.mySearchBar resignFirstResponder];
}

// called when cancel button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[self.mySearchBar resignFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated
{
	[tableView reloadData];
/*	 
	if (self.tabBarController.tabBar.hidden ==YES) {
		self.tabBarController.tabBar.hidden = NO;
	}
	if (self.navigationController.navigationBarHidden ==YES) {
		[self.navigationController setNavigationBarHidden:NO];
	}
	if ([UIApplication sharedApplication].statusBarHidden ==YES) {
		[[UIApplication sharedApplication] setStatusBarHidden:NO];
	}*/
	//以上用于判断是否被隐藏了，如果隐藏，则重现。
	
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
			[[NSBundle mainBundle] loadNibNamed:@"guideTableCell-ipad" owner:self options:nil];
			cell = dtCloudTableViewCell;
			
			self.dtCloudTableViewCell = nil;
			slider = [[dtCloudSlider alloc] initWithDTFrame:CGRectMake(185, 65, 200, 60) 
												  leftImage:[UIImage imageNamed:@"ipadLeft.png"] 
												 rightImage:[UIImage imageNamed:@"ipadRight.png"]];
			slider.tag = SLIDER_TAG;
			[cell.contentView addSubview:slider];
		}
		else {
			[[NSBundle mainBundle] loadNibNamed:@"guideTableCell" owner:self options:nil];
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
	label.text = @"推荐";
	
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//更改代码，这里放入：一个viewcontroller， 显示主要的地图，并读取配置文件，把地图的图片，坐标位置做一个标识。在坐标位置生成按钮。
    // 得到对于ID
    NSString * theId = [[dtInfoForSpecificItem objectAtIndex:indexPath.row] objectForKey:@"subCode"];
    NSLog(@"%@",theId);
	//---这里临时性根据subcode判断一下，其他页面都走原来的，只有0403寺庙走新的，给运北京演示,暂时性的
    UIViewController* summaryViewController;
    if ([theId isEqualToString:@"04030001"]) {
        summaryViewController =( mapAudioViewController *) [[[mapAudioViewController alloc] initWithId:theId] autorelease];
    }
    else
    {
        summaryViewController = (SummaryViewController * )[[[SummaryViewController alloc] initWithId:theId] autorelease];
    }
	
	[self.navigationController pushViewController:summaryViewController animated:YES];
	
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	tableView = nil;
}

- (void)dealloc {
	[tableView release];
	[dtInfoForSpecificItem release];
	[tableData release];
	[dtCloudTableViewCell release];
    [super dealloc];
}


@end

