//
//  RepresentativesDB.h
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/4/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Representatives.h"
#import "RepresentativeModel.h"

// Model to save and retrieve representatives
@interface RepresentativesDB : NSObject

- (void) saveRepresentative:(NSArray*)repArray;
- (NSArray*) retrieveHouseRepresentatives:(NSString*)zip;
- (NSArray*) retrieveSenateRepresentatives:(NSString*)zip;


@end
