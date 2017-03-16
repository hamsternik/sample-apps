//
//  SignInViewController.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 3/7/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController () <GIDSignInUIDelegate>

@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    //[[GIDSignIn sharedInstance] signInSilently];
}

- (IBAction)didTapSignOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
}


@end
