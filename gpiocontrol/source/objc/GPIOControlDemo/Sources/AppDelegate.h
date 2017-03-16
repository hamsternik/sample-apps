//
//  AppDelegate.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 3/7/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

