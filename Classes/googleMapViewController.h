//
//  googleMapViewController.h
//  cultureDemo
//
//  Created by dujw on 11-11-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@class BECheckBox;
@class MapAnnotation;
@interface googleMapViewController : UIViewController  <MKMapViewDelegate,CLLocationManagerDelegate>{

	MKMapView *map;
	CLLocationManager *locManager;
	CLLocationCoordinate2D loc;
}
@property (nonatomic, retain) MKMapView *map;
@property (nonatomic, retain) CLLocationManager *locManager;
- (void)setCurrentLocation:(CLLocation *)location;
@end
