//
//  MASCreateAccountViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Mark Stuver on 11/7/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASCreateAccountViewController.h"
#import "MASSignInViewController.h"

@interface MASCreateAccountViewController ()
#define ADDED_USER_ACCOUNT_LOGIN @"Added User Account Login"

@end

@implementation MASCreateAccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    
    /// Load data from NSUserDefaults to TEST IN DEBUGGER
     NSArray *userLogInAsPropertyList = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_USER_ACCOUNT_LOGIN];
    for (NSDictionary *dictionary in userLogInAsPropertyList) {
        NSLog(@"%@", dictionary[USER_NAME]);
    }
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIButtons

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    
    NSLog(@"cancelButtonPressed");
    [self.delegate didCancel];
}

- (IBAction)createAccountButtonPressed:(UIButton *)sender {
    
    if ([self wasDataUserEnteredCorrect] == YES ) {
    
    /// calls Method to add user to NSUserDefaults
    [self AddUserToSavedUsers];
    [self.delegate didCreateAccount];
    }
}


/// ADDED CLEAR PLIST BUTTON TO CLEAR THE PLIST BEFORE STARTING
- (IBAction)clearPlistButtonPressed:(UIButton *)sender {
    NSArray *clearPlistArray = [[NSArray alloc] init];
    [[NSUserDefaults standardUserDefaults] setObject:clearPlistArray forKey:ADDED_USER_ACCOUNT_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



#pragma mark - Helper methods

/// Method That Proper Data was Entered by User
-(BOOL)wasDataUserEnteredCorrect
{
    if ([self.usernameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""]||[self.confirmPasswordTextField.text isEqualToString:@""]) {
        
        UIAlertView *textFieldAlert = [[UIAlertView alloc] initWithTitle:@"Missing Data" message:@"Please make sure that all of the text fields have been completed" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [textFieldAlert show];
        return NO;
    }
    
    else if ([self.passwordTextField.text isEqual:self.confirmPasswordTextField.text])
    {
        return YES;
        
    } else {
    
        UIAlertView *textFieldAlert = [[UIAlertView alloc] initWithTitle:@"Passwords do not Match" message:@"Please try again!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [textFieldAlert show];
        return NO;
    }
    
    
}


/// Method Adds New User to the NSUserDefaults plist of users
-(void)AddUserToSavedUsers
{
    /// create instance of NSDictionary and load with username & password using the #define statements as the keys
    NSDictionary *dictionary = @{USER_NAME: self.usernameTextField.text, USER_PASSWORD : self.passwordTextField.text};

    
    /// Creating mutableArrary from the exsisting users in NSUserDefaults
    NSMutableArray *usersAccountSignInAsPropertyLists =
                /// returns a NSUserDefaults propertyList with currently saved user login data
                [[[NSUserDefaults standardUserDefaults]
                  /// from returned NSUserDefaults propertyList, get the array at the ADDED_USER_ACCOUNT_LOGIN key
                  arrayForKey:ADDED_USER_ACCOUNT_LOGIN]
                 /// make the array mutable
                 mutableCopy];
    
    /// if the usersAccountSignInAsPropertyList array has not yet been created... this is the first item... alloc & init. if it is already created, move on.
    if (!usersAccountSignInAsPropertyLists) {
        usersAccountSignInAsPropertyLists = [[NSMutableArray alloc] init];
    }
    
    /// create an object in the array using the dictionary object that is returned when the userAccountsAsAPropertyList method is called.
    [usersAccountSignInAsPropertyLists addObject:dictionary];
    
    /// Set the array as an object in the NSUserDefaults
    [[NSUserDefaults standardUserDefaults] setObject:usersAccountSignInAsPropertyLists forKey:ADDED_USER_ACCOUNT_LOGIN];
    
    /// save the data to the NSUserDefault
    [[NSUserDefaults standardUserDefaults] synchronize];
}




@end
