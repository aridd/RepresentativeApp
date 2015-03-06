//
//  RepresentativeAddress.m
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/5/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import "RepresentativeAddress.h"

@implementation RepresentativeAddress

@synthesize nme;
@synthesize theCoordinate;
@synthesize addr;

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        if ([name isKindOfClass:[NSString class]]) {
            self.nme = name;
        } else {
            self.nme = @"Unknown charge";
        }
        self.addr = address;
        self.theCoordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    return nme;
}

- (NSString *)subtitle {
    return addr;
}

- (CLLocationCoordinate2D)coordinate {
    return theCoordinate;
}

- (MKMapItem*)mapItem {
    NSDictionary *addressDict = @{(NSString*)kABPersonAddressStreetKey : addr};
    
    MKPlacemark *placemark = [[MKPlacemark alloc]
                              initWithCoordinate:self.coordinate
                              addressDictionary:addressDict];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.title;
    
    return mapItem;
}

@end
