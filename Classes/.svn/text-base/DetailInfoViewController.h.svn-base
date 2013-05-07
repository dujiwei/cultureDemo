//
//  DetailInfoViewController.h
//  cultureDemo
//
//  Created by 王李 on 11-11-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DetailViewDataSource;

@interface DetailInfoViewController : UIViewController {
	id<DetailViewDataSource> _dataSource;
	NSUInteger _index;
	UINavigationController * _navController;
	UINavigationBar * _navBar;
	UIWebView * _webView;
}

@property (nonatomic, retain) id<DetailViewDataSource> dataSource;
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, retain) UINavigationController * navController;

- (void)backButtonClicked:(id)sender;

@end
