//
// NAPinAnnotationView.h
// NAMapKit
//
// Created by Neil Ang on 21/07/10.
// Copyright 2010 neilang.com. All rights reserved.
//

#import "NAPinAnnotationView.h"

#define NA_PIN_WIDTH           32.0f
#define NA_PIN_HEIGHT          39.0f
#define NA_PIN_POINT_X         8.0f
#define NA_PIN_POINT_Y         35.0f

@interface NAPinAnnotationView()

- (void)updatePosition;

@property (nonatomic, retain) NAMapView *mapView;

@end

@implementation NAPinAnnotationView

@synthesize annotation = _annotation;
@synthesize animating  = _animating;
@synthesize mapView    = _mapView;

- (id)initWithAnnotation:(NAAnnotation *)annotation onMapView:(NAMapView *)mapView {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.mapView    = mapView;
        self.annotation = annotation;
        self.animating  = NO;
        
        [self updatePosition]; 
    }
    return self;
}

- (void)setAnimating:(BOOL)animating{
    _animating = animating;
    
    NSString *pinImage;
    switch (self.annotation.color) {
           // NSLog(@"%d",self.annotation.color);
        case NAPinColorOne:
            pinImage = @"12x.png";
            break;
        case NAPinColorTwo:
            pinImage = @"22x.png";
            break;
        case NAPinColorThree:
            pinImage = @"32x.png";
            break;
        case NAPinColorFour:
            pinImage = @"42x.png";
            break;
        case NAPinColorFive:
            pinImage = @"52x.png";
            break;
        case NAPinColorSix:
            pinImage = @"62x.png";
            break;
        case NAPinColorSeven:
            pinImage = @"72x.png";
            break;
        case NAPinColorEight:
            pinImage = @"82x.png";
            break;
        case NAPinColorNine:
            pinImage = @"92x.png";
            break;
        case NAPinColorStart:
            pinImage = @"02x.png";
            break;
        case NApinColorEnd:
            pinImage = @"992x.png";
            break;

        default:
            pinImage = @"book2x.png";
            break;
    }
    
    NSString * image = _animating ? [NSString stringWithFormat:@"%@Floating", pinImage] : pinImage;
    
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
}

-(void)updatePosition{
    CGPoint point = [self.mapView zoomRelativePoint:self.annotation.point];
    point.x       = point.x - NA_PIN_POINT_X;
    point.y       = point.y - NA_PIN_POINT_Y;
    self.frame    = CGRectMake(point.x, point.y, NA_PIN_WIDTH, NA_PIN_HEIGHT);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if ([keyPath isEqualToString:@"contentSize"]) {
        [self updatePosition];
	}
}

@end

#undef NA_PIN_WIDTH
#undef NA_PIN_HEIGHT
#undef NA_PIN_POINT_X
#undef NA_PIN_POINT_Y
