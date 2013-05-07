//
//  cultureDemoIpadAppDelegate.h
//  cultureDemo
//
//  Created by dujw on 11-11-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RootViewController;
@class homeViewController_ipad;
@interface cultureDemoIpadAppDelegate : NSObject<UIApplicationDelegate> {
	UIWindow *window;
	UISplitViewController * splitViewController;
		bool done;
	//RootViewController * rootViewController;
//	homeViewController_ipad * detailViewController;
	
	
	 
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) IBOutlet UISplitViewController * splitViewController;
//@property (nonatomic,retain) IBOutlet RootViewController * rootViewController;
//@property (nonatomic,retain) IBOutlet homeViewController_ipad * detailViewController;
@end
