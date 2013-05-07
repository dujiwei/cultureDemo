//
//  showSubSystemController.h
//  cultureDemo
//
//  Created by dujw on 11-10-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface showSubSystemController : UIViewController <UIScrollViewDelegate> {

	UIScrollView *scrollView;
	UIPageControl *pageControl;
	 NSMutableArray *viewControllers;
	// To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;

}
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic,retain)  NSMutableArray *viewControllers;
- (IBAction)changePage:(id)sender;
- (void)loadScrollViewWithPage:(int)page;
@end
