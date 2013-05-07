//
//  DetailSubListController.m
//  cultureDemo
//
//  Created by 王李 on 11-11-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailSubListController.h"
#import "DetailMainViewController.h"
#import "DetailSubDetailViewController.h"
#import "dtCloudDelegate.h"

 ////
@implementation DetailSubListController

@synthesize dataSource = _dataSource;
@synthesize navController = _navController;


#pragma mark -
#pragma mark Initialization


#pragma mark -
#pragma mark View lifecycle

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
	
	_navBar.topItem.title = [_dataSource subListTitle];
	
	CGFloat barHeight = barFrame.size.height;
	CGRect tableFrame = CGRectMake(0, barHeight, self.view.frame.size.width, self.view.frame.size.height - barHeight);
	_tableView = [[[UITableView alloc] initWithFrame:tableFrame] autorelease];
	_tableView.dataSource = self;
	_tableView.delegate = self;
	_tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:_tableView];
	
	[_tableView reloadData];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
	return SHOULD_AUTOROTATE_TO_INTERFACE_ORIENTATION(interfaceOrientation);
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_dataSource subCount];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [_dataSource subTitleAtIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.image = [UIImage imageNamed:@"slider_ball.png"];
    
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
    // Navigation logic may go here. Create and push another view controller.
	DetailSubDetailViewController * detailC = [[DetailSubDetailViewController alloc] init];
	detailC.dataSource = _dataSource;
	detailC.index = indexPath.row;
	[self.navController pushViewController:detailC animated:YES];
	[detailC release];
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
}


- (void)dealloc {
	[_dataSource release];
	[_navController release];
    [super dealloc];
}

- (void)backButtonClicked:(id)sender {
	[_navController popViewControllerAnimated:YES];
}


@end

