//
//  MapAnnotation.m
//  MapKitDemo
//
//  Created by 李建 on 11-11-7.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapAnnotation.h"

  
@implementation MapAnnotation

//~~~
@synthesize coordinate = _coordinate;
//~~~ 

@synthesize  _title;
@synthesize  _subtitle;

+ (id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate {
	return [[[[self class] alloc] initWithCoordinate:coordinate] autorelease];
}
//~~~
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
	self = [super init];
	if(nil != self) {
		self.coordinate = coordinate;
	}
	return self;
}
//~~~

-(NSString *)title{
	extern NSString *dd;
	return dd;
}

-(NSString *)subtitle{
	
	return @"lij";
}



@end
