//
//  Device.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "Device.h"

@interface Device ()

@property (strong, nonatomic, nonnull) NSString *name;
@property (strong, nonatomic, nullable) UIImage *image;
@property (assign, nonatomic) NSInteger vectorID;
@property (strong, nonatomic, nonnull) NSString *portTitle;
@property (strong, nonatomic, nonnull) NSString *portID;
@property (assign, nonatomic) BOOL isTurnOn;
@property (assign, nonatomic) BOOL isLocked;

@end


@implementation Device

- (instancetype)initWithName:(NSString *)name image:(UIImage *)image vectorID:(NSInteger)vectorID portTitle:(NSString *)portTitle portID:(NSString *)portID isTurnOn:(BOOL)isTurnOn isLocked:(BOOL)isLocked
{
    self = [super init];
    if (self) {
        self.name = name;
        self.image = image;
        self.vectorID = vectorID;
        self.portTitle = portTitle;
        self.portID = portID;
        self.isTurnOn = isTurnOn;
        self.isLocked = isLocked;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Device %p : name: %@, image: %@, portTitle: %@, portID: %@, vectorID: %ld, isTurnOn: %@, isLocked: %@",
            self,
            self.name,
            self.image,
            self.portTitle,
            self.portID,
            (long)self.vectorID,
            self.isTurnOn ? @"YES" : @"NO",
            self.isLocked ? @"YES" : @"NO"
            ];
}

@end
