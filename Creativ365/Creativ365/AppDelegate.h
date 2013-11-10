//
//  AppDelegate.h
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"
#import "AuthenticationManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UserInfo *currentUser;
@property (strong, nonatomic) AuthenticationManager *authManager;

@end
