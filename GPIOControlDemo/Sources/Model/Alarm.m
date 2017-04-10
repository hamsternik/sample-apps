//
//  Alarm.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "Alarm.h"

@interface Alarm ()

@property (strong, nonatomic, nonnull) NSDate *time;
@property (strong, nonatomic, nonnull) NSString *action;
@property (strong, nonatomic, nonnull) NSString *name;
@property (strong, nonatomic, nonnull) NSString *iteration;
@property (assign, nonatomic) BOOL isActive;
@property (assign, nonatomic) NSInteger ID;

@end

@implementation Alarm

- (instancetype)initWithTime:(NSDate *)time action:(NSString *)action name:(NSString *)name iteration:(NSString *)iteration isActive:(BOOL)isActive id:(NSInteger)ID
{
    self = [super init];
    if (self) {
        self.time = time;
        self.action = action;
        self.name = name;
        self.iteration = iteration;
        self.isActive = isActive;
        self.ID = ID;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Alarm %p : time %@, action %@, name %@, iteration %@, isActive %@, ID %ld",
            self,
            self.time,
            self.action,
            self.name,
            self.iteration,
            self.isActive ? @"YES" : @"NO",
            self.ID
            ];
}

@end
