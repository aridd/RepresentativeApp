//
//  JSONParser.h
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/4/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepresentativeModel.h"

@interface JSONParser : NSObject

- (NSArray*) parseJson:(NSDictionary*)jsonObject withZip:(NSString*)zip;

@end
