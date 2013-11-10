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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.authManager = [[AuthenticationManager alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButtonYapped:(id)sender {
    //clear current user
    ((AppDelegate *)[UIApplication
                     sharedApplication].delegate).currentUser = nil;
    
    [self.authManager AuthenticateUserWithCompletion:^(BOOL success){
        NSLog(@"call back success");
        
        [self.authManager getCurrentUserInfoWithSuccess:^(UserInfo *user) {
            NSLog(@"Successfully retrieved user");
            ((AppDelegate *)[UIApplication
                             sharedApplication].delegate).currentUser = user;
            //dismiss self
            [self dismissViewControllerAnimated:YES completion:^{
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"loginDismissed" object:nil];

            }];
        } andFailure:^(NSError *error) {
            NSLog(@"failed to get user");
        }];
    }];
}



@end
