//
//  AudioPlayPanelView.m
//  cultureDemo
//
//  Created by a a a a a on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AudioPlayPanelView.h"

@implementation AudioPlayPanelView
@synthesize progressBar;
@synthesize playCur;
@synthesize palyLeft;
@synthesize buttonPlay;
@synthesize playerHandel;   
@synthesize sliderTimer = _sliderTimer;

- (void)initwithAudioPlayer:(AVAudioPlayer*) player
{
   self.playerHandel = player;

//    sliderTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateSlider:) userInfo:nil repeats:YES];

    self.sliderTimer =[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(updateSlider:) userInfo:nil repeats:YES];
    
  // 设置最大进度
   self.progressBar.maximumValue =  player.duration;
    
   _step  = player.duration/6;  //默认步进4次到头

   playstate = false;

   
}
-(void) startTimer {
    if(self.playerHandel != nil) {
           self.sliderTimer =[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(updateSlider:) userInfo:nil repeats:YES];
    }
}
-(void) stopTimer {
    if(self.sliderTimer != nil) {
        [ self.sliderTimer invalidate];
       // [ self.sliderTimer release];
    }
}
// 暂停播放
-(void)stopAudioPaly {
    if(self.playerHandel != nil)
    [self.playerHandel pause];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)updateSlider:(NSTimer *)timer {
    
    // Update the slider about the music time
    // 更新播放按钮的状态
    //NSLog(@"updateSlider");
    if (self.playerHandel == nil) return;
    if(self.playerHandel.playing != playstate) {
        playstate = self.playerHandel.playing;
        UIImage * image;
        if(playstate ==YES)
        image = [UIImage imageNamed:@"audiopause-pad.png"];
        else 
        image = [UIImage imageNamed:@"audioplay-pad.png"];
        [self.buttonPlay setImage:image forState:UIControlStateNormal];
        
    }

    self.playCur.text = [self intToTimerString:self.playerHandel.currentTime iscur:YES];

    self.palyLeft.text = [self intToTimerString:self.playerHandel.duration - self.playerHandel.currentTime iscur:NO];
    
    self.progressBar.value = self.playerHandel.currentTime;
    
}
- playStateCallBack:(void(^)(bool))callback;
{
    [callback release];
    playStateCallBack = [callback copy];
}

- (IBAction)audioPlay:(id)sender {
    
    UIImage * image;
    
    
    if(self.playerHandel.playing == YES) {
        image = [UIImage imageNamed:@"audioplay-pad.png"];
        [self.playerHandel pause];
        if(playStateCallBack != nil ) playStateCallBack(NO);
    } else {
        image = [UIImage imageNamed:@"audiopause-pad.png"];
        [self.playerHandel play];
         if(playStateCallBack != nil ) playStateCallBack(YES);
    }
    playstate = self.playerHandel.playing;
    [self.buttonPlay setImage:image forState:UIControlStateNormal];
    [self.buttonPlay setNeedsDisplay];
    
}

- (IBAction)audioPlayNext:(id)sender {
    NSTimeInterval temp;
 
    if(self.playerHandel.currentTime==self.playerHandel.duration) return;
    [self.playerHandel stop];
    if((self.playerHandel.currentTime +_step) >= self.playerHandel.duration) temp = self.playerHandel.duration;
    else 
    temp = self.playerHandel.currentTime +_step;
    [self.playerHandel setCurrentTime:temp];
    [self.playerHandel prepareToPlay];
    [self.playerHandel play];
}

- (IBAction)audioPlayPre:(id)sender {
    NSTimeInterval temp;
  
    if(self.playerHandel.currentTime==0) return;
    [self.playerHandel stop];
    if((self.playerHandel.currentTime - _step) <=0) temp = 0;
    else 
    temp = self.playerHandel.currentTime - _step;
    [self.playerHandel setCurrentTime:temp];
    [self.playerHandel prepareToPlay];
    [self.playerHandel play];
        
}

- (IBAction)proogressChange:(id)sender {
    [self.playerHandel stop];
    [self.playerHandel setCurrentTime:self.progressBar.value];
    [self.playerHandel prepareToPlay];
    [self.playerHandel play];
}


- (void)dealloc {
    [self.palyLeft release];
    [progressBar release];
    [playCur release];
    [buttonPlay release];
    [ self.sliderTimer invalidate];
    [ self.sliderTimer release];
    [super dealloc];
}
//转换成字符串 timer：秒  iscur：当前还是剩余
- (NSString*)intToTimerString:(NSTimeInterval)timer iscur:(bool)cur
{
    int f,m;
    int tmp = (int) timer;
    NSString *str;
    f = tmp/60;
    m = tmp%60;
    if(cur ==YES)
    str = [NSString stringWithFormat:@"%02d:%02d",f, m];
    else 
    str = [NSString stringWithFormat:@"-%02d:%02d",f, m];
    return str;

}
@end
