//
// NAAnnotation.h
// NAMapKit
//
// Created by Neil Ang on 21/07/10.
// Copyright 2010 neilang.com. All rights reserved.
//

#import "NAAnnotation.h"

@implementation NAAnnotation

@synthesize point    = _point;
@synthesize color    = _color;
@synthesize title    = _title;
@synthesize subtitle = _subtitle;
@synthesize rightCalloutAccessoryView = _rightCalloutAccessoryView;
@synthesize rightCalloutAudioView = _rightCalloutAudioView;
@synthesize isPlayAudio = _isPlayAudio;  // 是否正在播放音乐

+ (id)annotationWithPoint:(CGPoint)point{
    return [[[[self class] alloc] initWithPoint:point] autorelease];

}

- (id)initWithPoint:(CGPoint)point{
    self = [super init];
    if (self) {
        self.point    = point;
        self.color    = NAPinColorBook;
        self.title    = nil;
        self.subtitle = nil;
        self.rightCalloutAccessoryView = nil;
        self.isPlayAudio = false;
    }
    return self;
}


@end
