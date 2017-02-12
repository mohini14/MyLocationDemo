//
// Created by Mohini on 12/02/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import "ViewControllerDelegates.h"
#import "ViewController.h"


@implementation ViewControllerDelegates {

}
+ (ViewControllerDelegates *)initWithVC:(ViewController *)vc {
    ViewControllerDelegates *viewControllerDelegates = ViewControllerDelegates.alloc.init;
    viewControllerDelegates.viewController = vc;
    return viewControllerDelegates;
}


#pragma mark - CLLocationManagerDelegate //implemnting the protocol conformed methods



- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"didFailWithError: %@", error);
    NSString *_message= NSLocalizedString(@"Failed to get location", nil);
    NSString *_title= NSLocalizedString(@"ok", nil);

    [AlertManager showAlertPopupWithTitle:_title andMessage:_message andActionTitle:@"OK" forView:self.viewController];
}





- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	NSLog(NSLocalizedString(@"didUpdateToLocation: %@", nil), newLocation);
	CLLocation *_currentLocation = newLocation;

	if (_currentLocation != nil) {
		self.viewController.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", _currentLocation.coordinate.longitude];
		self.viewController.latitudeLabel.text = [NSString stringWithFormat:@"%.8f", _currentLocation.coordinate.latitude];
	}

    // Stop Location Manager
    [self.viewController.locationManager stopUpdatingLocation];

	NSLog(NSLocalizedString(@"Resolving the address", nil));
	[self.viewController.geoCoder reverseGeocodeLocation:_currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
		NSLog(NSLocalizedString(@"Found placemarks: %@, error: %@", nil), placemarks, error);
		if (error == nil && [placemarks count] > 0) {
			self.viewController.placeMark = [placemarks lastObject];
			self.viewController.adressLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
								 self.viewController.placeMark.subThoroughfare, self.viewController.placeMark.thoroughfare,
								 self.viewController.placeMark.postalCode, self.viewController.placeMark.locality,
								 self.viewController.placeMark.administrativeArea,
								 self.viewController.placeMark.country];
		} else {
			NSLog(@"%@", error.debugDescription);
		}
	}];

}



@end