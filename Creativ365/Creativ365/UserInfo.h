//
//  UserInfo.h
//  Creativ365
//
//  Created by Jessica Berglund on 8/31/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Blog.h"

@interface UserInfo : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *blogs;
@property (strong, nonatomic) Blog *primaryBlog;

@end
