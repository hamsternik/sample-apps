//
//  ControllerAddingViewController.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 3/19/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "ControllerAddingViewController.h"
#import "ChooseTemplateImageViewController.h"

@interface ControllerAddingViewController ()

@property (weak, nonatomic) IBOutlet UIView *imageForPortsView;
@property (weak, nonatomic) IBOutlet UIImageView *imageForPortsImageView;

@end

@implementation ControllerAddingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showImageSelectionMenu:(id)sender {
    UIAlertController *imageForPortsAlert = [UIAlertController alertControllerWithTitle:nil
                                                                                message:nil
                                                                         preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *templateImageAction = [UIAlertAction actionWithTitle:@"Image from templates"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction *action)
    {
        ChooseTemplateImageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ChooseTemplateImageViewControllerID"];
        __weak ControllerAddingViewController *wself = self;
        vc.block = ^(UIImage *image)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                wself.imageForPortsImageView.image = image;
            });
        };
        vc.providesPresentationContextTransitionStyle = YES;
        vc.definesPresentationContext = YES;
        [self presentViewController:vc animated:YES completion:nil];
    }];
    UIAlertAction *galleryImageAction = [UIAlertAction actionWithTitle:@"Image from gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        // TODO: Implement VC which will open galery with next image cropping
    }];
    UIAlertAction *photoImageAction = [UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        // TODO: Implement VC which will open camera, make photo and crop image
    }];
    [imageForPortsAlert addAction:templateImageAction];
    [imageForPortsAlert addAction:galleryImageAction];
    [imageForPortsAlert addAction:photoImageAction];
    [self presentViewController:imageForPortsAlert animated:YES completion:nil];
}

@end
