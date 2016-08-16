//
//  ViewController.h
//  google_login
//
//  Created by Wei Fan on 8/15/16.
//  Copyright © 2016 Wei Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>

@interface ViewController : UIViewController <GIDSignInUIDelegate>

@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

@end

