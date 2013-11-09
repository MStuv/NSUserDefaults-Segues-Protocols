//
//  MASSignInViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Mark Stuver on 11/7/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MASCreateAccountViewController.h"

@interface MASSignInViewController : UIViewController <MASCreateAccountViewControllerDelegate>


@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@property (strong, nonatomic) NSString *currentUserName;


- (IBAction)loginButtonPressed:(UIButton *)sender;
- (IBAction)createAccountBarButtonPressed:(UIBarButtonItem *)sender;
@end
