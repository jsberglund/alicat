//
//  ResponseParser.h
//  Creativ365
//
//  Created by Jessica Berglund on 8/23/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

@interface ResponseParser : NSObject
- (NSArray *)parseIntoPostsWithJSONData:(NSDictionary *)jsonData;
- (UserInfo *)parseIntoUserInfoWithJSONData:(NSDictionary *)jsonData;
@end
