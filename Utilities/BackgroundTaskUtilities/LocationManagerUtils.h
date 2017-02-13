//
// Created by Mohini on 13/02/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionHandlerBlock) (CLLocation *newLocation, CLLocation *oldLocation, NSError *error);

@interface LocationManagerUtils : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) CompletionHandlerBlock completionHandlerBlock;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) BOOL onMainThread;

+ (LocationManagerUtils *)getInstance;
- (void)getLocation:( CompletionHandlerBlock ) completionHandler andExecuteOnMainThread: (BOOL) onMainThread ;

@end