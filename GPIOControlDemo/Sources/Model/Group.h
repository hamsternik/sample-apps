//
//  Group.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Device.h"
#import "Alarm.h"

@interface Group : NSObject

@property (readonly, nonnull) NSString *name;
@property (readonly, nullable) UIImage *image;
@property (readonly) NSInteger vectorID;
@property (readonly, nonnull) NSString *portStatus;
@property (readonly, nonnull) NSString *power;

@property (readonly) BOOL isTurnOn;
@property (readonly) NSInteger ID;

@property (strong, nonatomic, nonnull) NSMutableArray<Group *> *groups;
@property (strong, nonatomic, nonnull) NSMutableArray<Device *> *devices;
@property (strong, nonatomic, nonnull) NSMutableArray<Alarm *> *alarms;

@end
