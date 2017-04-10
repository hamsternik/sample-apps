//
//  Device.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Device : NSObject

@property (readonly, nonnull) NSString *name;
@property (readonly, nullable) UIImage *image;
@property (readonly) NSInteger vectorID;
@property (readonly, nonnull) NSString *portTitle;
@property (readonly, nonnull) NSString *portID;
@property (readonly) BOOL isTurnOn;
@property (readonly) BOOL isLocked;

@end
