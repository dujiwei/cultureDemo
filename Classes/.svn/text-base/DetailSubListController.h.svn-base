//
//  DetailSubListController.h
//  cultureDemo
//
//  Created by 王李 on 11-11-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailViewDataSource;

@interface DetailSubListController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
	id<DetailViewDataSource> _dataSource;
	UINavigationController * _navController;
	UINavigationBar * _navBar;
	UITableView * _tableView;
}

@property (nonatomic, retain) id<DetailViewDataSource> dataSource;
@property (nonatomic, retain) UINavigationController * navController;

- (void)backButtonClicked:(id)sender;

@end
