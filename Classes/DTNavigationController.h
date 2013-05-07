//
//  DTNavigationController.h
//  cultureDemo
//
//  Created by dujw on 11-11-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "RootViewController.h"
@interface DTNavigationController : UINavigationController<UINavigationControllerDelegate,SubstitutableDetailViewController> {
 CALayer *_barBackLayer;
	
}

@end

