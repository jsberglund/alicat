//
//  ResponseParser.m
//  Creativ365
//
//  Created by Jessica Berglund on 8/23/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "ResponseParser.h"
#import "PhotoPost.h"

@implementation ResponseParser
- (NSArray *)parseIntoPostsWithJSONData:(NSDictionary *)jsonData
{
    NSMutableArray *postsArray = [[NSMutableArray alloc] init]; 

    if ([jsonData isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary*)jsonData;
        
        NSArray *posts = [dict objectForKey:@"posts"];
        
        if (posts)
        {
            for (int i = 0; i < posts.count; i++) {
                PhotoPost *photoPost = [[PhotoPost alloc] init];
                
                photoPost.title = [posts[i] objectForKey:@"caption"];
                photoPost.postID = [[posts[i] objectForKey:@"id"] stringValue];
                photoPost.postUrl = [NSURL URLWithString:[posts[i] objectForKey:@"post_url"]];
                photoPost.postDate = [NSDate dateWithTimeIntervalSince1970:([[posts[i] objectForKey:@"timestamp"] longLongValue])];
                
                photoPost.timestamp = [posts[i] objectForKey:@"timestamp"];
                
                //if a post has multiple photos, we'll just take the first
                NSArray *photos = [posts[i] objectForKey:@"photos"] ;
               
                if (photos.count > 0)
                {
                    NSDictionary *original_size = [photos[0] objectForKey:@"original_size"];
                    photoPost.fullPhotoUrl = [NSURL URLWithString:[original_size objectForKey:@"url"]];
                    
                    NSArray *alt_sizes = [photos[0] objectForKey:@"alt_sizes"];
                    for (int j = 0; j < alt_sizes.count; j++)
                    {
                        NSNumber *width = [alt_sizes[j] objectForKey:@"width"];
                        if ([width isEqual: @250])
                        {
                            photoPost.thumbnailUrl = [NSURL URLWithString:[alt_sizes[j] objectForKey:@"url"]];
                        }
                        else if ([width isEqual: @75])
                        {
                            photoPost.iconUrl = [NSURL URLWithString:[alt_sizes[j] objectForKey:@"url"]];
                            
                        }
                    }
                }
                
                [postsArray addObject:photoPost];
            }
        }
    }
    
    return postsArray;
}

- (UserInfo *)parseIntoUserInfoWithJSONData:(NSDictionary *)jsonData
{
    UserInfo *user = [[UserInfo alloc] init];
    
    if ([jsonData isKindOfClass:[NSDictionary class]]) {
        NSDictionary *userDict = [((NSDictionary*)jsonData) objectForKey:@"user"];
        user.name = [userDict objectForKey:@"name"];
        
        NSMutableArray *blogsArray = [[NSMutableArray alloc] init];
        NSArray *blogs = [userDict objectForKey:@"blogs"];
        
        if (blogs)
        {
            for (int i = 0; i < blogs.count; i++) {
                Blog *blog = [[Blog alloc] init];
                blog.name = [blogs[i] objectForKey:@"name"];
                blog.title = [blogs[i] objectForKey:@"title"];
                blog.url = [blogs[i] objectForKey:@"url"];
                blog.hostname = [self stripHTTPFromUrl:blog.url];

                BOOL isPrimary = [[blogs[i] objectForKey:@"primary"] boolValue];
                if (isPrimary) {
                    [blogsArray insertObject:blog atIndex:0];
                    user.primaryBlog = blog;
                } else {
                    [blogsArray addObject:blog];
                }
            }
            
            user.blogs = blogsArray;
        }
    }
    
    return user;
}

-(NSString *)stripHTTPFromUrl:(NSString *)url
{
    NSString* stringWithoutHttp = [url stringByReplacingOccurrencesOfString:@"http://" withString:@""];
    
    stringWithoutHttp = [stringWithoutHttp stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    return stringWithoutHttp;
}

@end
