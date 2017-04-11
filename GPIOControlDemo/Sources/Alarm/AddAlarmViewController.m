//
//  AddAlarmViewController.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "AddAlarmViewController.h"
#import "InputAlarmNameViewController.h"

@interface AddAlarmViewController ()

@property (weak, nonatomic) IBOutlet UILabel *iterationStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *alarmNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation AddAlarmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.errorLabel.hidden = YES;
}

#pragma makr - Actions

- (IBAction)showIterationMenu:(id)sender
{
    UIAlertController *iterationsAlertController = [UIAlertController alertControllerWithTitle:nil
                                                                                       message:nil
                                                                                preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *onceIterationAction = [UIAlertAction actionWithTitle:@"Once"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction *action) {}]; // TODO:
    
    UIAlertAction *everydayIterationAction = [UIAlertAction actionWithTitle:@"Every day"
                                                                      style:UIAlertActionStyleDefault
                                                                    handler:^(UIAlertAction *action) {}]; // TODO:
    
    UIAlertAction *mondayFridayIterationAction = [UIAlertAction actionWithTitle:@"Monday - Friday"
                                                                          style:UIAlertActionStyleDefault
                                                                        handler:^(UIAlertAction *action) {}]; // TODO:
    
    UIAlertAction *customisedIterationAction = [UIAlertAction actionWithTitle:@"Customised"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction *action) {}]; // TODO: Implement
    
    [iterationsAlertController addAction:onceIterationAction];
    [iterationsAlertController addAction:everydayIterationAction];
    [iterationsAlertController addAction:mondayFridayIterationAction];
    [iterationsAlertController addAction:customisedIterationAction];
    [self presentViewController:iterationsAlertController animated:YES completion:nil];
}

- (IBAction)addAlarmName:(id)sender
{
    InputAlarmNameViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"InputAlarmNameViewControllerID"];
    __weak AddAlarmViewController *wself = self;
    vc.block = ^(NSString *alarmName)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            wself.alarmNameLabel.text = alarmName;
        });
    };
    vc.providesPresentationContextTransitionStyle = YES;
    vc.definesPresentationContext = YES;
    [self presentViewController:vc animated:YES completion:nil];
}



- (IBAction)addAlarm:(id)sender
{
    // TODO: Add time valiadtion for the new alarm
//    if ([self validateAlarmTime]) {
//        
//    }
}


- (IBAction)dismissController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private Methods

- (BOOL)validateAlarmTime
{
    return NO;
}


@end
