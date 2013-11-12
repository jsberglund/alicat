//
//  LoginViewController.m
//  Creativ365
//
//  Created by Jessica Berglund on 9/1/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "LoginViewController.h"
#import "AuthenticationManager.h"
#import "AppDelegate.h"

@interface LoginViewController ()
@property (strong, nonatomic) AuthenticationManager *authManager;
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.authManager = ((AppDelegate *)[UIApplication
                                        sharedApplication].delegate).authManager;
    
    
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Logout"
                                      style:UIBarButtonItemStyleBordered
                                     target:nil
                                     action:nil];
    
    
    
    //first try to get user if already logged in
    [self.authManager getCurrentUserInfoWithSuccess:^(UserInfo *user) {
        self.currentUser = user;
        [self  performSegueWithIdentifier:@"CalendarViewControllerSegue" sender:self];
    } andFailure:^(NSError *error) {
        NSLog(@"================> %@", @"No User, not logged in");
    }];
}

-(void)setCurrentUser:(UserInfo *)currentUser
{
    ((AppDelegate *)[UIApplication
                     sharedApplication].delegate).currentUser = currentUser;
}

-(UserInfo *)currentUser
{
    return ((AppDelegate *)[UIApplication
                            sharedApplication].delegate).currentUser;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButtonYapped:(id)sender {
    //clear current user
    self.currentUser = nil;
    
    [self.authManager AuthenticateUserWithCompletion:^(BOOL success){
        NSLog(@"call back success");
        
        if (success) {
        
            [self.authManager getCurrentUserInfoWithSuccess:^(UserInfo *user) {
                NSLog(@"Successfully retrieved user");
                self.currentUser = user;
                //segue to cal controller
                [self  performSegueWithIdentifier:@"CalendarViewControllerSegue" sender:self];
            } andFailure:^(NSError *error) {
                NSLog(@"failed to get user, alert user?");
            }];
        }
    }];
}


@end
