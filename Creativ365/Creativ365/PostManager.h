//
//  PostManager.h
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved. Eumir say: Nigga.
//

#import <Foundation/Foundation.h>

@interface PostManager : NSObject
- (NSArray *)getPostsByMonth:(NSString *)monthString;
@end
