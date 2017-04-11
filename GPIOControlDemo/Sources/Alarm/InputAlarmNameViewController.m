//
//  InputAlarmNameViewController.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "InputAlarmNameViewController.h"

@interface InputAlarmNameViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *validationErrorLabel;

@end

@implementation InputAlarmNameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.validationErrorLabel.hidden = YES;
}

- (IBAction)OKButtonPressed:(id)sender
{
    if (!self.inputNameTextField || [self.inputNameTextField.text isEqualToString:@""]) {
        self.validationErrorLabel.hidden = NO;
        return;
    }
    
    if (self.block)
        self.block(self.inputNameTextField.text);
    
    self.validationErrorLabel.hidden = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
