//
//  SummaryViewDSFromRes.h
//  PhotoScroller
//
//  Created by 王李 on 11-10-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SummaryViewController.h"


@interface SummaryViewDSFromRes : NSObject<SummaryViewDataSource> {
	NSDictionary * _data;
	NSArray * _subItems;
	NSString * _rootDir;
}

- (id)initWithId:(NSString *)theId;

@end
