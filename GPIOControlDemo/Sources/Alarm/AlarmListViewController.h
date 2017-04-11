//
//  AlarmListViewController.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alarm.h"

@interface AlarmListViewController : UIViewController

@property (strong, nonatomic, nonnull) NSMutableArray<Alarm *> *alarms;

@end
