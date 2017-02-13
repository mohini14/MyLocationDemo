//
//  LocationManager.m
//  MyLocationDemo
//
//  Created by Mohini Sindhu  on 13/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "LocationManager.h"
static LocationManager* sharedInstance = nil;

@implementation LocationManager

+ (instancetype) sharedManager
{
	if (sharedInstance == nil)
 {
		sharedInstance = [[LocationManager alloc] init];
	    sharedInstance->_geoCoder=[[CLGeocoder alloc]init];
	    sharedInstance->_locationManager =[[CLLocationManager alloc]init];
	}
	return sharedInstance;
}

- (void) getUserLocationwithCompletionHandler:(LocationBlock)completion{
	
	_locBlock = completion;
	sharedInstance->_locationManager.desiredAccuracy=kCLLocationAccuracyBest;	
	[sharedInstance->_locationManager requestWhenInUseAuthorization];
	sharedInstance->_locationManager.delegate=self ;
	[sharedInstance->_locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"didFailWithError: %@", error);
	NSString *_message= NSLocalizedString(@"Failed to get location", nil);
	NSString *_title= NSLocalizedString(@"ok", nil);
	
	[AlertManager showAlertPopupWithTitle:_title andMessage:_message andActionTitle:@"OK" forView:self.];
}





- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	NSLog(NSLocalizedString(@"didUpdateToLocation: %@", nil), newLocation);
	CLLocation *currentLocation = newLocation;
	[_locationManager stopUpdatingLocation];
	
	NSLog(NSLocalizedString(@"Resolving the address", nil));
	[_geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
		NSLog(NSLocalizedString(@"Found placemarks: %@, error: %@", nil), placemarks, error);
		if (error == nil && [placemarks count] > 0) {
			_placeMark = [placemarks lastObject];
			_locBlock(currentLocation,YES,_placeMark);
			
			
			NSLog(@"%@", error.debugDescription);
		}
		else
			locBlock(currentLocation,NO,nil);
	}];
	
}


@end
