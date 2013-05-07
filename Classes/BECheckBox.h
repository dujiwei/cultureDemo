//
//  BECheckBox.h
//  cultureDemo
//
//  Created by 李建 on 11-11-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>



@interface BECheckBox : UIButton {

	BOOL isChecked;
	id target;
	SEL fun;
}
@property (nonatomic,assign) BOOL isChecked;

-(IBAction) checkBoxClicked;
-(void)setTarget:(id)tar fun:(SEL )ff;

@end
