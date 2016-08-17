//
//  ViewController.m
//  google_login
//
//  Created by Wei Fan on 8/15/16.
//  Copyright © 2016 Wei Fan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    if ([GIDSignIn sharedInstance].currentUser.authentication == nil) {
        // Not signed in
        NSLog(@"not signed in");
    } else {
        // Signed in
        NSLog(@"signed in");
    }

}

- (IBAction)didTapSignOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
    NSLog(@"Sign out for current user");
}

- (IBAction)didSignIn:(id)sender {
    [[GIDSignIn sharedInstance] signIn];
}

- (IBAction)didDisconnect:(id)sender {
    [[GIDSignIn sharedInstance] disconnect];
}

//silently sign in

@end
