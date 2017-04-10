//
//  Group.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "Group.h"

@interface Group ()

@property (strong, nonatomic, nonnull) NSString *name;
@property (strong, nonatomic, nullable) UIImage *image;
@property (assign, nonatomic) NSInteger vectorID;
@property (strong, nonatomic, nonnull) NSString *portStatus;
@property (strong, nonatomic, nonnull) NSString *power;

@property (assign, nonatomic) NSInteger ID;
@property (assign, nonatomic) BOOL isTurnOn;

@end

@implementation Group

- (instancetype)initWithName:(NSString *)name image:(UIImage *)image vectorID:(NSInteger)vectorID portStatus:(NSString *)portStatus power:(NSString *)power id:(NSInteger)ID isTurnOn:(BOOL)isTurnOn
{
    self = [super init];
    if (self) {
        self.name = name;
        self.image = image;
        self.vectorID = vectorID;
        self.portStatus = portStatus;
        self.power = power;
        self.ID = ID;
        self.isTurnOn = isTurnOn;
        
        self.groups = [NSMutableArray new];
        self.devices = [NSMutableArray new];
        self.alarms = [NSMutableArray new];
    }
    return self;
}

//- (NSString *)description
//{
//    return [NSString stringWithFormat:@""];
//}

@end
