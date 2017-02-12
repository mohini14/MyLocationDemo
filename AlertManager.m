//
// Created by Mohini on 12/02/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import "AlertManager.h"


@implementation AlertManager {

}

+ (void)showAlertPopupWithTitle:(NSString *)title andMessage:(NSString *)message andActionTitle:(NSString *)actionTitle forView:(UIViewController *)view {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* ok = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];

    [view presentViewController:alertController animated:YES completion:nil];
}
@end