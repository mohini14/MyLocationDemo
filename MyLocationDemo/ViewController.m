//
//  ViewController.m
//  MyLocationDemo
//
//  Created by Mohini Sindhu  on 09/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "ViewController.h"
#import "AlertManagerUtils.h"
#import "LocationManagerUtils.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}


-(IBAction)getYourCurrentLocationButtonPressed:(id)sender{
     LocationManagerUtils *locationManagerUtils = LocationManagerUtils.getInstance ;
	[locationManagerUtils getLocation: ^(CLLocation *newLocation, CLLocation *oldLocation, NSError *error){
		if( error != nil){
			[AlertManagerUtils showAlertPopupWithTitle:@"Error" andMessage:@"Failed to get Location" andActionTitle:@"OK" forView:self];
		}else{
			if (newLocation != nil) {
				_longitudeLabel.text = [NSString stringWithFormat:@"%.8f", newLocation.coordinate.longitude];
				_latitudeLabel.text = [NSString stringWithFormat:@"%.8f", newLocation.coordinate.latitude];
			}
			NSLog(@"Resolving the adress");
			CLGeocoder *geocoder = [[CLGeocoder alloc]init];
			[geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
				NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
				if (error == nil && [placemarks count] > 0) {

					CLPlacemark *_placeMark = [placemarks lastObject];
					_adressLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
																   _placeMark.subThoroughfare, _placeMark.thoroughfare,
																   _placeMark.postalCode, _placeMark.locality,
																   _placeMark.administrativeArea,
																   _placeMark.country];
				} else {
					NSLog(@"%@", error.debugDescription);
				}
			}];
		}
    } andExecuteOnMainThread:YES];

	
}

@end
