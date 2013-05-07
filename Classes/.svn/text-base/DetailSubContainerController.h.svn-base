//
//  DetailSubContainerController.h
//  cultureDemo
//
//  Created by 王李 on 11-11-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailViewDataSource;

@interface DetailSubContainerController : UIViewController {
	id<DetailViewDataSource> _dataSource;
	NSMutableArray * _viewControllers;
	CGFloat _pageWidth;
}

@property (nonatomic, retain) IBOutlet UIScrollView * container;
@property (nonatomic, retain) IBOutlet UIPageControl * pageControl;

@property (nonatomic, retain) id<DetailViewDataSource> dataSource;

- (IBAction)pageControlValueChanged:(id)sender;

@end
