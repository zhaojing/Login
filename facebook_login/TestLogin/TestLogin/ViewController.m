//
//  ViewController.m
//  TestLogin
//
//  Created by Lvju Wang on 8/15/16.
//  Copyright © 2016 ljwang. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *Login;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FBSDKLoginButton *loginButtonFacebook = [[FBSDKLoginButton alloc] init];
    loginButtonFacebook.delegate = self;
    loginButtonFacebook.center = self.view.center;
    [self.view addSubview:loginButtonFacebook];
    loginButtonFacebook.readPermissions = @[@"public_profile", @"email", @"user_friends"];
}

#pragma mark - userDefinedButton

- (IBAction)clickLogin:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
     fromViewController: self
     handler: ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}

#pragma mark - defaultButton

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    NSLog(@"token = %@,userId = %@",result.token.tokenString,result.token.userID);
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"log out");
}

@end
