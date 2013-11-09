//
//  MASSignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Mark Stuver on 11/7/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASSignInViewController.h"

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
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    //PerformSeque to the MASVC using the "toViewController" segue
    [self performSegueWithIdentifier:@"toViewController" sender:sender];

}

- (IBAction)createAccountBarButtonPressed:(UIBarButtonItem *)sender {
    
    //PerformSeque to the Create Account VC using the "toCreateAccountViewController" segue
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:sender];
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
