//
//  SinaWeiboViewController.h
//  SinaWeibo
//
//  Created by fengxiao on 11-11-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboClient.h"
#import "OAuthController.h"
#import "Draft.h"
#import "MBProgressHUD.h"

#define kOAuthConsumerKey				@"3411494948"		//我的KEY 
#define kOAuthConsumerSecret			@"3d2038e04fc698cdcacf92e04d3285d5"		//我的Secret

@class OAuthEngine;
@interface SinaWeiboViewController : UIViewController<MBProgressHUDDelegate> {
	OAuthEngine				*engine;
	WeiboClient *weiboClient;
	UITextView *messageTextField;
	Draft *draft;
	UILabel *wordTips;

}
@property (nonatomic, retain) IBOutlet UITextView *messageTextField;
@property (nonatomic, retain) IBOutlet UILabel *wordTips;
@property (nonatomic)OAuthEngine *engine;
- (void)newTweet;
- (void)loadData;
- (void)focusInput;
- (void)loadTimeline;
- (void)postNewStatus;
@end


