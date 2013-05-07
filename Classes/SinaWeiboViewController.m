//
//  SinaWeiboViewController.m
//  SinaWeibo
//
//  Created by fengxiao on 11-11-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SinaWeiboViewController.h"
#import "dtCloudDelegate.h"
#import "DTNavigationController.h"
#import "detailViewController.h"

@implementation SinaWeiboViewController
@synthesize messageTextField;
@synthesize wordTips;


- (void)viewDidLoad{
	[super viewDidLoad];
	
	[self setTitle:@"分  享"];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(textChanged:) 
												 name:UITextViewTextDidChangeNotification 
											   object:messageTextField];
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"注销" style:UIBarButtonItemStyleBordered target:self action:@selector(signOut)];
	UIBarButtonItem *composeButton = [[UIBarButtonItem alloc]initWithTitle:@"发表" style:UIBarButtonItemStyleBordered target:self action:@selector(send)];
	[[self navigationItem] setLeftBarButtonItem:backButton];
	[[self navigationItem] setRightBarButtonItem:composeButton];
	[backButton release];
	[composeButton release];
	
	wordTips.text = @"还可输入140字";
	wordTips.textColor = [UIColor grayColor];
	int textwidth = [wordTips.text sizeWithFont:[UIFont systemFontOfSize:15]].width;

	
	if (ISPAD())
	{
		
        messageTextField.frame = CGRectMake(0, 0, 710, 350);
		wordTips.frame = CGRectMake(650, 340, 60, 40);
		wordTips.frame = CGRectMake(680-textwidth, 330, 170, 20);
	}else {
		messageTextField.frame = CGRectMake(0, 0, 320, 204);
		wordTips.frame = CGRectMake(280, 190, 60, 40);
		wordTips.frame = CGRectMake(300-textwidth, 180, 145, 20);
	}
   
}
- (void)signOut{
	messageTextField.text = @"";
    [engine signOut];
    [self loadTimeline];
}

- (void)send{
	
	if (messageTextField.text.length > 140) {
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"分享内容不可以超过140字." delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil];
		[alert show];
		[alert release];
		return;
	}
	
	if ([draft.text isEqualToString:@""]) {
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入分享内容" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil];
		[alert show];
		[alert release];
		return;
	}
	[self postNewStatus];
}
- (void)viewWillAppear:(BOOL)animated{
	[super viewDidAppear:animated];

	[self focusInput];
	[self.navigationController setNavigationBarHidden:NO];
	
	if (!engine) {
		engine = [[OAuthEngine alloc] initOAuthWithDelegate: self];
		engine.consumerKey = kOAuthConsumerKey;
		engine.consumerSecret = kOAuthConsumerSecret;
	}
	[self performSelector:@selector(loadTimeline) withObject:nil afterDelay:0.5];
	
	
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	if (ISPAD())
	{
		
		return YES;
		// return (interfaceOrientation ==UIInterfaceOrientationLandscapeLeft);
	}
	else {
		return (interfaceOrientation == UIInterfaceOrientationPortrait);
		
	}
}
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	messageTextField = nil;
	wordTips = nil;
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[messageTextField release];
	[weiboClient release];
	[wordTips release];
    [super dealloc];
}

- (void)loadTimeline {
	UIViewController *controller = [OAuthController controllerToEnterCredentialsWithEngine: engine delegate: self];
	
	//这里是要显示授权页面的
	if (controller) 
	{
	[self.navigationController pushViewController: controller animated: YES];
	[self.navigationController setNavigationBarHidden:YES];
	}
	//已授权，显示用户微薄
	else {
		NSLog(@"Authenicated for %@..", engine.username);
		[OAuthEngine setCurrentOAuthEngine:engine];
		[self loadData];
		
	}
}
- (void)loadData {
	if (weiboClient) { 
		return;
	}
	//[self focusInput];

}

- (void)focusInput {
	[messageTextField becomeFirstResponder];
}
- (void)textChanged:(NSNotification *)notification{

	int maxLength = 140;
	if (messageTextField.text.length > maxLength){
        wordTips.text = [NSString stringWithFormat:@"已超%d字",messageTextField.text.length-maxLength];
        [wordTips setTextColor:[UIColor redColor]];
    }
    else{
        wordTips.text = [NSString stringWithFormat:@"还可输入%d个字",maxLength-messageTextField.text.length];
        [wordTips setTextColor:[UIColor blackColor]];
		
    }
	draft.text = messageTextField.text;
    int textwidth = [wordTips.text sizeWithFont:[UIFont systemFontOfSize:15]].width;
	wordTips.textColor = [UIColor grayColor];
	if (ISPAD()){
		wordTips.frame = CGRectMake(690-textwidth, 330, 170, 20);
	}else {
		wordTips.frame = CGRectMake(310-textwidth, 180, 145, 20);
	}

    
}

- (void)newTweet {
	[draft release];
	draft = [[Draft alloc]initWithType:DraftTypeNewTweet];
	[self focusInput];
}
- (void)postNewStatus
{
	WeiboClient *client = [[WeiboClient alloc] initWithTarget:self 
													   engine:[OAuthEngine currentOAuthEngine]
													   action:@selector(postStatusDidSucceed:obj:)];
	client.context = [draft retain];
	draft.draftStatus = DraftStatusSending;

	[client post:draft.text];
	
}
- (void)postStatusDidSucceed:(WeiboClient*)sender obj:(NSObject*)obj
{
	Draft *sentDraft = nil;
	if (sender.context && [sender.context isKindOfClass:[Draft class]]) {
		sentDraft = (Draft *)sender.context;
		[sentDraft autorelease];
	}
	
    if (sender.hasError) {
        [sender alert];	
        return;
    }
    
    NSDictionary *dic = nil;
    if (obj && [obj isKindOfClass:[NSDictionary class]]) {
        dic = (NSDictionary*)obj;    
    }
	
    if (dic) {
        Status* sts = [Status statusWithJsonDictionary:dic];
		if (sts) {
			//delete draft!
			if (sentDraft) {
				
			}
		}
    }
	messageTextField.text = @"";

	MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:HUD];
	
	HUD.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] autorelease];
	
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
	
    HUD.delegate = self;
    HUD.labelText = @"分享成功";
	
    [HUD show:YES];
	[HUD hide:YES afterDelay:1];
}

//=============================================================================================================================
#pragma mark OAuthEngineDelegate
- (void) storeCachedOAuthData: (NSString *) data forUsername: (NSString *) username {
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setObject: data forKey: @"authData"];
	[defaults synchronize];
}

- (NSString *) cachedOAuthDataForUsername: (NSString *) username {
	return [[NSUserDefaults standardUserDefaults] objectForKey: @"authData"];
}

- (void)removeCachedOAuthDataForUsername:(NSString *) username{
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults removeObjectForKey: @"authData"];
	[defaults synchronize];
}
//=============================================================================================================================
#pragma mark OAuthSinaWeiboControllerDelegate
- (void) OAuthController: (OAuthController *) controller authenticatedWithUsername: (NSString *) username {
	NSLog(@"Authenicated for %@", username);
	[self.navigationController popViewControllerAnimated:YES];
	
}

- (void) OAuthControllerFailed: (OAuthController *) controller {
	NSLog(@"Authentication Failed!");
	
}

- (void) OAuthControllerCanceled: (OAuthController *) controller {
	NSLog(@"Authentication Canceled.");
	
}

@end
