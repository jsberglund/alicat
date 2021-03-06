//
//  PhotoPost.h
//  Creativ365
//
//  Created by Jessica Berglund on 8/23/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoPost : NSObject
@property (strong, nonatomic) NSString *postID;
@property (strong, nonatomic) NSURL *postUrl;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;

@property (strong, nonatomic) NSDate *postDate;
@property (strong, nonatomic) NSNumber *timestamp;

@property (strong, nonatomic) NSURL *fullPhotoUrl;
@property (strong, nonatomic) NSURL *thumbnailUrl;
@property (strong, nonatomic) NSURL *iconUrl;
@end
