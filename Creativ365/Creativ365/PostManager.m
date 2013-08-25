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

@implementation PostManager
- (NSArray *)getPhotoPostsByMonth:(NSString *)monthString
{
//    [TMAPIClient sharedInstance] posts:@"creativ365.tumblr.com" type:@"photo" parameters:@{} callback:^(NSError *error){
//        NSLog(@"call back success");
//        //self.statusLabel.text = @"User is authenticated!";
//    }];
    
    [[TMAPIClient sharedInstance] posts:@"creativ365.tumblr.com" type:@"photo" parameters:@{@"tag" : @"creativ365august2013"} callback:^(NSData *erk, NSError *error) {
        NSLog(@"coooooollllll");
    } ];
    
    return nil;
}
@end
