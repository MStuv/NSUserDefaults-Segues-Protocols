//
//  MASCreateAccountViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Mark Stuver on 11/7/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

/// Create defines for objects that have values that will never change
#define USER_NAME @"username"
#define USER_PASSWORD @"password"
#define ADDED_USER_ACCOUNT_LOGIN @"Added User Account Login"

// Create Protocol
@protocol MASCreateAccountViewControllerDelegate <NSObject>

// Protocol Methods
@required
-(void)didCancel;
-(void)didCreateAccount;

@end

@interface MASCreateAccountViewController : UIViewController

// Create Property of Protocol named delegate
@property (weak, nonatomic) id <MASCreateAccountViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)createAccountButtonPressed:(UIButton *)sender;

- (IBAction)clearPlistButtonPressed:(UIButton *)sender;

@end
