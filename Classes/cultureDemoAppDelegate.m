//
//  cultureDemoAppDelegate.m
//  cultureDemo
//
//  Created by dujw on 11-10-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cultureDemoAppDelegate.h"
#import "navigatorViewController.h"
#import "baiduMapViewController.h"
#import "SinaWeiboViewController.h"
#import "myPackController.h"
#import "DTNavigationController.h"
@implementation cultureDemoAppDelegate

@synthesize window;
#define FIRSTCONTROLLTITLE @"导览"
#define SECONDCONTROLLTITLE @"地图"
#define THIRDCONTROLLTITLE  @"分享"
#define FOURCONTROLLTITLE @"我的导览"
#define FIVECONTROLLTITLE @"设置"
#define SIXCONTROLLTITLE @"更多应用"
#define SEVENCONTROLLTITLE @"精彩应用推荐"

#define FIRSTIMAGE @"home.png"
#define SECONDIMAGE @"guide.png"
#define THRIDIMAGE @"map.png"
#define FOURIMAGE @"share.png"
#define FIVEIMAGE @"mypack.png"
#define SIXIMAGE @"setting.png"
#define SEVENIMAGE @"moreApp.png"

#define kOAuthConsumerKey @"3411494948" //我的KEY 
#define kOAuthConsumerSecret @"3d2038e04fc698cdcacf92e04d3285d5" //我的Secret

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    done = FALSE;
    
    

	NSTimer *connectionTimer=[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer: connectionTimer forMode:NSDefaultRunLoopMode];
    do{
        [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:8.0]];
    } while (!done);
	
	tabBarController = [[UITabBarController alloc] init];
		
		//--增加导览页面
		navigatorViewController * dtNavController = [[navigatorViewController alloc] init];
		dtNavController.title = FIRSTCONTROLLTITLE;
		UITabBarItem *item = [[UITabBarItem alloc] 
							  initWithTitle:FIRSTCONTROLLTITLE image:[UIImage imageNamed:FIRSTIMAGE] tag:0];
		
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:dtNavController];
		
		//	DTNavigationController *navController = [[DTNavigationController alloc] initWithRootViewController:dtNavController];
		
		navController.tabBarItem = item;
		[navController.navigationBar setBarStyle:UIBarStyleDefault];
		
		[item release];
		[dtNavController release];
		//--增加导览页面结束
		//--增加地图页面
		baiduMapViewController * baiduMap = [[baiduMapViewController alloc] init];
		UINavigationController *mapNavigationController = [[UINavigationController alloc] initWithRootViewController:baiduMap ];
		item = [[UITabBarItem alloc]
				initWithTitle:SECONDCONTROLLTITLE image:[UIImage imageNamed:SECONDIMAGE] tag:1];
		mapNavigationController.tabBarItem = item;
		baiduMap.title = SECONDCONTROLLTITLE;
		[item release];
		[baiduMap release];
		//--增加地图页面结束
	//--增加分享页面
	
	if (!_engine) {
		_engine = [[OAuthEngine alloc] initOAuthWithDelegate: self];
		_engine.consumerKey = kOAuthConsumerKey;
		_engine.consumerSecret = kOAuthConsumerSecret;
	}
	UIViewController *controller = [OAuthController controllerToEnterCredentialsWithEngine: _engine delegate: self];
	
	//这里是要显示授权页面的
	if (controller) 
	{
		shareNavigationController = [[UINavigationController alloc] initWithRootViewController:controller ];
		item = [[UITabBarItem alloc]
				initWithTitle:THIRDCONTROLLTITLE image:[UIImage imageNamed:THRIDIMAGE] tag:2];
		shareNavigationController.tabBarItem = item;
		[item release];
	}
	// //已授权，显示用户微薄
	else {
		NSLog(@"Authenicated for %@..", _engine.username);
		[OAuthEngine setCurrentOAuthEngine:_engine];
		
		
		SinaWeiboViewController * shareSina = [[SinaWeiboViewController alloc] initWithNibName:@"SinaWeiboViewController" bundle:nil];
		shareNavigationController = [[UINavigationController alloc] initWithRootViewController:shareSina ];
		item = [[UITabBarItem alloc]
				initWithTitle:THIRDCONTROLLTITLE image:[UIImage imageNamed:THRIDIMAGE] tag:2];
		shareNavigationController.tabBarItem = item;
		[shareSina newTweet];
		[item release];
		[shareSina release];
		
	}
	
	//--增加分享页面结束
	
		//--增加我的导览页面
		myPackController * myGuide	= [[myPackController alloc] init];
		myGuide.title = FOURCONTROLLTITLE;
		UINavigationController *myGuideNavigationController = [[UINavigationController alloc] initWithRootViewController:myGuide ];
		item = [[UITabBarItem alloc]
				initWithTitle:FOURCONTROLLTITLE image:[UIImage imageNamed:FOURIMAGE] tag:3];
		myGuideNavigationController.tabBarItem = item;
		[item release];
		[myGuide release];
		
		//--增加我的导览页面结束
		//--增加more页面
		
		//--增加more页面结束
		
		//--添加到tabController中。
		NSArray *tempArray = [NSArray arrayWithObjects:navController,
							  mapNavigationController,
							  shareNavigationController,
							  myGuideNavigationController,nil];
		[tabBarController setViewControllers:tempArray];
		
		[navController release];
		[shareNavigationController release];
		[myGuideNavigationController release];
		[mapNavigationController release];
		//--添加到tabController中结束
		[self.window addSubview:tabBarController.view];

  	
	[self.window makeKeyAndVisible];
    
    return YES;
}
-(void)timerFired:(NSTimer *)timer{
	done = YES;
}  

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[tabBarController release];
    [window release];
    [super dealloc];
}


