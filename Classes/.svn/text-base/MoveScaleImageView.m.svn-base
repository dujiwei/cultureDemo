//
//  MoveScaleImageView.m
//  cultureDemo
//
//  Created by dujw on 11-10-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MoveScaleImageView.h"

#define min_offset 4
@implementation MoveScaleImageView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		imageView = [[UIImageView alloc] init];
		[self addSubview:imageView];
		[imageView setUserInteractionEnabled:YES];
		[imageView setMultipleTouchEnabled:YES];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/
-(void) setImage:(UIImage *)image
{
	
	orginImage = [[UIImage alloc] initWithCGImage:image.CGImage];
	[imageView setImage:orginImage];
	//[imageView setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
	[imageView setFrame:self.frame];

}
-(CGFloat)spaceToPoint:(CGPoint)first 
			 FromPoint:(CGPoint)two
{//计算两点之间的距离
	float x = first.x-two.x;
	float y = first.y-two.y;
	return sqrt(x * x + y * y);
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	//gestureStartPoint = [touch locationInView:self];
	if([touches count]==2) 
	{//识别两点触摸,并记录两点间距离
		NSArray* twoTouches=[touches allObjects];
		originSpace=[self spaceToPoint:[[twoTouches objectAtIndex:0] locationInView:self]
		                     FromPoint:[[twoTouches objectAtIndex:1] locationInView:self]];
	}
	else if([touches count]==1)
	{
		//UITouch *touch=[touches anyObject];
		gestureStartPoint=[touch locationInView:self];
	}

}
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([touches count]==2) 
	{
		NSArray* twoTouches=[touches allObjects];
		CGFloat currSpace=[self spaceToPoint:[[twoTouches objectAtIndex:0] locationInView:self]
		                           FromPoint:[[twoTouches objectAtIndex:1] locationInView:self]];
		
		//如果先触摸一根手指，再触摸另一根手指，则触发touchesMoved方法而不是touchesBegan方法
		//此时originSpace应该是0，我们要正确设置它的值为当前检测到的距离，否则可能导致0除错误
		if(originSpace==0) 
		{
			originSpace=currSpace;
		}
		if(fabsf(currSpace-originSpace)>=min_offset) 
		{//两指间移动距离超过min_offset，识别为手势“捏合”
			CGFloat s=currSpace/originSpace; //计算缩放比例
			[self scaleTo:s];
		}
	}
	else if([touches count]==1)
	{
	/*	UITouch *touch = [touches anyObject];
		CGPoint curr_point = [touch locationInView:self];
		//计算x，y方向上的移动
		offsetX = curr_point.x - gestureStartPoint.x;
		offsetY = curr_point.y - gestureStartPoint.y;
		//在任何方向超过Min_offSet，判断手势有效
		if (fabsf(offsetX)>=min_offset || fabsf(offsetY)>=min_offset)
		{
			[self moveToX:offsetX ToY:offsetY];
			gestureStartPoint.x = curr_point.x;
			gestureStartPoint.y = curr_point.y;
		}*/
	}
	
}
-(void)scaleTo:(CGFloat)x
{
	
	scale*=x;
	//缩放限制：>＝0.1，<=10
	scale=(scale<0.5)?0.5:scale;
	scale=(scale>10)?10:scale;
	//重设imageView的frame
	[self moveToX:0 ToY:0];
}
-(void)moveToX:(CGFloat)x ToY:(CGFloat)y
{
	CGPoint point=CGPointMake(x, y);
	//重设镜头
	[self resetLens:point];
	imageView.image=[UIImage imageWithCGImage:
					 CGImageCreateWithImageInRect([orginImage CGImage], lensRect)];
	[imageView setFrame:
	 CGRectMake(0, 0, lensRect.size.width*scale, lensRect.size.height*scale)];
}

-(void)resetLens:(CGPoint)point
{//设置镜头大小和位置
	CGFloat x,y,width,height;
	//===========镜头初始大小=========
	width=self.frame.size.width/scale;
	height=self.frame.size.height/scale;
	//===========调整镜大小不得超过图像实际大小==========
	if(width>orginImage.size.width)
	{
		width=orginImage.size.width;
	}
	if(height>orginImage.size.height) 
	{
		height=orginImage.size.height;
	}
	//计算镜头移动的位置（等比缩放）
	x=lensRect.origin.x-point.x/scale;
	y=lensRect.origin.y-point.y/scale;
	//左边界越界处理
	x=(x<0)?0:x;
	//上边界越界处理
	y=(y<0)?0:y;
	//右边界越界
	x=(x+width>orginImage.size.width)?orginImage.size.width-width:x;
	//下边界越界处理
	y=(y+height>orginImage.size.height)?orginImage.size.height-height:y;
	//镜头等比缩放
	lensRect=CGRectMake(x, y, width, height);
}

- (void)dealloc {
	[orginImage release];
	[imageView release];
    [super dealloc];
}


@end
