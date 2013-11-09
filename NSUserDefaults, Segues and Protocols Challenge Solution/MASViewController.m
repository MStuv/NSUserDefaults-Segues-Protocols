//
//  MASViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Mark Stuver on 11/7/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASViewController.h"
#import "MASCreateAccountViewController.h"

@interface MASViewController ()

@end

@implementation MASViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"Current User is: %@", self.currentUsername);
    
    /// Create an array with the userData stored in NSUserDefaults
    NSArray *userLogInAsPropertyList = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_USER_ACCOUNT_LOGIN];
    
    /// enumerate through array to find a matching username
    for (NSDictionary *dictionary in userLogInAsPropertyList) {
        
        if ([dictionary[USER_NAME] isEqualToString: self.currentUsername]) {
            
            self.usernameLabel.text = dictionary[USER_NAME];
            self.passwordLabel.text = dictionary[USER_PASSWORD];
        } else {
            NSLog(@"%@ Not correct... keep going", dictionary[USER_NAME]);
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
