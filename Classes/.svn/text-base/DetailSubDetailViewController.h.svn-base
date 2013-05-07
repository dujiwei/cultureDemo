//
//  DetailSubDetailViewController.h
//  cultureDemo
//
//  Created by 王李 on 11-11-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DetailViewDataSource;

@interface DetailSubDetailViewController : UIViewController {
	id<DetailViewDataSource> _dataSource;
	NSUInteger _index;
	UIWebView * _webView;
}

@property (nonatomic, retain) id<DetailViewDataSource> dataSource;
@property (nonatomic, assign) NSUInteger index;

@end
