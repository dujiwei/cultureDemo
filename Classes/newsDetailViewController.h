//
//  newsDetailViewController.h
//  cultureDemo
//
//  Created by dujw on 11-11-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface newsDetailViewController : UIViewController {

	UIWebView * webView;
	NSString * urlName;
}
@property (nonatomic,retain) UIWebView *webView;
@property (nonatomic,copy) NSString * urlName;
@end
