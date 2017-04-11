//
//  AddAlarmViewController.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alarm.h"

typedef void (^addAlarmBlock)(Alarm * _Nonnull);

@interface AddAlarmViewController : UIViewController

@property (copy, nonatomic, nullable) addAlarmBlock block;

@end
