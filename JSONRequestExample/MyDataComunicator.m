//
//  MyDataComunicator.m
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 25/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import "MyDataComunicator.h"
#import "MyDataComunicatorDelegate.h"

@implementation MyDataComunicator{
    NSURLSession *imageSession;
}

- (void)searchDataByDescription:(NSString *)description atLocation:(NSString *)location
{
    NSString *urlAsString = [NSString stringWithFormat:@"http://jobs.github.com/positions.json?description=%@&location=%@", description, location];
    
    /*
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingDataFailedWithError:error];
        } else {
            [self.delegate receivedJSONData:data];
        }
    }];
    */
    
    NSURL *pathsURL = [NSURL URLWithString:urlAsString];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    imageSession = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *task = [imageSession dataTaskWithURL:pathsURL completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                          
                                          [self.delegate receivedJSONData:data];
                                          
                                      }];
                                  }];
    
    [task resume];
    [imageSession finishTasksAndInvalidate];
}

@end
