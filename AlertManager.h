//
// Created by Mohini on 12/02/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertManager : NSObject

+ (void)showAlertPopupWithTitle:(NSString *)title andMessage:(NSString *)message andActionTitle:(NSString *)actionTitle forView:(UIViewController *)view;

@end