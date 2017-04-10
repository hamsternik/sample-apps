//
//  Controller.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Controller : NSObject

@property (readonly, nonnull) NSString *controllerID;
@property (readonly, nullable) UIImage *image;
@property (readonly) NSInteger vectorID;
@property (readonly, nonnull) NSString *portName;
@property (readonly) BOOL isActive;

@end
