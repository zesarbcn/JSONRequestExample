//
//  JobBuilder.m
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 25/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import "JobBuilder.h"
#import "Job.h"

@implementation JobBuilder

+ (NSArray *)jobsFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSArray *results = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *jobs = [[NSMutableArray alloc] init];
    
    NSLog(@"Count %d", results.count);
    
    for (NSDictionary *jobDic in results) {
        Job *job = [[Job alloc] init];
        
        for (NSString *key in jobDic) {
            if ([job respondsToSelector:NSSelectorFromString(key)]) {
                [job setValue:[jobDic valueForKey:key] forKey:key];
            }
        }
        
        [jobs addObject:job];
    }
    
    return jobs;
}

@end
