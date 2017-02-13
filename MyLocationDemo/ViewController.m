//
//  ViewController.m
//  MyLocationDemo
//
//  Created by Mohini Sindhu  on 09/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "ViewController.h"
#import "AlertManager.h"
#import "ViewControllerDelegates.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

   //in order to tell that this class is using protocol conform


}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


-(IBAction)getYourCurrentLocationButtonPressed:(id)sender{
	
	LocationManager *locationManager = [LocationManager sharedManager];
	[locationManager getUserLocationwithCompletionHandler:^(CLLocation *location, BOOL isSuccessful,CLPlacemark *address) {
		if (location != nil) {
					_longitudeLabel.text = [NSString stringWithFormat:@"%.8f", location.coordinate.longitude];
					_latitudeLabel.text = [NSString stringWithFormat:@"%.8f", location.coordinate.latitude];
				}
		
		if (isSuccessful &&  address ){
						_adressLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
																address.subThoroughfare,address.thoroughfare,
																address.postalCode, address.locality,
																address.administrativeArea,
																address.country];
		
		}
		
		}];

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [self.viewControllerDelegates locationManager:manager didFailWithError:error];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    [self.viewControllerDelegates locationManager:manager didUpdateToLocation:newLocation fromLocation:oldLocation];
}


@end
