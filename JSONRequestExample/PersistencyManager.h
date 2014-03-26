//
//  PersistencyManager.h
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 25/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyDataComunicatorDelegate.h"
#import "PersistencyManagerDelegate.h"

@class MyDataComunicator;

@interface PersistencyManager : NSObject<MyDataComunicatorDelegate>

@property (strong, nonatomic) MyDataComunicator *comunicator;
@property (weak, nonatomic) id<PersistencyManagerDelegate> delegate;

- (void) fetchJobsByDescription:(NSString *)description atLocation:(NSString *)location;

@end
