//
//  CustomCell.h
//  JSONRequestExample
//
//  Created by Cesar Perez Laguna on 25/03/14.
//  Copyright (c) 2014 Cesar Perez Laguna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;

@property (strong, nonatomic) NSURLSessionTask *task;

@end
