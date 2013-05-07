//
//  AudioPlayPanelView.h
//  cultureDemo
//
//  Created by a a a a a on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AudioPlayPanelView : UIView {
        bool           playstate;          // 播放状态
        NSTimeInterval _step;              // 快进间隔
    void (^playStateCallBack)(bool); 
}

@property (retain, nonatomic) IBOutlet UIButton *buttonPlay;
@property (retain, nonatomic) AVAudioPlayer* playerHandel;          // 句柄
@property (retain, nonatomic) NSTimer       *sliderTimer;       // 进度更新定时器 
@property (retain, nonatomic) IBOutlet UISlider *progressBar;
@property (retain, nonatomic) IBOutlet UILabel *playCur;
@property (retain, nonatomic) IBOutlet UILabel *palyLeft;


- (IBAction)audioPlayNext:(id)sender;
- (IBAction)audioPlay:(id)sender;
- (IBAction)audioPlayPre:(id)sender;
- (IBAction)proogressChange:(id)sender;
- (void) startTimer;
- (void) stopTimer;
- (void)stopAudioPaly;
- playStateCallBack:(void(^)(bool))callback;

@end
