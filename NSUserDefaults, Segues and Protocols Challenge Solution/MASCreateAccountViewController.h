//
//  MASCreateAccountViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Mark Stuver on 11/7/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

/// Create Protocol
@protocol MASCreateAccountViewControllerDelegate <NSObject>

/// Protocol Methods
@required
-(void)didCancel;
-(void)didCreateAccount;

@end

@interface MASCreateAccountViewController : UIViewController

/// Create Property of Protocol named delegate
@property (strong, nonatomic) id <MASCreateAccountViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)createAccountButtonPressed:(UIButton *)sender;

@end
