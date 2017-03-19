//
//  GroupAndControllerAddingViewController.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 3/19/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "GroupAndControllerAddingViewController.h"
#import "ControllerAddingViewController.h"

@interface GroupAndControllerAddingViewController ()

@end

@implementation GroupAndControllerAddingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - IBActions

- (IBAction)presentAddControllerDialog:(id)sender {
    ControllerAddingViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ControllerAddingViewControllerID"];
    vc.providesPresentationContextTransitionStyle = YES;
    vc.definesPresentationContext = YES;
    [self presentViewController:vc animated:YES completion:nil];
}


@end
