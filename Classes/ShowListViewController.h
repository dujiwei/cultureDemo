//
//  ShowListViewController.h
//  cultureDemo
//
//  Created by dujw on 11-10-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate> {
	
	NSMutableArray * tableData;
	UISearchBar *mySearchBar;
	UITableViewCell *dtCloudTableViewCell;
	UITableView * tableView;
	//UIScrollView *filterScrollView;
	
	NSArray * dtInfoForSpecificItem;

}
@property (nonatomic, retain) UISearchBar *mySearchBar;
@property (nonatomic, retain) UITableView * tableView;
@property (nonatomic,retain) NSMutableArray *tableData;
@property (nonatomic,retain) NSArray * dtInfoForSpecificItem;

@property (nonatomic,retain) IBOutlet UITableViewCell *dtCloudTableViewCell;
@end
