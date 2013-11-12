//
//  CalendarPostCell.m
//  Creativ365
//
//  Created by Jessica Berglund on 11/9/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "CalendarPostCell.h"
#import <UIImageView+AFNetworking.h>

@implementation CalendarPostCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setPhotoURL:(NSURL *)photoURL
{
    _photoURL = photoURL;
    
    //load imageview
    [self.imageView setImageWithURL:photoURL];
    
//    self.imageView setImageWithURLRequest:nil placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//        //
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
//        //
//    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
