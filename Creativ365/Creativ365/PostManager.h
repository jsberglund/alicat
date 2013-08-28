//
//  PostManager.h
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved. Eumir say: Nigga.
//

#import <Foundation/Foundation.h>
#import "PhotoPost.h"

@interface PostManager : NSObject
- (void)getPostsByMonth:(NSString *)month
                andYear:(NSString *)year
                success:(void (^)(NSArray *posts))success
                failure:(void (^)(NSError *error))failure;

- (NSString *)getTagByMonth:(NSString *)month
                    andYear:(NSString *)year;

- (void)submitPost:(PhotoPost *)photoPost;

-(NSArray *)sortByDateForPhotoPosts:(NSArray *)photoPostsArray;
@end
