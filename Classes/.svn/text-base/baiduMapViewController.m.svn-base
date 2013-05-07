//
//  baiduMapViewController.m
//  cultureDemo
//
//  Created by 李建 on 11-11-10.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "baiduMapViewController.h"
#import "MapAnnotation.h"
#import "BECheckBox.h"
#import "dtCloudDelegate.h"
NSString *dd;  
NSMutableArray *arr;
#define MAPSPAN 0.3f

@implementation baiduMapViewController

@synthesize mySearchBar;

@synthesize selectScrollView;
@synthesize _mapView,reverseGeocoder;
@synthesize lm;
@synthesize typeNames;
@synthesize checkBtn;
@synthesize checkBtn1;
@synthesize checkBtn2;
@synthesize checkBtn3;
@synthesize checkBtn4;
@synthesize checkBtn5;
@synthesize checkBtn6;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	searchFlag = YES;
	
	scrFlag = YES;
	
	colorFlag = YES;
	_mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)];
	
	_mapView.delegate = self;
	
	
	_mapView.showsUserLocation = YES;
	[self.view addSubview:_mapView];
	lm = [[CLLocationManager alloc] init];
	lm.delegate = self;
	lm.desiredAccuracy = kCLLocationAccuracyBest;
	lm.distanceFilter = kCLDistanceFilterNone;
	[lm startUpdatingLocation];
	
	 UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:
											[NSArray arrayWithObjects:
											 [UIImage imageNamed:@"segment_search.png"],
											 [UIImage imageNamed:@"segment_tools.png"],
											 nil]];
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
	//segmentedControl.selectedSegmentIndex = 0;
	segmentedControl.momentary = YES;
	//if (ISPAD()) {
	//	segmentedControl.frame = CGRectMake(0, 0, 180, 30);
	//}else {
		segmentedControl.frame = CGRectMake(0, 0, 80, 30);
	//}
	//segmentedControl.frame = CGRectMake(0, 0, 90, 30);
	[segmentedControl setBackgroundColor:[UIColor clearColor]];
	[segmentedControl setAlpha:0.5];
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
	[self.navigationItem setRightBarButtonItem:rightButton];
	[segmentedControl release];
	
	if (ISPAD()) {
		self.mySearchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 705, 40.0)] autorelease];
	}else {
		self.mySearchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 40.0)] autorelease];
	}
	//self.mySearchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 40.0)] autorelease];
    self.mySearchBar.delegate = self;
	self.mySearchBar.showsCancelButton = YES;
	[self.mySearchBar setTintColor:[UIColor blackColor]];
	[self.mySearchBar setBackgroundColor:[UIColor blackColor]];
	[self.view addSubview:self.mySearchBar];
	
	BECheckBox *passCheckBox=[[BECheckBox alloc]init];
	BECheckBox *passCheckBox1=[[BECheckBox alloc]init];
	BECheckBox *passCheckBox2=[[BECheckBox alloc]init];
	BECheckBox *passCheckBox3=[[BECheckBox alloc]init];
	BECheckBox *passCheckBox4=[[BECheckBox alloc]init];
	BECheckBox *passCheckBox5=[[BECheckBox alloc]init];
	BECheckBox *passCheckBox6=[[BECheckBox alloc]init];
	if (ISPAD()) {
		passCheckBox.frame=CGRectMake(10, 2, 80, 40);
		passCheckBox1.frame=CGRectMake(100, 2, 80, 40);
		passCheckBox2.frame=CGRectMake(190, 2, 80, 40);
		passCheckBox3.frame=CGRectMake(280, 2, 80, 40);
		passCheckBox4.frame=CGRectMake(370, 2, 80, 40);
		passCheckBox5.frame=CGRectMake(460, 2, 80, 40);
		passCheckBox6.frame=CGRectMake(540, 2, 80, 40);
		passCheckBox.titleLabel.font=[UIFont systemFontOfSize:20];
		passCheckBox1.titleLabel.font=[UIFont systemFontOfSize:20];
		passCheckBox2.titleLabel.font=[UIFont systemFontOfSize:20];
		passCheckBox3.titleLabel.font=[UIFont systemFontOfSize:20];
		passCheckBox4.titleLabel.font=[UIFont systemFontOfSize:20];
		passCheckBox5.titleLabel.font=[UIFont systemFontOfSize:20];
		passCheckBox6.titleLabel.font=[UIFont systemFontOfSize:20];
		 
	}else {
		passCheckBox.frame=CGRectMake(5, 3, 60, 35);
		passCheckBox1.frame=CGRectMake(90, 3, 60, 35);
		passCheckBox2.frame=CGRectMake(175, 3, 60, 35);
		passCheckBox3.frame=CGRectMake(260, 3, 60, 35);
		passCheckBox4.frame=CGRectMake(345, 3, 60, 35);
		passCheckBox5.frame=CGRectMake(430, 3, 60, 35);
		passCheckBox6.frame=CGRectMake(515, 3, 60, 35);
		passCheckBox.titleLabel.font=[UIFont systemFontOfSize:14];
		passCheckBox1.titleLabel.font=[UIFont systemFontOfSize:14];
		passCheckBox2.titleLabel.font=[UIFont systemFontOfSize:14];
		passCheckBox3.titleLabel.font=[UIFont systemFontOfSize:14];
		passCheckBox4.titleLabel.font=[UIFont systemFontOfSize:14];
		passCheckBox5.titleLabel.font=[UIFont systemFontOfSize:14];
		passCheckBox6.titleLabel.font=[UIFont systemFontOfSize:14];
		
	}
	if (ISPAD()) {
		self.selectScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0.0, 40.0, 705, 40)] autorelease]; 
		self.selectScrollView.contentSize = CGSizeMake(1200,40);
	}else {
		self.selectScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0.0, 40.0, self.view.bounds.size.width, 40)] autorelease];  
		self.selectScrollView.contentSize = CGSizeMake(600,20);
	}
	
	//self.selectScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0.0, 40.0, self.view.bounds.size.width, 40)] autorelease];  
	self.selectScrollView.delegate = self;  
	[self.selectScrollView setBackgroundColor:[UIColor darkGrayColor]];
	//self.selectScrollView.contentSize = CGSizeMake(1200,40);
	self.selectScrollView.showsVerticalScrollIndicator=NO;
	self.selectScrollView.showsHorizontalScrollIndicator = NO;
	//[selectScrollView setAlpha:0.8];
	[self.view addSubview:self.selectScrollView];
	
	//BECheckBox *passCheckBox=[[BECheckBox alloc]initWithFrame:CGRectMake(5, 3, 60, 35)];
	[passCheckBox setTitle:@"  全部" forState:UIControlStateNormal];
	[passCheckBox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	//passCheckBox.titleLabel.font=[UIFont systemFontOfSize:14];
	[passCheckBox setTarget:self fun:@selector(passCheckBoxClick:)];
	self.checkBtn=passCheckBox;
	[self.selectScrollView addSubview:self.checkBtn];
	[passCheckBox release];
	
	//BECheckBox *passCheckBox1=[[BECheckBox alloc]initWithFrame:CGRectMake(90, 3, 60, 35)];
	[passCheckBox1 setTitle:@"  住宿" forState:UIControlStateNormal];
	[passCheckBox1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	//passCheckBox1.titleLabel.font=[UIFont systemFontOfSize:14];
	[passCheckBox1 setTarget:self fun:@selector(passCheckBoxClick1:)];
	self.checkBtn1=passCheckBox1;
	[self.selectScrollView addSubview:self.checkBtn1];
	[passCheckBox1 release];
	
	
	//BECheckBox *passCheckBox2=[[BECheckBox alloc]initWithFrame:CGRectMake(175, 3, 60, 35)];
	[passCheckBox2 setTitle:@"  景点" forState:UIControlStateNormal];
	[passCheckBox2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	//passCheckBox2.titleLabel.font=[UIFont systemFontOfSize:14];
	[passCheckBox2 setTarget:self fun:@selector(passCheckBoxClick2:)];
	self.checkBtn2=passCheckBox2;
	[self.selectScrollView addSubview:self.checkBtn2];
	[passCheckBox2 release];
	
	//BECheckBox *passCheckBox3=[[BECheckBox alloc]initWithFrame:CGRectMake(260, 3, 60, 35)];
	[passCheckBox3 setTitle:@"  购物" forState:UIControlStateNormal];
	[passCheckBox3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	//passCheckBox3.titleLabel.font=[UIFont systemFontOfSize:14];
	[passCheckBox3 setTarget:self fun:@selector(passCheckBoxClick3:)];
	self.checkBtn3=passCheckBox3;
	[self.selectScrollView addSubview:self.checkBtn3];
	[passCheckBox3 release];
	
	//BECheckBox *passCheckBox4=[[BECheckBox alloc]initWithFrame:CGRectMake(345, 3, 60, 35)];
	[passCheckBox4 setTitle:@"  酒吧" forState:UIControlStateNormal];
	[passCheckBox4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	//passCheckBox4.titleLabel.font=[UIFont systemFontOfSize:14];
	[passCheckBox4 setTarget:self fun:@selector(passCheckBoxClick4:)];
	self.checkBtn4=passCheckBox4;
	[self.selectScrollView addSubview:self.checkBtn4];
	[passCheckBox4 release];
	
	//BECheckBox *passCheckBox5=[[BECheckBox alloc]initWithFrame:CGRectMake(430, 4, 60, 35)];
	[passCheckBox5 setTitle:@"  影院" forState:UIControlStateNormal];
	[passCheckBox5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	//passCheckBox5.titleLabel.font=[UIFont systemFontOfSize:14];
	[passCheckBox5 setTarget:self fun:@selector(passCheckBoxClick5:)];
	self.checkBtn5=passCheckBox5;
	[self.selectScrollView addSubview:self.checkBtn5];
	[passCheckBox5 release];
	
	//BECheckBox *passCheckBox6=[[BECheckBox alloc]initWithFrame:CGRectMake(515, 4, 60, 35)];
	[passCheckBox6 setTitle:@"  餐饮" forState:UIControlStateNormal];
	[passCheckBox6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	//passCheckBox6.titleLabel.font=[UIFont systemFontOfSize:14];
	[passCheckBox6 setTarget:self fun:@selector(passCheckBoxClick6:)];
	self.checkBtn6=passCheckBox6;
	[self.selectScrollView addSubview:self.checkBtn6];
	[passCheckBox6 release];
 	
	dicMapData = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mapData" ofType:@"plist"]];
	typeNames = [dicMapData objectForKey:@"types"];
	
	NSLog(@"typeNames=%@",typeNames); 
	 
	dd = @"demo";
}

- (void)segmentAction:(id)sender
{
	//NSLog(@"segmentAction: selected segment = %d", [sender selectedSegmentIndex]);
	
	switch ([sender selectedSegmentIndex]) {
		case 0:
			
			if (scrFlag) {
				[selectScrollView setHidden:YES];
				scrFlag = NO;
			}
			else {
				if (!searchFlag) {
					self.selectScrollView.frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width, 40.0);					
				}
				[selectScrollView setHidden:NO];
				scrFlag = YES;
			}
			break;
		case 1:
			
			switch (searchFlag) {
				case YES:
					[mySearchBar setHidden:YES];
					searchFlag = NO;
					if (scrFlag ) {
						self.selectScrollView.frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width, 40.0);
					}
					break;
				case NO:
					[mySearchBar setHidden:NO];
					searchFlag = YES;
					self.selectScrollView.frame = CGRectMake(0.0, 40.0, self.view.bounds.size.width, 40.0);
					break;
				default:
					break;
			}
			break;
		default:
			break;
	}
	
}

// called when keyboard search button pressed
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[self.mySearchBar resignFirstResponder];
	NSLog(@"点击搜索");
	//searchAreaName = self.mySearchBar.text;
}

// called when cancel button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[self.mySearchBar resignFirstResponder];
	NSLog(@"CancelButton");
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	//[self doLog:@"Location manager error: %@", [error description]];
	NSLog(@"locationManager has failed.");
}

/*
 - (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
 {
 //[self doLog:@"Reverse geocoder error: %@", [error description]];
 NSLog(@"MKReverseGeocoder has failed.");
 }
 */

- (void)setCurrentLocation:(CLLocation *)location {
	MKCoordinateRegion region = {{0.0f, 0.0f}, {0.0f, 0.0f}};
	region.center = location.coordinate;
	region.span.longitudeDelta = MAPSPAN;
	region.span.latitudeDelta = MAPSPAN;
	
	[self._mapView setRegion:region animated:YES];
}
//

-(void)markerShow
{

	CLLocationCoordinate2D coordinate ;
	
	for (int i=0; i<[typeNames count]; i++) {
		for (int j =0; j<[[[typeNames objectAtIndex:i] objectForKey:@"subTitle"] count]; j++) {
			coordinate.latitude = [[[[[[typeNames objectAtIndex:i] objectForKey:@"subTitle"] objectAtIndex:j] objectForKey:@"sublatlong"] objectAtIndex:0] doubleValue];
			coordinate.longitude = [[[[[[typeNames objectAtIndex:i] objectForKey:@"subTitle"] objectAtIndex:j] objectForKey:@"sublatlong"] objectAtIndex:1] doubleValue];
			MapAnnotation* maker = [[MapAnnotation alloc]initWithCoordinate:coordinate];

			[_mapView addAnnotation:maker];
		}
		
	}

}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
//	CLLocationCoordinate2D coordinate ;
//	
//	for (int i=0; i<[typeNames count]; i++) {
//		for (int j =0; j<[[[typeNames objectAtIndex:i] objectForKey:@"subTitle"] count]; j++) {
//			coordinate.latitude = [[[[[[typeNames objectAtIndex:i] objectForKey:@"subTitle"] objectAtIndex:j] objectForKey:@"sublatlong"] objectAtIndex:0] doubleValue];
//			coordinate.longitude = [[[[[[typeNames objectAtIndex:i] objectForKey:@"subTitle"] objectAtIndex:j] objectForKey:@"sublatlong"] objectAtIndex:1] doubleValue];
//			MapAnnotation* maker = [[MapAnnotation alloc]initWithCoordinate:coordinate];
//			[_mapView addAnnotation:maker];
//		}
//		
//	}
	
	CLLocationCoordinate2D coordinate = newLocation.coordinate;//{39.973454,116.411444};
	MapAnnotation* maker = [[MapAnnotation alloc]initWithCoordinate:coordinate];
	[_mapView addAnnotation:maker];
	
	[self markerShow];
	[lm stopUpdatingLocation];
	//	CLLocationCoordinate2D coordinate = newLocation.coordinate;//{39.973454,116.411444};
	//	MapAnnotation* maker = [[MapAnnotation alloc]initWithCoordinate:coordinate];
	//	[_mapView addAnnotation:maker];
	
	 self.reverseGeocoder = [[[MKReverseGeocoder alloc] initWithCoordinate:_mapView.userLocation.location.coordinate] autorelease];
	 reverseGeocoder.delegate = self;
	 [reverseGeocoder start];
	
}
//


 - (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
 {
// 	[self doLog:[placemark.addressDictionary description]];
 	if ([geocoder retainCount]) [geocoder release];
 	dd = placemark.thoroughfare;
//	 detailsViewController = [[DetailsViewController alloc]initWithNibName:@"DetailsViewController" bundle:nil];
//     detailsViewController.placemark = placemark;
	 NSLog(@"ddddd=%@",placemark.thoroughfare);
 }
 

- (MKAnnotationView *)mapView:(MKMapView *)mapView 
            viewForAnnotation:(id <MKAnnotation>)annotation {
	
	if (annotation == mapView.userLocation) {
		return nil;
	}
	CLLocation *location = [[CLLocation alloc] 
							initWithLatitude:annotation.coordinate.latitude
							longitude:annotation.coordinate.longitude];
	[self setCurrentLocation:location];
	MKPinAnnotationView *annotationView = nil;
	annotationView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"ann"];
	if (nil == annotationView) {
		annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"ann"];
	}
	
	annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];//按钮

	annotationView.pinColor = MKPinAnnotationColorGreen;//标注颜色
	
	//annotationView.image = [UIImage imageNamed:@"spring-hot.png"];//标注图标
	annotationView.canShowCallout = YES;
	[annotationView setAnimatesDrop:YES];
	
	return annotationView;
	
	
}


