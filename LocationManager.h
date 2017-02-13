//
//  LocationManager.h
//  MyLocationDemo
//
//  Created by Mohini Sindhu  on 13/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "AlertManager.h"

typedef void (^LocationBlock)(CLLocation* location, BOOL isSuccessful, CLPlacemark *address);

@interface LocationManager : NSObject <CLLocationManagerDelegate>
{
	CLLocationManager* _locationManager;
}
@property (nonatomic,copy) LocationBlock locBlock;

@property (strong, nonatomic) CLGeocoder* geoCoder;
@property (strong, nonatomic) CLPlacemark *placeMark;

+ (instancetype) sharedManager;

- (void) getUserLocationwithCompletionHandler:(LocationBlock)completion;
											

@end