@end
/*
 + (NSData *) SoapCall:(NSString *)method  PostData:(NSString *)post  
 {  
 NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];  
 NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];  
 [postData autorelease];  
 
 NSString *soapAction = [NSString stringWithFormat:@"%s/%@",SoapPrefix , method  ];  
 
 NSURL *url=[[NSURL alloc]initWithString:[ [ NSString alloc ] initWithUTF8String: SoapURL ] ];  
 NSMutableURLRequest  *request=[[NSMutableURLRequest alloc]init];  
 
 [request setTimeoutInterval: 10 ];  
 [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];  
 [request setURL: url ] ;  
 [request setHTTPMethod:@"POST"];   
 [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];    
 [request setValue:soapAction forHTTPHeaderField:@"SOAPAction"];  
 
 [request setValue:postLength forHTTPHeaderField:@"Content-Length"];  
 [request setHTTPBody:postData];    
 
 
 NSError *err=nil;  
 NSData *data=[NSURLConnection sendSynchronousRequest:request  
 returningResponse:nil   
 error:&err];  
 return data ;  
 }  
 
 
 + (NSData *)SoapInvoke:(NSString *)method params:(NSArray *)params  
 {  
 NSMutableString * post = [[ NSMutableString alloc ] init ] ;  
 [ post autorelease ];  
 
 [ post appendString:  
 @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"   
 "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\""  
 " xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\""  
 " xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n"  
 "<soap:Body>\n" ];  
 
 [ post appendString:@"<"];  
 [ post appendString:method];  
 [ post appendString:@">\n"];  
 
 for (NSDictionary *dict in params)  
 {  
 NSString *value = nil;  
 
 NSString *key = [[dict keyEnumerator] nextObject];  
 
 if (key != nil)  
 {  
 value = [dict valueForKey:key];  
 
 [ post appendString:@"<"];  
 [ post appendString:key];  
 [ post appendString:@">"];  
 if( value != nil )  
 {  
 [ post appendString:value];  
 }  
 else  
 {  
 [ post appendString:@""];  
 }  
 
 [ post appendString:@"</"];  
 [ post appendString:key];  
 [ post appendString:@">\n"];  
 }  
 }  
 
 [ post appendString:@"</"];  
 [ post appendString:method];  
 [ post appendString:@">\n"];  
 
 [ post appendString:  
 @"</soap:Body>\n"  
 "</soap:Envelope>\n"  
 ];  
 
 //    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"login" ofType:@"json"];  
 //    NSString *test = [NSString stringWithContentsOfFile:filePath];  
 NSLog(@"====================request=========================\n%@\n", post);  
 
 return [self SoapCall:method PostData:post];  
 }  */
