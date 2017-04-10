//
//  Alarm.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "Alarm.h"

@interface Alarm ()

@property (assign, nonatomic) NSInteger alarmID;
@property (strong, nonatomic, nonnull) NSDate *time;
@property (strong, nonatomic, nonnull) NSString *action;
@property (strong, nonatomic, nonnull) NSString *name;
@property (strong, nonatomic, nonnull) NSString *iteration;
@property (assign, nonatomic) BOOL isActive;

@end

@implementation Alarm

- (instancetype)initWithId:(NSInteger)alarmID time:(NSDate *)time action:(NSString *)action name:(NSString *)name iteration:(NSString *)iteration isActive:(BOOL)isActive
{
    self = [super init];
    if (self) {
        self.alarmID = alarmID;
        self.time = time;
        self.action = action;
        self.name = name;
        self.iteration = iteration;
        self.isActive = isActive;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Alarm %p : alarmID %ld, time %@, action %@, name %@, iteration %@, isActive %@",
            self,
            self.alarmID,
            self.time,
            self.action,
            self.name,
            self.iteration,
            self.isActive ? @"YES" : @"NO"];
}

@end
