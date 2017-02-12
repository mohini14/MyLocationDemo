//
//  ViewController.h
//  MyLocationDemo
//
//  Created by Mohini Sindhu  on 09/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AlertManager.h"

@class ViewControllerDelegates;

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;

@property (weak, nonatomic) IBOutlet UILabel *adressLabel;
@property (strong, nonatomic) CLGeocoder* geoCoder;
@property (strong, nonatomic) CLPlacemark *placeMark;
@property (strong, nonatomic) ViewControllerDelegates *viewControllerDelegates;
@property(nonatomic, strong) CLLocationManager *locationManager;


- (IBAction)getYourCurrentLocationButtonPressed:(id)sender;

@end

