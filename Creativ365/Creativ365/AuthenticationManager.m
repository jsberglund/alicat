//
//  AuthenticationManager.m
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "AuthenticationManager.h"
#import "TMAPIClient.h"
#import "SecretConstants.h"
#import "ResponseParser.h"


@interface AuthenticationManager()
@property (nonatomic, strong) NSString *storedOAuthToken;
@property (nonatomic, strong) NSString *storedOAuthTokenSecret;
@property (strong, nonatomic) ResponseParser *tumblrParser;
@end

@implementation AuthenticationManager

- (id)init
{
    self = [super init];
    if (self) {
        self.tumblrParser = [[ResponseParser alloc] init];
    }
    return self;
}

- (void)AuthenticateUserWithCompletion:(void (^)(BOOL success))onComplete
{
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
             } else {
                 onComplete(true);
             }
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

- (void)getCurrentUserInfoWithSuccess:(void (^)(UserInfo *user))success andFailure:(void (^)(NSError *error))failure
{
    [[TMAPIClient sharedInstance] userInfo:^(id response, NSError *error) {
        if (!error)
        {
            UserInfo *user = [self.tumblrParser parseIntoUserInfoWithJSONData:response];
            
            success(user);
        } else {
            failure(error);
        }
    }];
}


-(void)logOutUser
{
    //clear out secret values
    [TMAPIClient sharedInstance].OAuthToken = @"";
    [TMAPIClient sharedInstance].OAuthTokenSecret = @"";
    
    [[NSUserDefaults standardUserDefaults] setValue:[TMAPIClient sharedInstance].OAuthToken forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] setValue:[TMAPIClient sharedInstance].OAuthTokenSecret forKey:@"token_secret"];
}

@end
