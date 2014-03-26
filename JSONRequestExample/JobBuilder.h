//
//  JobBuilder.h
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 25/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JobBuilder : NSObject

+ (NSArray *)jobsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
