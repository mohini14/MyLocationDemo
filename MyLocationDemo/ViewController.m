//
//  ViewController.m
//  MyLocationDemo
//
//  Created by Mohini Sindhu  on 09/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
	CLLocationManager *_locationManager;
	CLGeocoder *_geoCoder;
	CLPlacemark *_placeMark;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	_locationManager=[[CLLocationManager alloc]init];
	_geoCoder=[[CLGeocoder alloc]init];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


-(IBAction)getYourCurrentLocationButtonPressed:(id)sender{
	_locationManager.delegate=self;//in order to tell that this class is using protocol conform
	_locationManager.desiredAccuracy=kCLLocationAccuracyBest;
	[_locationManager startUpdatingLocation];
	
	[_locationManager requestWhenInUseAuthorization]; // Add This Line

	
}

#pragma mark - CLLocationManagerDelegate //implemnting the protocol conformed methods



- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"didFailWithError: %@", error);
//	UIAlertView *errorAlert = [[UIAlertView alloc]
//							   initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//	[errorAlert show];
	
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"error" message:@"Failed to get location" preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
	[alertController addAction:ok];
	
	[self presentViewController:alertController animated:YES completion:nil];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	NSLog(@"didUpdateToLocation: %@", newLocation);
	CLLocation *_currentLocation = newLocation;
	
	if (_currentLocation != nil) {
		_longitudeLabel.text = [NSString stringWithFormat:@"%.8f", _currentLocation.coordinate.longitude];
		_latitudeLabel.text = [NSString stringWithFormat:@"%.8f", _currentLocation.coordinate.latitude];
	}
	NSLog(@"Resolving the adress");
	[_geoCoder reverseGeocodeLocation:_currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
		NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
		if (error == nil && [placemarks count] > 0) {
			_placeMark = [placemarks lastObject];
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




@end
