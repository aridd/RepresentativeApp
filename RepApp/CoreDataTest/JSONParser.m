//
//  JSONParser.m
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/4/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

- (NSArray*) parseJson:(NSDictionary*)jsonObject withZip:(NSString*) zip {
    //Parse JSON and create array of Respresentatives
    NSArray *array = [jsonObject objectForKey:@"results"];
    NSMutableArray *representativeArray = [[NSMutableArray alloc] init];
    for (NSDictionary *object in array) {
        RepresentativeModel *representative = [[RepresentativeModel alloc] init];
        representative.name = [object valueForKey:@"name"];
        representative.party = [object valueForKey:@"party"];
        representative.phone = [object valueForKey:@"phone"];
        representative.state = [object valueForKey:@"state"];
        representative.district = [object valueForKey:@"district"];
        representative.office = [object valueForKey:@"office"];
        representative.link = [object valueForKey:@"link"];
        representative.zip = [object valueForKey:@"zip"];
        NSLog(@"name %@", representative.name);
        NSLog(@"party %@", representative.party);
        [representativeArray addObject:representative];
    }
    
    return (NSArray*)[representativeArray copy];
}

@end
