
#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

@synthesize window, splitViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	    
	//[window addSubview:splitViewController.view];
    self.window.rootViewController = splitViewController;
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [splitViewController release];
    [window release];
    [super dealloc];
}


@end
