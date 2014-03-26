//
//  PersistencyManager.m
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 25/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import "PersistencyManager.h"
#import "MyDataComunicator.h"
#import "JobBuilder.h"

@implementation PersistencyManager

- (void)fetchJobsByDescription:(NSString *)description atLocation:(NSString *)location
{
    [self.comunicator searchDataByDescription:description atLocation:location];
}

#pragma mark - MyDataComunicatorDelegate

- (void)receivedJSONData:(NSData *)objectNotation
{
    NSError *error = nil;
    
    NSArray *jobs = [JobBuilder jobsFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingJobsFailedWithError:error];
        
    } else {
        [self.delegate didReceiveJobs:jobs];
    }
}

- (void)fetchingDataFailedWithError:(NSError *)error
{
    [self.delegate fetchingJobsFailedWithError:error];
}

@end
