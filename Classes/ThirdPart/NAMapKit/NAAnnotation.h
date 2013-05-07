//
// NAAnnotation.h
// NAMapKit
//
// Created by Neil Ang on 21/07/10.
// Copyright 2010 neilang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    NAPinColorOne,
    NAPinColorTwo,
    NAPinColorThree,
    NAPinColorFour,
    NAPinColorFive,
    NAPinColorSix,
    NAPinColorSeven,
    NAPinColorEight,
    NAPinColorNine,
    NAPinColorStart=97,
    NApinColorEnd = 99,
    NAPinColorBook=98
} NAPinColor;

@interface NAAnnotation : NSObject

@property (nonatomic, assign) CGPoint     point;
@property (nonatomic, assign) NAPinColor  color;
@property (nonatomic, copy)   NSString   *title;
@property (nonatomic, copy)   NSString   *subtitle;
@property (nonatomic, retain) UIButton   *rightCalloutAccessoryView;
@property (nonatomic, retain) UIButton   *rightCalloutAudioView;
@property (nonatomic,assign)  BOOL      isPlayAudio;
+ (id)annotationWithPoint:(CGPoint)point ;
- (id)initWithPoint:(CGPoint)point;

@end
