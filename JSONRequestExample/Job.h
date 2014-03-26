//
//  Job.h
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 05/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Job : NSObject

@property (nonatomic, strong) NSString *ident, *created_at, *title, *location, *type, *description, *how_to_apply, *company, *company_url, *company_logo, *url;



@end
