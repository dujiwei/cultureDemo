    //
//  DetailMainViewController.m
//  CultureDemo
//
//  Created by  on 11-11-02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "mapAudioViewController.h"
#import "DetailViewDSFromFile.h"
#import "DetailSubContainerController.h"
#import "dtCloudDelegate.h"
#import "SummaryViewController.h"
#import "NAPinAnnotationView.h"
#import "ShowWebViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "AudioPlayPanelView.h"
#import "NAPinAnnotationView.h"
#define IPHONE_SHOW_VIEWSIZE 100
@implementation mapAudioViewController

@synthesize actionPlayPanel = _actionPlayPanel;
@synthesize backButton;
@synthesize infoButton;
@synthesize guideView;
@synthesize mainLabel;

//@synthesize dataSource = _dataSource;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}


- (id)initWithId:(NSString *)theId {
	if (self = [self initWithNibName:@"mapAudioViewController" bundle:nil]) {
        _rootDir = [[NSString alloc] initWithFormat:@"%@/content/%@_summary", [[NSBundle mainBundle] resourcePath], theId];
		NSLog(@"%@",_rootDir);  //dujw
		NSString * path = [NSString stringWithFormat:@"%@/%@_summary.plist", _rootDir, theId];
        NSData *plistData = [NSData dataWithContentsOfFile:path];
        NSString *error; NSPropertyListFormat format;
        // 得到.plist文件
        _data = [[NSPropertyListSerialization propertyListFromData:plistData
												  mutabilityOption:NSPropertyListImmutable
															format:&format
												  errorDescription:&error]
				 retain];
        if (!_data) {
            NSLog(@"Failed to read plist. Error: %@", error);
            [error release];
        }
		
        NSString *mainDes = [_data objectForKey:@"mainDescription2"];
		_id = [theId copy];
        //----增加一个浮动窗口
       
        UIButton* imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        CGRect floatRect ;
        if (ISPAD()) {
            _mapDataArray = [_data objectForKey:@"Audio"];
            floatRect = CGRectMake(0.0, 620, 705, 100);
            mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 520, 80)];
           
            [imageButton setFrame:CGRectMake(550, 2, 100, 80)];

        }
        else
        {
          /* floatRect = CGRectMake(0.0, 320, 320, 60);
             mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 240, 40)];
            [imageButton setFrame:CGRectMake(260, 2, 60, 40)];*/
            _mapDataArray = [_data objectForKey:@"Audio_iphone"];
            //得到bundle的尺寸
           CGRect rect = [[UIScreen mainScreen] applicationFrame];
            
            floatRect = CGRectMake(0.0, rect.size.height-IPHONE_SHOW_VIEWSIZE, rect.size.width, IPHONE_SHOW_VIEWSIZE);
            mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, rect.size.width-IPHONE_SHOW_VIEWSIZE,  IPHONE_SHOW_VIEWSIZE)];
            [imageButton setFrame:CGRectMake(rect.size.width - 70, 2, 60,50 )];

        }
        
        floatView = [[UIView alloc] initWithFrame:floatRect];
        [floatView setAlpha:0.7];
       
        [floatView setBackgroundColor:[UIColor lightGrayColor]];
        //设置阴影
        [[floatView layer] setShadowOffset:CGSizeMake(1, 1)];
        [[floatView layer] setShadowRadius:5];
        [[floatView layer] setShadowOpacity:1];
        [[floatView layer] setShadowColor:[UIColor blackColor].CGColor];
        //shebiankuang
        [[floatView layer] setCornerRadius:5];
        [[floatView layer] setBorderWidth:1];
        [[floatView layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        
       
       
        [mainLabel setBackgroundColor:[UIColor clearColor]];
        [mainLabel setNumberOfLines:0];
        [mainLabel setFont:[UIFont fontWithName:@"Arial" size:16]];
        [mainLabel setText:mainDes];
              [imageButton setTitle:@"出  发" forState:UIControlStateNormal];
        [imageButton addTarget:self action:@selector(beginButton:) forControlEvents:UIControlEventTouchUpInside];
        [floatView addSubview:mainLabel];
        [floatView addSubview:imageButton];
        [mainLabel release];
        //[imageButton release];
        [self.view addSubview:floatView];
        
		
	}
	
	return self;
}
-(void)beginButton:(id)sender
{
   // [self reloadData];
    [floatView removeFromSuperview];
}
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/
// 详情响应函数
- (void)AccessoryViewAction:(id)sender {
    UIButton *accessoryView = (UIButton*)sender;
    
    NSString  *rootDirInfo = [[NSString alloc] initWithFormat:@"%@/content/%@_detail", [[NSBundle mainBundle] resourcePath], _id];
	
    NSString *temp= [NSString stringWithFormat:@"%@/subList",rootDirInfo];
    [rootDirInfo release];
    NSString * infoIntroduce = [NSString stringWithFormat:@"%@/%@",temp,[[_mapDataArray objectAtIndex:accessoryView.tag] objectForKey:@"infoIntroduce"]];
    ShowWebViewController * webController = [[ShowWebViewController alloc] init];
    webController.title =  [[_mapDataArray objectAtIndex:accessoryView.tag] objectForKey:@"areaName"];
    webController.url =infoIntroduce;
	[self.navigationController pushViewController:webController animated:YES];
	[webController release];
   

}
- (void)setCurAnnotationState:(bool)state {
    
    if(_curPalyTag == -1) return;
    NAPinAnnotationView *annontation = [guideView.annotationViews objectAtIndex:_curPalyTag];
    if(state == YES) {
        for(int i=0; i < guideView.annotationViews.count; i++) {   // 其他的置为NO
            NAPinAnnotationView *annontationTmpt = [guideView.annotationViews objectAtIndex:i];
            annontationTmpt.annotation.isPlayAudio = NO;
            UIImage * image = [UIImage imageNamed:@"bubbleplay.png"];
            [annontationTmpt.annotation.rightCalloutAudioView setImage:image forState:UIControlStateNormal];
        }
        
        UIImage * image = [UIImage imageNamed:@"bubblepause.png"];
        [annontation.annotation.rightCalloutAudioView  setImage:image forState:UIControlStateNormal];
    } else{
        UIImage * image = [UIImage imageNamed:@"bubbleplay.png"];
        [annontation.annotation.rightCalloutAudioView  setImage:image forState:UIControlStateNormal];
        annontation.annotation.isPlayAudio = YES;
    }
}
// 播放音乐响应函数
- (void)AudioViewAction:(id)sender {
    
    UIButton *audioView = (UIButton*)sender;
    NAPinAnnotationView *annontation = [guideView.annotationViews objectAtIndex:audioView.tag];
    
    if(_curPalyTag != audioView.tag)   {   
        if(_player != nil) {
            [_player stop];
            [_player release];
        }
        NSString  *rootDirInfo = [[NSString alloc] initWithFormat:@"%@/content/%@_detail", [[NSBundle mainBundle] resourcePath], _id];
        NSString *temp= [NSString stringWithFormat:@"%@/subList",rootDirInfo];
        [rootDirInfo release];
        NSString * audioName = [NSString stringWithFormat:@"%@/%@",temp,[[_mapDataArray objectAtIndex:audioView.tag] objectForKey:@"audioName"]];
        
        if (audioName) {
            NSURL *musicURL = [NSURL fileURLWithPath:audioName];
            
            _player = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL 
                                                             error:nil];
            if(_panelView!=nil) {
                [_panelView initwithAudioPlayer:_player];
            }
            _player.delegate = self;
        }
    }

    if(annontation.annotation.isPlayAudio==NO){
 
        for(int i=0; i < guideView.annotationViews.count; i++) {   // 其他的置为NO
            NAPinAnnotationView *annontationTmpt = [guideView.annotationViews objectAtIndex:i];
            annontationTmpt.annotation.isPlayAudio = NO;
            UIImage * image = [UIImage imageNamed:@"bubbleplay.png"];
            [annontationTmpt.annotation.rightCalloutAudioView setImage:image forState:UIControlStateNormal];
        }
        
        UIImage * image = [UIImage imageNamed:@"bubblepause.png"];
        [audioView setImage:image forState:UIControlStateNormal];
        annontation.annotation.isPlayAudio = YES; 
        
        //NSString *musicPath = [[NSBundle mainBundle] pathForResource:audioName
                                                            //ofType:@"aac"];
        if(_player != nil){
            [_player prepareToPlay];
            [_player play];//播放
        }
        _curPalyTag = audioView.tag;
        if(guideView.scrollEnabled == YES)    // 动画期间不显示
        _actionPlayPanel.hidden = NO;
    } else {
        annontation.annotation.isPlayAudio = NO;   
        UIImage * image = [UIImage imageNamed:@"bubbleplay.png"];
        [audioView setImage:image forState:UIControlStateNormal];
        _curPalyTag = audioView.tag;
        if(_player != nil) [_player stop];//停止 
       // _actionPlayPanel.hidden = YES;
    }
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer*)player successfully:(BOOL)flag{  
    //播放结束时执行的动作
    NAPinAnnotationView *annontation = [guideView.annotationViews objectAtIndex:_curPalyTag];
    annontation.annotation.isPlayAudio = NO;
    UIImage * image = [UIImage imageNamed:@"bubbleplay.png"];
    [annontation.annotation.rightCalloutAudioView setImage:image forState:UIControlStateNormal];
//    [_player release];
//    _player = nil;
//    _actionPlayPanel.hidden = YES;
}  
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer*)player error:(NSError *)error{  
    //解码错误执行的动作  
}  
- (void)audioPlayerBeginInteruption:(AVAudioPlayer*)player{  
    //处理中断的代码  
}  
- (void)audioPlayerEndInteruption:(AVAudioPlayer*)player{  
    //处理中断结束的代码  
}  
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
       // 初始化参数
    _player  = nil;
    _curPalyTag = -1;
	//if (ISPAD()) {
    self.backButton.hidden = YES;
    [self.infoButton removeFromSuperview];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:self.infoButton] autorelease];
   //}
    if(ISPAD()) {
        CGRect frame = CGRectMake(635, _actionPlayPanel.frame.origin.y, _actionPlayPanel.frame.size.width, _actionPlayPanel.frame.size.height);
        _actionPlayPanel.frame = frame;

    } else {
        CGRect frame = CGRectMake(_actionPlayPanel.frame.origin.x+20, _actionPlayPanel.frame.origin.y, 40, 40);
        _actionPlayPanel.frame = frame;
        
    }
    _actionPlayPanel.hidden = YES;
    NSArray *arrary ;
    // 添加 播放面板
    if(ISPAD()) {
         arrary = [[NSBundle  mainBundle] loadNibNamed:@"AudioPlayPanelView-ipad" owner:self options:nil];
    }
    else 
    {
        arrary = [[NSBundle  mainBundle] loadNibNamed:@"AudioPlayPanelView" owner:self options:nil];
    }
        
   _panelView = [arrary objectAtIndex:0];

    AudioPlayPanelView *bb = _panelView;
    [self.view insertSubview:bb atIndex:0];
    [_panelView playStateCallBack:^(bool state){   // 监控_panelView播放状态
        [self setCurAnnotationState:state];
    }];
                             

    
    self.title =[_data objectForKey:@"mainTitle"];

    guideView.backgroundColor = [UIColor colorWithRed:0.000 green:0.475 blue:0.761 alpha:1.000];
    
    guideView.minimumZoomScale = 0.5;
    guideView.maximumZoomScale = 1.5;
    
    _operaterDir = [NSString stringWithFormat:@"%@/mapInfo",_rootDir];
    
    UIImage * image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",_operaterDir,[[_mapDataArray objectAtIndex:0] objectForKey:@"mapName"]]];
    
    [guideView displayMap:image];
    //[image release];

    //----增加按钮
    UISegmentedControl * sControll = [[[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"2小时",@"3小时",@"5小时", nil]] autorelease];
    sControll.momentary = YES;
    sControll.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    sControll.segmentedControlStyle = UISegmentedControlStyleBar;
    // [self.navigationController.navigationItem setTitleView:sControll ];
   
   sControll.frame = CGRectMake(0, 0, 200, 40);
    [sControll addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
     self.navigationItem.titleView = sControll;
	// 加载数据
	[self reloadData:4];
}
-(void) segmentAction:(id)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            //2xiaoshi
        {
             [mainLabel setText:[_data objectForKey:@"mainDescription2"]];
            [self reloadData:3];
            break;
        }
        case 1:
            //2xiaoshi
        {
            [mainLabel setText:[_data objectForKey:@"mainDescription3"]];
            [self reloadData:5];
            break;
        }

        case 2:
            //2xiaoshi
        {
            [mainLabel setText:[_data objectForKey:@"mainDescription5"]];
            [self reloadData:7];//临时做一下，后续从配置文件中读取
            break;
        }

        default:
            break;
    };
}
//-(void) reload
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event 
{
	[super touchesBegan:touches withEvent:event];
	[[self nextResponder] touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *)event 
{
	[super touchesMoved:touches withEvent:event];
	[[self nextResponder] touchesMoved:touches withEvent:event];
}
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
	return SHOULD_AUTOROTATE_TO_INTERFACE_ORIENTATION(interfaceOrientation);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [self setGuideView:nil];
    [self setActionPlayPanel:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {

    [_panelView startTimer];
	if (!ISPAD()) {
		[self setFullScreen:YES];
	}
}

-(void) viewDidDisappear:(BOOL)animated{
    [_panelView stopTimer];
}
- (void)viewWillDisappear:(BOOL)animated {
    NSArray *viewControllers = self.navigationController.viewControllers; 
    //采用下面机制来判断viewcontroller是否消除
    if (viewControllers.count > 1 && [viewControllers objectAtIndex:viewControllers.count-2] == self) { 
        // View is disappearing because a new view controller was pushed onto the stack  
        NSLog(@"New view controller was pushed"); 
    } else if ([viewControllers indexOfObject:self] == NSNotFound) { 
        // View is disappearing because it was popped from the stack 
        NSLog(@"View controller was popped"); 
       [_panelView stopAudioPaly];
    } else {                                // 点split 退出的时候
        [_panelView stopAudioPaly];
    }
	if (!ISPAD()) {
		[self setFullScreen:NO];
	}
}

- (void)dealloc {
	//[_dataSource release];
	[_id release];
    [mainLabel release];
    [floatView release];
    [guideView release];
    if(_player != nil) {
        [_player stop];
        [_player release];
    }
    [_actionPlayPanel release];
    [super dealloc];
}

- (void)reloadData:(NSUInteger) ACount; {
    //int count = _mapDataArray.count;
   //--移出所有的node
    NSLog(@"%d",guideView.annotationViews.count);
  
        while (guideView.annotationViews.count>0) {
                   
        NAPinAnnotationView* anv= [guideView.annotationViews objectAtIndex:0];
       
        NAAnnotation* an = anv.annotation;
         NSLog(@"%@",an.title);
        [ guideView removeAnnotation: an];
    }
    
    //[guideView removeAnnotation:nil];
    int count = ACount;
     //足个添加POI
    for(int i=0; i <=count; i++) {
        NSString *x = [[_mapDataArray objectAtIndex:i] objectForKey:@"posion_x"];
        NSString *y = [[_mapDataArray objectAtIndex:i] objectForKey:@"posion_y"];
        NSString* pinColor = [[_mapDataArray objectAtIndex:i] objectForKey:@"pincolorid"];
       
        NAAnnotation * node            = [NAAnnotation annotationWithPoint:CGPointMake([x floatValue], [y floatValue]) ];
        node.title = [[_mapDataArray objectAtIndex:i] objectForKey:@"areaName"];
        
        node.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [node.rightCalloutAccessoryView addTarget:self action:@selector(AccessoryViewAction:) forControlEvents:UIControlEventTouchUpInside];
        node.rightCalloutAccessoryView.tag =i;
        UIImage * image = [UIImage imageNamed:@"bubbleplay.png"];
        
        CGRect rect ;
        rect.size.width = image.size.width;
        rect.size.height = image.size.height;
        node.rightCalloutAudioView = [[UIButton alloc] initWithFrame:rect];
        [node.rightCalloutAudioView setBackgroundImage:image forState:UIControlStateNormal];
        [image release];
        [node.rightCalloutAudioView addTarget:self action:@selector(AudioViewAction:) forControlEvents:UIControlEventTouchUpInside];
        node.rightCalloutAudioView.tag = i;
        
        node.color                     = [pinColor intValue];
        
        [guideView addAnnotation:node animated:YES];
      
    }

   
    
}

- (IBAction)infoButtonClicked:(id)sender {
	/*DetailSubContainerController * detailC = [[DetailSubContainerController alloc] init];
	detailC.dataSource = _dataSource;
	[self.navigationConsutroller pushViewController:detailC animated:YES];
	[detailC release];*/
    SummaryViewController * summaryViewController = [[[SummaryViewController alloc] initWithId:_id] autorelease];
    [self.navigationController pushViewController:summaryViewController animated:YES];
   // [summaryViewController release];
    
}

- (IBAction)backButtonClicked:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)setFullScreen:(BOOL)fullScreen {
//	[UIApplication sharedApplication].statusBarHidden = fullScreen;
//	[self.navigationController setNavigationBarHidden:fullScreen];
	// tabBar的隐藏通过在初始化方法中设置hidesBottomBarWhenPushed属性来实现。
}
// 激活不放面板
- (IBAction)actionPlayPanel:(id)sender {
    // 禁止滚动
    guideView.scrollEnabled = NO;
    // 加阴影
    guideView.alpha = 0.8;
     _actionPlayPanel.hidden = YES;
    [UIView animateWithDuration: 0.5f animations:^{
        //annontationView.transform = CGAffineTransformIdentity;
        int heith;
        if(ISPAD()) {
            heith = 150;
        } else {
            heith = 90;
        }
        CGRect frame = CGRectMake(0, heith, guideView.frame.size.width, guideView.frame.size.height);
        guideView.frame = frame;
        
    }
    completion:^ (BOOL finished) {
        [guideView setTouchesCallBack:^{
        // 还原动画
           guideView.alpha = 1;        
           [UIView animateWithDuration: 0.5f animations:^{
                CGRect frame = CGRectMake(0, 0, guideView.frame.size.width, guideView.frame.size.height);
                guideView.frame = frame;}
                completion:^ (BOOL finished) {
                        [guideView setTouchesCallBack:nil];
                            _actionPlayPanel.hidden = NO;
                             guideView.scrollEnabled = YES;
                    
                             }];
                         }];
                     }];
    
}
@end
