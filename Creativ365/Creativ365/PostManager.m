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
@property (strong, nonatomic) NSString *hostname;
@end

@implementation PostManager

- (id)initWithHostname:(NSString *)hostname
{
    self = [super init];
    if (self) {
        self.tumblrParser = [[ResponseParser alloc] init];
        self.hostname = hostname;
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
        
       [[TMAPIClient sharedInstance] posts:self.hostname type:@"photo" parameters:params callback:^(id postsData, NSError *error) {
            
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
//TODO add month tags
- (void)submitPost:(PhotoPost *)photoPost
         withImage:(UIImage *)image
           success:(void (^)(NSString *postID))success
           failure:(void (^)(NSError *error))failure

{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //save UIImage to temp dir
        NSString *tempDir = NSTemporaryDirectory();
        NSString *path = [tempDir stringByAppendingPathComponent:@"upload-image.jpg"];
        NSData *imageData = UIImageJPEGRepresentation(image,1);
        [imageData writeToFile:path atomically:YES];
        
        // Create file manager
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        
        [[TMAPIClient sharedInstance] photo:self.hostname
                              filePathArray:@[path]
                           contentTypeArray:@[@"image/jpg"]
                              fileNameArray:@[@"upload-image.jpg"]
                                 parameters:@{@"caption" : photoPost.title}
                                   callback:^(id response, NSError *postError) {
                                       
                                       //delete temp file
                                       NSError* __autoreleasing error = NULL;
                                       if ([fileMgr removeItemAtPath:path error:&error] != YES)
                                           NSLog(@"Unable to delete temp file");
                                       
                                       if (postError)
                                           NSLog(@"Error posting to Tumblr");
                                       else
                                           NSLog(@"Posted photo to Tumblr: %@", response);
                                   }];
        
    });
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
