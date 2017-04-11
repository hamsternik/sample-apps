//
//  Alarm.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "Alarm.h"

@interface Alarm ()

@property (assign, nonatomic) NSInteger ID;
@property (strong, nonatomic, nonnull) NSDate *time;
@property (assign, nonatomic) AlarmAction action;
@property (strong, nonatomic, nonnull) NSString *name;
@property (strong, nonatomic, nonnull) NSString *iteration;

@end

@implementation Alarm

- (nonnull instancetype)initWithTime:(nonnull NSDate *)time
                              action:(AlarmAction)action
                                name:(nonnull NSString *)name
                           iteration:(nonnull NSString *)iteration
                            isActive:(BOOL)isActive ID:(NSInteger)ID
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

- (nonnull NSString *)actionTitle
{
    return self.action == AlarmActionPowerOff ? @"PowerOff" : (self.action == AlarmActionPowerOn ? @"PowerOn" : @"Toggle");
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Alarm %p : time %@, action %@, name %@, iteration %@, isActive %@, ID %ld",
            self,
            self.time,
            self.actionTitle,
            self.name,
            self.iteration,
            self.isActive ? @"YES" : @"NO",
            self.ID
            ];
}

- (BOOL)isEqual:(Alarm *)object
{
    if (object == self)
    {
        return YES;
    }
    else if ([object isKindOfClass:self.class])
    {
        return ([object.time isEqual:self.time]);
    }
    return NO;
}

- (NSUInteger)hash
{
    NSUInteger hash = 0;
    hash += self.time.hash;
    hash += self.name.hash;
    return hash;
}

@end
