//
//  MASSignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Mark Stuver on 11/7/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASSignInViewController.h"
#import "MASViewController.h"

@interface MASSignInViewController ()

@end

@implementation MASSignInViewController

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

}




/* PREPARE FOR SEGUE
   • Used to pass info from currentVC to destinationVC
   • Use if statements to test that the proper segue is being used your intended data
        ** Note: when testing (sender isKindOfClass:) the class refers to the object that was used in Storyboard.
        ie: sender is a UIBarButtonItem placed in Storyboard so the test would be:
            if sender isKindOfClass: UIBarButtonItem class... then do this.   **/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
///SETTING DELEGATE FOR CREATEACCOUNT VC DELEGATE PROTOCOL
    // is the sender of class UIBarButtonItem... if so continue
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
    
        // is the destination of the segue of class createAccountVC... if so continue
        if ([segue.destinationViewController isKindOfClass:[MASCreateAccountViewController class]]) {
            
            // create instance of createAccountVC and set its value equal to the segue's destinationVC
            MASCreateAccountViewController *createAccountVC = segue.destinationViewController;
            // set instance (now the destinationVC) delegate property to the current VC
            createAccountVC.delegate = self;
            // Now in the destinationVC (createAccount) when a delegate method is called (in cancel button) the delegate method knows that the currentVC (signInVC) is the delegate.
        }
    }
 
///SENDING DATA TO MAS VC
    if ([sender isKindOfClass:[UIButton class]]) {
        
        if ([segue.destinationViewController isKindOfClass:[MASViewController class]]) {
            
            MASViewController *userVC = segue.destinationViewController;
            
            userVC.currentUsername = self.currentUserName;
        }
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButtons
- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    if ([self doesTheUserHaveAnAccount]==YES) {
        
    /// if the user has logged in correctly, set the currentUserName object for pushing the data.
        
        self.currentUserName = self.usernameTextField.text;
       
        //PerformSeque to the MASVC using the "toViewController" segue
        [self performSegueWithIdentifier:@"toViewController" sender:sender];
    }
}

- (IBAction)createAccountBarButtonPressed:(UIBarButtonItem *)sender {
    //PerformSeque to the Create Account VC using the "toCreateAccountViewController" segue
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:sender];
}


#pragma mark - Helper Methods

// Check that the user login is correct
-(BOOL)doesTheUserHaveAnAccount
{
    // Create an array with the userData stored in NSUserDefaults
    NSArray *userLogInAsPropertyList = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_USER_ACCOUNT_LOGIN];
    
    // enumerate through array to find a matching username
       for (NSDictionary *dictionary in userLogInAsPropertyList) {
           
           if (!([dictionary[USER_NAME] isEqualToString:self.usernameTextField.text]))
            {
                NSLog(@"Called from SignIn: %@",dictionary[USER_NAME]);
                
            } else if (([dictionary[USER_NAME] isEqualToString:self.usernameTextField.text]) && (!([dictionary[USER_PASSWORD] isEqualToString:self.passwordTextField.text]))) {
               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong Password" message:@"Please try again" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
               [alert show];
               return NO;
            }
           
            else if (([dictionary[USER_NAME] isEqualToString:self.usernameTextField.text]) && ([dictionary[USER_PASSWORD] isEqualToString:self.passwordTextField.text])) {
                
                return YES;
            }
           
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Username Does Not Exsist"message:@"Please create an account to continue" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    
    [alert show];
    return NO;
}


#pragma mark - MASCreateAccountViewController Delegate Methods

-(void)didCancel
{
    // Dismiss VC
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)didCreateAccount
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
