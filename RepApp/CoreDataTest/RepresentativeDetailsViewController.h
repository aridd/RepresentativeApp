//
//  RepresentativeDetailsViewController.h
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/5/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Representatives.h"
#import <MapKit/MapKit.h>
#import "RepresentativeAddress.h"

@interface RepresentativeDetailsViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic, strong) Representatives *representative;
@property (nonatomic, strong) IBOutlet MKMapView *mView;
@property (nonatomic, strong) NSString *repType;

@end
