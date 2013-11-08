//
//  MASSignInViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Mark Stuver on 11/7/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MASSignInViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)loginButtonPressed:(UIButton *)sender;
- (IBAction)createAccountBarButtonPressed:(UIBarButtonItem *)sender;
@end
