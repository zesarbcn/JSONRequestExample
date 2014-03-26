//
//  MyDataComunicator.h
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 25/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyDataComunicatorDelegate;


@interface MyDataComunicator : NSObject

@property (weak, nonatomic) id<MyDataComunicatorDelegate> delegate;

- (void)searchDataByDescription:(NSString *)description atLocation:(NSString *)location;

@end
