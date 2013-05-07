//
//  paimaiViewController.h
//  cultureDemo
//
//  Created by dujw on 11-11-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface paimaiViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {

	NSMutableArray * tableData;
	
	UITableViewCell *dtCloudTableViewCell;
	UITableView * tableView;
	
	NSArray * dtInfoForSpecificItem;
	NSString *paramPass;
	
}
//@property (nonatomic, retain) UISearchBar *mySearchBar;
@property (nonatomic, retain) UITableView * tableView;
@property (nonatomic,retain) NSMutableArray *tableData;
@property (nonatomic,retain) NSArray * dtInfoForSpecificItem;
@property (nonatomic,copy) NSString * paramPass;
@property (nonatomic,retain) IBOutlet UITableViewCell *dtCloudTableViewCell;

@end
