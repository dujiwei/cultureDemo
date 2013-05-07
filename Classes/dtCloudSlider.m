//
//  dtCloudSlider.m
//  cultureDemo
//
//  Created by dujw on 11-10-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "dtCloudSlider.h"

@implementation dtCloudSlider

//- (id)initWithFrame:(CGRect)frame {  
- (id)initWithDTFrame:(CGRect)frame leftImage:(UIImage *)LeftImageName rightImage:(UIImage *)rightImageName{
   
	if (self == [super initWithFrame:frame])
    {
		stLeft = [LeftImageName stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
	    stRight = [rightImageName stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
		[self setBackgroundColor:[UIColor clearColor]];
		//[self setValue:5.0];
		[self setMinimumValue:0.0];
		[self setMaximumValue:5.0];
		//[self addTarget:self action:@selector(slideChange:) forControlEvents:UIControlEventTouchUpInside];
		[self setMinimumTrackImage:stLeft forState:UIControlStateNormal];
		[self setMaximumTrackImage:stRight forState:UIControlStateNormal];
		[self setThumbImage:[UIImage imageNamed:@"trumb.png"] forState:UIControlStateNormal];
		[self setThumbImage:[UIImage imageNamed:@"trumb.png"] forState:UIControlStateHighlighted];
		
		
    }
    
    
    return self;  
}  
/* -(void) slideChange:(id)sender
 {
     NSLog(@"%f",[(UISlider *)sender value]);
 
 }*/
 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {   
	
    CGRect t = [self trackRectForBounds: [self bounds]]; 
    
    float v = [self minimumValue] + ([[touches anyObject] locationInView: self].x - t.origin.x - 4.0) * (([self maximumValue]-[self minimumValue]) / (t.size.width - 8.0));   
    [self setValue: v];   
    [super touchesBegan: touches withEvent: event];   
}  

-(void)dealloc
{

	
	[super dealloc];
}
@end
