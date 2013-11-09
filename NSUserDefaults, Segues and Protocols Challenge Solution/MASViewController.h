//
//  MASViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Mark Stuver on 11/7/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MASViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;

/// Create a property to hold the data passed from the prepareToSegue in the signInVC
@property (strong, nonatomic) NSString *currentUsername;

@end
