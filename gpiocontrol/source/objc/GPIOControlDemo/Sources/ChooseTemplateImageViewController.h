//
//  ChooseTemplateImageViewController.h
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 3/20/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^templateImageBlock)(UIImage *templateImage);

@interface ChooseTemplateImageViewController : UIViewController

@property (copy, nonatomic) templateImageBlock block;

@end
