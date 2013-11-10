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

#define TOKEN_KEY @"token"
#define SECRET_KEY @"token_secret"

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
    if (self.storedOAuthToken.length == 0 || self.storedOAuthToken == nil)
    {
        // Not Authenticated - so do authentication.
        
        [[TMAPIClient sharedInstance] authenticate:kTumblrAppCallbackURL callback:^(NSError *error)
         {
             if (!error)
             {
                 self.storedOAuthToken = [TMAPIClient sharedInstance].OAuthToken;
                 self.storedOAuthTokenSecret = [TMAPIClient sharedInstance].OAuthTokenSecret;
                 
                 onComplete(true);
             } else {
                 onComplete(false);
             }
         }];
    }
    else
    {
        // Already authenticated
        
        [TMAPIClient sharedInstance].OAuthToken = self.storedOAuthToken;
        [TMAPIClient sharedInstance].OAuthTokenSecret = self.storedOAuthTokenSecret;
        
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

- (BOOL)isUserLoggedIn
{
    if (self.storedOAuthToken.length == 0 || self.storedOAuthToken == nil) {
        return NO;
    } else {
        return YES;
    }
}

- (void)setStoredOAuthToken:(NSString *)token
{
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:TOKEN_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)storedOAuthToken
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:TOKEN_KEY];
}

- (void)setStoredOAuthTokenSecret:(NSString *)secret
{
    [[NSUserDefaults standardUserDefaults] setObject:secret forKey:SECRET_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)storedOAuthTokenSecret
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SECRET_KEY];
}

-(void)logOutUser
{
    //clear out secret values
    [TMAPIClient sharedInstance].OAuthToken = @"";
    [TMAPIClient sharedInstance].OAuthTokenSecret = @"";
    
    [[NSUserDefaults standardUserDefaults] setValue:[TMAPIClient sharedInstance].OAuthToken forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] setValue:[TMAPIClient sharedInstance].OAuthTokenSecret forKey:@"token_secret"];
}
//
//+(void)saveCurrentUser:(TumblrUser *)object
//{
//    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
//    [prefs setObject:myEncodedObject forKey:kTumblrCurrentUserDefaultsKey];
//}
//
//+(TumblrUser *)currentUser
//{
//    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//    NSData *myEncodedObject = [prefs objectForKey:kTumblrCurrentUserDefaultsKey ];
//    TumblrUser *obj = (TumblrUser *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
//    return obj;
//}

@end
