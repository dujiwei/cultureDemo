    //
//  DTNavigationController.m
//  cultureDemo
//
//  Created by dujw on 11-11-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DTNavigationController.h"

#import "dtCloudDelegate.h"
@implementation DTNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
	
    self = [super initWithRootViewController:rootViewController];
	
    self.delegate = self;
	
    return self;
	
}
/*
- (void)loadView {
	
    [super loadView];

    bar = self.navigationBar;

    CALayer*layer = [CALayer layer];
	
   // UIImage *navBarImage = [UIImage imageNamed:@"navigation_bar.png"];
	
   // layer.contents = (id)navBarImage.CGImage;
	
   // layer.frame= CGRectMake(0, 0, 320, navBarImage.size.height);
	
	
	// layer.frame= CGRectMake(0, 0, 320,44);
	
    //[bar.layer insertSublayer:layer atIndex:0];
	
    _barBackLayer = layer;
	
}*/
- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    // Add the popover button to the left navigation item.
	    [self.navigationBar.topItem setLeftBarButtonItem:barButtonItem animated:NO];
	/*UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:MENUNAME];  
	navItem.leftBarButtonItem = barButtonItem;  
	
	[bar pushNavigationItem:navItem animated:NO];
	[navItem release];*/
	
}


- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    // Remove the popover button.
	    [self.navigationBar.topItem setLeftBarButtonItem:nil animated:NO];
	
	//[bar popNavigationItemAnimated:NO];
	
}

#pragma mark -

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
	
    [_barBackLayer removeFromSuperlayer];
	
    [navigationController.navigationBar.layer insertSublayer:_barBackLayer atIndex:0];
	
}

@end
