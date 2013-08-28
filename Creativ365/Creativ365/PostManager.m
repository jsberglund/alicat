//
//  PostManager.m
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "PostManager.h"
#import "TMAPIClient.h"
#import "TMTumblrAppClient.h"
#import "AppConstants.h"
#import "ResponseParser.h"

@interface PostManager ()
@property (strong, nonatomic) ResponseParser *tumblrParser;
@end

@implementation PostManager

- (id)init
{
    self = [super init];
    if (self) {
        self.tumblrParser = [[ResponseParser alloc] init];
    }
    return self;
}
- (void)getPostsByMonth:(NSString *)month
                andYear:(NSString *)year
             success:(void (^)(NSArray *posts))success
                failure:(void (^)(NSError *error))failure
{
    
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *params = @{@"tag" : [self getTagByMonth:month andYear:year], @"format" : @"text"};
        
       //TODO get user blog name after authenticating
       [[TMAPIClient sharedInstance] posts:@"creativ365.tumblr.com" type:@"photo" parameters:params callback:^(NSData *postsData, NSError *error) {
            
            if (!error) {
                NSLog(@"callback succeeded. Posts: %@", postsData);
                
                NSArray *postsArray = [self.tumblrParser parseIntoPostsWithJSONData:postsData];
                
                postsArray = [self sortByDateForPhotoPosts:postsArray];
                
                success(postsArray);
            }
            else
            {
                failure(error);
            }
            
        } ];
    });   
}

-(void)submitPost:(PhotoPost *)photoPost
{
    
}

-(NSArray *)sortByDateForPhotoPosts:(NSArray *)photoPostsArray
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:YES];
    NSArray *orderedArray = [photoPostsArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    return orderedArray;
}

- (NSString *)getTagByMonth:(NSString *)month
                    andYear:(NSString *)year
{
    return [NSString stringWithFormat:@"%@%@%@", kAppName, month, year];
}
@end
