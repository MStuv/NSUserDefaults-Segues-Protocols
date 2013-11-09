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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    ///PerformSeque to the MASVC using the "toViewController" segue
    [self performSegueWithIdentifier:@"toViewController" sender:sender];

}

- (IBAction)createAccountBarButtonPressed:(UIBarButtonItem *)sender {
    
    ///PerformSeque to the Create Account VC using the "toCreateAccountViewController" segue
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:sender];
}
@end
