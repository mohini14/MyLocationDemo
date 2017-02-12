//
// Created by Mohini on 12/02/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ViewControllerDelegates : NSObject

@property (nonatomic, strong) ViewController *viewController;

+(ViewControllerDelegates *)initWithVC: (ViewController *) vc;

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
@end