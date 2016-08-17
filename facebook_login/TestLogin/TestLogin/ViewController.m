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
             FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                           
                                           initWithGraphPath:result.token.userID
                                           
                                           parameters:@{@"fields": @"id,name,email"}
                                           
                                           HTTPMethod:@"GET"];
             
             [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result,NSError *error) {
                 NSLog(@"%@,%@,%@",result[@"id"],result[@"name"],result[@"email"]);
             }];
         }
     }];
}

@end
