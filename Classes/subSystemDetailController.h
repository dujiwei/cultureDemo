//
//  subSystemDetailController.h
//  cultureDemo
//
//  Created by dujw on 11-10-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/*@interface UINavigationBar (CustomImage)
{
	- (void)drawRect:(CGRect)rect;
}
*/
@interface subSystemDetailController : UIViewController {

	
    int pageNumber;
	UIWebView * webView;
    

  
}
- (id)initWithPageNumber:(int)page;


@end
