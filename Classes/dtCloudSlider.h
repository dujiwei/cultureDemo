//
//  dtCloudSlider.h
//  cultureDemo
//
//  Created by dujw on 11-10-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface dtCloudSlider : UISlider {
	UIImage *stLeft ;
	UIImage *stRight ;

}
- (id)initWithDTFrame:(CGRect)frame leftImage:(UIImage *)LeftImageName rightImage:(UIImage *)rightImageName;
//-(void) slideChange:(id)sender;
@end
