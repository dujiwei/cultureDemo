//
//  MoveScaleImageView.h
//  cultureDemo
//
//  Created by dujw on 11-10-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MoveScaleImageView : UIView {

	UIImage* orginImage;
	UIImageView *imageView;
	CGPoint gestureStartPoint; //手势起点
	CGFloat offsetX,offsetY;//移动时候x，y方向。
	CGFloat curr_X,curr_Y;//当前图片的原点坐标
	CGFloat originSpace;
	CGFloat scale;
	CGRect lensRect;
}

-(void) setImage:(UIImage *) image;
-(void)moveToX:(CGFloat)x ToY:(CGFloat) y;
-(void)scaleTo:(CGFloat)x;
-(void)resetLens:(CGPoint)point;
@end
