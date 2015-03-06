//
//  RepresentativeAddress.h
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/5/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>

@interface RepresentativeAddress : NSObject<MKAnnotation>

@property (nonatomic, strong) NSString *nme;
@property (nonatomic, strong) NSString *addr;
@property (assign) CLLocationCoordinate2D theCoordinate;

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;

@end
