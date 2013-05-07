
#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import "OAuthController.h"


/*
 SubstitutableDetailViewController defines the protocol that detail view controllers must adopt. The protocol specifies methods to hide and show the bar button item controlling the popover.

 */
@protocol SubstitutableDetailViewController
- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
@end


@interface RootViewController : UITableViewController <UISplitViewControllerDelegate> {
	
	UISplitViewController *splitViewController;
    
    UIPopoverController *popoverController;    
    UIBarButtonItem *rootPopoverButtonItem;
	
	NSDictionary *tDict;
	NSArray *tableData;
	UITableViewCell *ipadHome;
	 UINavigationBar *bar;
	OAuthEngine *_engine;
}
-(void) initForHeadPage;
@property (nonatomic, assign) IBOutlet UISplitViewController *splitViewController;

@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UIBarButtonItem *rootPopoverButtonItem;
@property (nonatomic,retain) UITableViewCell *ipadHome;
@property (nonatomic,retain) IBOutlet UINavigationBar *bar;//用于控制bar的颜色

@end
