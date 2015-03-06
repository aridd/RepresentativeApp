//
//  RepresentativeModel.h
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/4/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RepresentativeModel : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *party;
@property (nonatomic, retain) NSString *state;
@property (nonatomic, retain) NSString *district;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *office;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, strong) NSString *zip;

@end
