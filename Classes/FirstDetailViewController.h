


#import <UIKit/UIKit.h>
#import "RootViewController.h";

@interface FirstDetailViewController : UIViewController <UITableViewDelegate,UITableViewDataSource, SubstitutableDetailViewController> {

    UIToolbar *toolbar;
	UIImageView * imageView;
	UITableView * newsTableView;
	UITableView * hotTableView;
	NSArray *newsArray;
	NSArray *hotArray;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UITableView * newsTableView;
@property (nonatomic, retain) IBOutlet UITableView * hotTableView;
@property (nonatomic, retain) IBOutlet UILabel * dateLabel;

@end
