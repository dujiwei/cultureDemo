//
//  myPackController.h
//  cultureDemo
//
//  Created by dujw on 11-11-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface myPackController : UIViewController <UITableViewDelegate,UITableViewDataSource> {
	
	NSMutableArray * tableData;
	
	UITableViewCell *dtCloudTableViewCell;
	UITableView * tableView;
	
	NSArray * dtInfoForSpecificItem;
	
}
//@property (nonatomic, retain) UISearchBar *mySearchBar;
@property (nonatomic, retain) UITableView * tableView;
@property (nonatomic,retain) NSMutableArray *tableData;
@property (nonatomic,retain) NSArray * dtInfoForSpecificItem;

@property (nonatomic,retain) IBOutlet UITableViewCell *dtCloudTableViewCell;

@end
