//
//  baiduMapViewController.h
//  cultureDemo
//
//  Created by 李建 on 11-11-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@class BECheckBox;
@class MapAnnotation;
@interface baiduMapViewController : UIViewController<UISearchBarDelegate,MKMapViewDelegate,CLLocationManagerDelegate,MKReverseGeocoderDelegate,UIScrollViewDelegate> {
	CLLocationManager *lm;
    NSString *strlattitude;
	NSString *strlongitude;
	NSArray * Tabledata;
	UISearchBar *mySearchBar;
	
	UIScrollView *selectScrollView;
	
	MKMapView *_mapView;
	//NSMutableString *log;
	MKReverseGeocoder *reverseGeocoder;
	
	NSDictionary *dicMapData;//配置文件读取
	NSArray *typeNames;
	
	Boolean searchFlag;//是否隐藏条件
	Boolean scrFlag;
	Boolean colorFlag;
	BECheckBox *checkBtn;
	BECheckBox *checkBtn1;
	BECheckBox *checkBtn2;
	BECheckBox *checkBtn3;
	BECheckBox *checkBtn4;
	BECheckBox *checkBtn5;
	BECheckBox *checkBtn6;
	
}

@property (nonatomic,retain) UISearchBar *mySearchBar;

@property (nonatomic,retain) UIScrollView *selectScrollView;

@property (nonatomic, retain)   MKMapView *_mapView;
//@property (nonatomic ,retain)NSMutableString *log;
@property (nonatomic, retain) MKReverseGeocoder *reverseGeocoder;

@property (nonatomic, retain) CLLocationManager*lm;

//@property (nonatomic, retain) DetailsViewController *detailsViewController;

@property (nonatomic, retain)NSArray *typeNames;

@property(nonatomic,retain)BECheckBox *checkBtn;
@property(nonatomic, retain)BECheckBox *checkBtn1;
@property(nonatomic, retain)BECheckBox *checkBtn2;
@property(nonatomic, retain)BECheckBox *checkBtn3;
@property(nonatomic, retain)BECheckBox *checkBtn4;
@property(nonatomic, retain)BECheckBox *checkBtn5;
@property(nonatomic, retain)BECheckBox *checkBtn6;

@end
