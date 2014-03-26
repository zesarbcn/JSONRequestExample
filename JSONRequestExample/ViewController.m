//
//  ViewController.m
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 02/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import "ViewController.h"
#import "PersistencyManagerDelegate.h"
#import "PersistencyManager.h"
#import "MyDataComunicator.h"
#import "Job.h"
#import "CustomCell.h"

@interface ViewController () <PersistencyManagerDelegate> {
    NSArray *_jobs;
    PersistencyManager *_manager;
    NSURLSession *imageSession;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
	
    _manager = [[PersistencyManager alloc] init];
    _manager.comunicator = [[MyDataComunicator alloc] init];
    _manager.comunicator.delegate = _manager;
    _manager.delegate = self;
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    imageSession = [NSURLSession sessionWithConfiguration:config];
    
    [self startFetchingJobsByDescription:@"ios"];
}

- (void)startFetchingJobsByDescription:(NSString *)description
{
    [_manager fetchJobsByDescription:description atLocation:@"new+york"];
}

#pragma mark - PersistencyManagerDelegate
- (void)didReceiveJobs:(NSArray *)jobs
{
    _jobs = jobs;
    [self.tableView reloadData];
}

- (void)fetchingJobsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_jobs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCustomCell" forIndexPath:indexPath];
    
    Job *job = _jobs[indexPath.row];
    
    [cell.titleLabel setText:job.title];
    [cell.companyLabel setText:job.company];
    
    if (![job.company_logo isEqual:[NSNull null]]) {
        NSURL *badgeURL = [NSURL URLWithString:job.company_logo];
        
        if(cell.task) {
            [cell.task cancel];
        }
        
        cell.task = [imageSession dataTaskWithURL:badgeURL completionHandler:
                     ^(NSData *data, NSURLResponse *response, NSError *error) {
                         
                         if (error) {
                             NSLog(@"Image request error: %@", error);
                         } else {
                             [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                 cell.logoImage.image = [UIImage imageWithData:data];
                             }];
                         }
                     }];
        
        [cell.task resume];
    } else {
        cell.logoImage.image = [UIImage imageNamed:@"no-image"];
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
