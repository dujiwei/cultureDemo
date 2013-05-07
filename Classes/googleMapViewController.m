    //
//  googleMapViewController.m
//  cultureDemo
//
//  Created by dujw on 11-11-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "googleMapViewController.h"


@implementation googleMapViewController
@synthesize map ;
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


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	map = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)];
	 
	map.delegate = self;
 	 

	map.showsUserLocation = YES;
	[self.view addSubview:map];
	locManager = [[CLLocationManager alloc] init];
	locManager.delegate = self;
	locManager.desiredAccuracy = kCLLocationAccuracyBest;
	locManager.distanceFilter = 100;
	[locManager startUpdatingLocation];
	
	
}
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation {
	NSLog(@"---------------");
	loc = [newLocation coordinate];
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.1; //zoom level
	span.longitudeDelta=0.1; //zoom level
	NSLog(@"%f",loc.latitude);
	NSLog(@"%f",loc.longitude);
	region.span=span;
	region.center=loc;
	// map.showsUserLocation=NO;
	map.mapType = MKMapTypeStandard;
	[map setRegion:region animated:YES];
	[map regionThatFits:region];
}
- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error{
	NSString *errorMessage;
	if ([error code] == kCLErrorDenied){
		errorMessage = @"被拒绝访问";
	}
	if ([error code] == kCLErrorLocationUnknown) {
		errorMessage = @"";
	}
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:nil
						  message:errorMessage
						  delegate:self
						  cancelButtonTitle:@"纭畾"
						  otherButtonTitles:nil];
	[alert show];
	[alert release];
}
- (void)setCurrentLocation:(CLLocation *)location {
	MKCoordinateRegion region ;
	region.center = location.coordinate;
	region.span.longitudeDelta = 0.15f;
	region.span.latitudeDelta = 0.15f;
	[map setRegion:region animated:YES];
}
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[map release];
    [super dealloc];
}


@end
