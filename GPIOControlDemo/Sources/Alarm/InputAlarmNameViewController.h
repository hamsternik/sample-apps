//
//  InputAlarmNameViewController.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^alertNameBlock)(NSString  * _Nonnull alertName);

@interface InputAlarmNameViewController : UIViewController

@property (copy, nonatomic, nullable) alertNameBlock block;

@end
