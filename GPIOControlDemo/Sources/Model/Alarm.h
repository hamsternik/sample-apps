//
//  Alarm.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alarm : NSObject

@property (readonly) NSInteger alarmID;
@property (readonly, nonnull) NSDate *time;
@property (readonly, nonnull) NSString *action;
@property (readonly, nonnull) NSString *name;
@property (readonly, nonnull) NSString *iteration;
@property (readonly) BOOL isActive;

@end
