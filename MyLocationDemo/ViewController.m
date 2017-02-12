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

    self.locationManager =[[CLLocationManager alloc]init];
    _geoCoder=[[CLGeocoder alloc]init];

    self.viewControllerDelegates = [ViewControllerDelegates initWithVC:self];
    self.locationManager.delegate=self ;//in order to tell that this class is using protocol conform


}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


-(IBAction)getYourCurrentLocationButtonPressed:(id)sender{
	self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
	[self.locationManager startUpdatingLocation];
	[self.locationManager requestWhenInUseAuthorization]; // Add This Line

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [self.viewControllerDelegates locationManager:manager didFailWithError:error];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    [self.viewControllerDelegates locationManager:manager didUpdateToLocation:newLocation fromLocation:oldLocation];
}


@end
