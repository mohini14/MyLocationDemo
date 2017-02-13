//
// Created by Mohini on 13/02/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "LocationManagerUtils.h"


@implementation LocationManagerUtils {

}
+ (LocationManagerUtils *)getInstance {
    static LocationManagerUtils *instantVar = nil;
    @synchronized (self) {
        if(instantVar == nil) {
            instantVar = [[LocationManagerUtils alloc] init];
            instantVar.locationManager=[[CLLocationManager alloc]init];
            instantVar.locationManager.delegate = instantVar;//this class is using the delegates.
            instantVar.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//            instantVar.locationManager.startUpdatingLocation;
//            instantVar.locationManager.requestWhenInUseAuthorization;
        }
    }
    return instantVar;
}

- (void)getLocation:(void (^)(CLLocation *newLocation, CLLocation *oldLocation, NSError *error))completionHandler andExecuteOnMainThread: (BOOL) onMainThread {
    self.completionHandlerBlock = completionHandler;
    self.onMainThread = onMainThread;
    self.locationManager.startUpdatingLocation;

}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if(self.onMainThread){
        dispatch_async(dispatch_get_main_queue(), ^(){
            self.completionHandlerBlock(nil, nil, error);
        });
    }else {
        self.completionHandlerBlock(nil, nil, error);
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    if(self.onMainThread){
        dispatch_async(dispatch_get_main_queue(), ^(){
            self.completionHandlerBlock(newLocation, oldLocation, nil);
        });
    }else {
        self.completionHandlerBlock(newLocation, oldLocation, nil);
    }
}

@end