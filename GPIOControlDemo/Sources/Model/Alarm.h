//
//  Alarm.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AlarmAction)
{
    AlarmActionPowerOff = 0,
    AlarmActionPowerOn = 1,
    AlarmActionToggle = 3
};

@interface Alarm : NSObject

@property BOOL isActive;

@property (readonly) NSInteger ID;
@property (readonly, nonnull) NSDate *time;
@property (readonly) AlarmAction action;
@property (readonly, nonnull) NSString *name;
@property (readonly, nonnull) NSString *iteration;

- (nonnull instancetype)initWithTime:(nonnull NSDate *)time
                              action:(AlarmAction)action
                                name:(nonnull NSString *)name
                           iteration:(nonnull NSString *)iteration
                            isActive:(BOOL)isActive ID:(NSInteger)ID;

- (nonnull NSString *)actionTitle;

@end
