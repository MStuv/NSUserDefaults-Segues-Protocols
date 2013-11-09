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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)cancelButtonPressed:(UIButton *)sender {
    
    NSLog(@"cancelButtonPressed");
    [self.delegate didCancel];
}

- (IBAction)createAccountButtonPressed:(UIButton *)sender {
    
    NSLog(@"createAccountButtonPressed");
    [self.delegate didCreateAccount];
}
@end
