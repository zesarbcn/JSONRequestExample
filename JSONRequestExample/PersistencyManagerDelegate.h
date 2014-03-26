//
//  PersistencyManagerDelegate.h
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 25/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersistencyManagerDelegate

- (void)didReceiveJobs:(NSArray *)jobs;
- (void)fetchingJobsFailedWithError:(NSError *)error;

@end
