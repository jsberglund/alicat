//
//  AuthenticationManager.m
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "AuthenticationManager.h"
#import "TMAPIClient.h"
#import "Constants.h"

@interface AuthenticationManager()
@property (nonatomic, strong) NSString *storedOAuthToken;
@property (nonatomic, strong) NSString *storedOAuthTokenSecret;

@end

@implementation AuthenticationManager


- (void)AuthenticateUserWithCompletion:(void (^)(BOOL success))onComplete
{
    //TODO BEFORE CHECKING IN: put in untracked property file
    [TMAPIClient sharedInstance].OAuthConsumerKey = kTumblrConsumerKey;
    [TMAPIClient sharedInstance].OAuthConsumerSecret = kTumblrConsumerSecret;
    
    _storedOAuthToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    _storedOAuthTokenSecret = [[NSUserDefaults standardUserDefaults] valueForKey:@"token_secret"];
    
    if (_storedOAuthToken.length == 0 || _storedOAuthToken == nil)
    {
        // Not Authenticated - so do authentication.
        
        [[TMAPIClient sharedInstance] authenticate:kTumblrAppCallbackURL callback:^(NSError *error)
         {
             if (!error)
             {
                 [[NSUserDefaults standardUserDefaults] setValue:[TMAPIClient sharedInstance].OAuthToken forKey:@"token"];
                 [[NSUserDefaults standardUserDefaults] setValue:[TMAPIClient sharedInstance].OAuthTokenSecret forKey:@"token_secret"];
                 
                 onComplete(true);
             }
             else
                 onComplete(true);
         }];
    }
    else
    {
        // Already authenticated
        
        [TMAPIClient sharedInstance].OAuthToken = _storedOAuthToken;
        [TMAPIClient sharedInstance].OAuthTokenSecret = _storedOAuthTokenSecret;
        
        onComplete(true);
    }
}



@end
