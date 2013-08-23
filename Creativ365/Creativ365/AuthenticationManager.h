//
//  AuthenticationManager.h
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthenticationManager : NSObject
- (void)AuthenticateUserWithCompletion:(void (^)(BOOL success))onComplete;
@end
