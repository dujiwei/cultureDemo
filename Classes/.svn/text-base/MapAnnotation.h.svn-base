//
//  MapAnnotation.h
//  MapKitDemo
//
//  Created by 李建 on 11-11-7.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>{
	
	//~~~~~~~~~~~
	CLLocationCoordinate2D _coordinate;
	//~~~~~~~~~~~
	 
	NSString *_title;
	NSString *_subtitle;
}

@property (nonatomic ,copy)NSString *_title;
@property (nonatomic ,copy)NSString *_subtitle;
//~~~~~~~
+ (id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate;
//~~~~~~~

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

//~~~~~
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
//~~~~~


@end
