//
// Created by Mohini on 13/02/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import "AlertManagerUtils.h"


@implementation AlertManagerUtils {

}

+ (void)showAlertPopupWithTitle:(NSString *)title andMessage:(NSString *)message andActionTitle:(NSString *)actionTitle forView:(UIViewController *)view {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* ok = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];

    [view presentViewController:alertController animated:YES completion:nil];
}

@end