- (void)mapView:(MKMapView *)mapView 
 annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control {

	//响应annotation点击
	MapAnnotation *ann = (MapAnnotation *)view.annotation;
	
	//NSLog(@"sfsdff=%d",ann.i);
	//[self pushViewController:detailsViewController animated:YES];
	//[self presentModalViewController:detailsViewController animated:YES]; 
}

-(void)passCheckBoxClick:(id)sender
{   
		
	if ([self.checkBtn isChecked]) {
		NSLog(@"ha");
	}
	else {
		NSLog(@"hahah");
	}
}

-(void)passCheckBoxClick1:(id)sender
{   	
	NSLog(@"LIJ");
}
-(void)passCheckBoxClick2:(id)sender
{   	
	NSLog(@"LIJ");
}
-(void)passCheckBoxClick3:(id)sender
{   	
	NSLog(@"LIJ");
}
-(void)passCheckBoxClick4:(id)sender
{   	
	NSLog(@"LIJ");
}
-(void)passCheckBoxClick5:(id)sender
{   	
	NSLog(@"LIJ");
}
-(void)passCheckBoxClick6:(id)sender
{   	
	NSLog(@"LIJ");
}



 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
	 if (ISPAD())
	 {
		 
		  return YES;
		// return (interfaceOrientation ==UIInterfaceOrientationLandscapeLeft);
	 }
	 else {
		 return (interfaceOrientation == UIInterfaceOrientationPortrait);
		 
	 }
}
 

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
    [super dealloc];
}

@end
