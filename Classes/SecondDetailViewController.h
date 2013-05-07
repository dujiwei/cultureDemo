
#import <UIKit/UIKit.h>
#import "RootViewController.h";

@interface SecondDetailViewController : UIViewController <SubstitutableDetailViewController> {
    
    UINavigationBar *navigationBar;
}

@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;

@end
