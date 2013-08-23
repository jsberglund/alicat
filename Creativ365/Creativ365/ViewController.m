//
//  ViewController.m
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "ViewController.h"
#import "AuthenticationManager.h"
#import "PostManager.h"

@interface ViewController ()
@property (strong, nonatomic) AuthenticationManager *authManager;
@property (strong, nonatomic) PostManager *postManager;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.authManager = [[AuthenticationManager alloc] init];
    self.postManager = [[PostManager alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authenticateButtonTapped:(UIButton *)sender
{
    [self.authManager AuthenticateUserWithCompletion:^(BOOL success){
        NSLog(@"call back success");
        self.statusLabel.text = @"User is authenticated!";
    }];
}

- (IBAction)getPostsButtonTapped:(UIButton *)sender
{
    [self.postManager getPostsByMonth:@"august"];
}
@end