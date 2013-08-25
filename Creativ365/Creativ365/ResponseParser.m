//
//  ResponseParser.m
//  Creativ365
//
//  Created by Jessica Berglund on 8/23/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "ResponseParser.h"

@implementation ResponseParser
- (NSArray *)parseIntoPostsWithJSONData:(NSData *)jsonData
{
    NSMutableArray *postsArray = [[NSMutableArray alloc] init]; 
    NSError *error = nil;
    
    if (jsonData) {
        
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        if (error) {
            NSLog(@"error is %@", [error localizedDescription]);
            
            // Handle Error and return
            return nil;
            
        }
        
        NSArray *keys = [jsonObjects allKeys];
        
        // values in foreach loop
        for (NSString *key in keys) {
            NSLog(@"%@ is %@",key, [jsonObjects objectForKey:key]);
        }
        
    } else {
        return nil;
    }
}

@end
