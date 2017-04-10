//
//  Controller.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "Controller.h"

@interface Controller ()

@property (strong, nonatomic, nonnull) NSString *controllerID;
@property (strong, nonatomic, nullable) UIImage *image;
@property (assign, nonatomic) NSInteger vectorID;
@property (strong, nonatomic, nonnull) NSString *portName;
@property (assign, nonatomic) BOOL isActive;

@end


@implementation Controller

- (instancetype)initWithControllerID:(NSString *)controllerID image:(UIImage *)image vectorID:(NSInteger)vectorID portName:(NSString *)portName isActive:(BOOL)isActive
{
    self = [super init];
    if (self) {
        self.controllerID = controllerID;
        self.image = image;
        self.vectorID = vectorID;
        self.portName = portName;
        self.isActive = isActive;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Controller %p : controllerID: %@, image: %@, portName: %@, vectorID: %ld, isActive: %@",
            self,
            self.controllerID,
            self.image,
            self.portName,
            self.vectorID,
            self.isActive ? @"YES" : @"NO"
            ];
}

@end
