//
//  RepresentativeDetailsViewController.m
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/5/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import "RepresentativeDetailsViewController.h"

#define kSenateAddress = @"2 Constitution Ave NE, Washington, DC 20002";
#define kHouseAddress = @"27 Independence Avenue Southeast, Washington, DC 20003";
#define kHouse = @"House";
#define kSenate = @"Senate";
#define kMapviewIdentifier = @"RepresentativeAddress";

@interface RepresentativeDetailsViewController ()

@end

@implementation RepresentativeDetailsViewController

@synthesize mView;
@synthesize representative;
@synthesize repType;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([repType isEqualToString:@"House"]) {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:@"2 Constitution Ave NE, Washington, DC 20002" completionHandler:^(NSArray* placemarks, NSError* error){
            for (CLPlacemark* aPlacemark in placemarks)
            {
                CLLocationCoordinate2D coordinate;
                coordinate.latitude = aPlacemark.location.coordinate.latitude;
                coordinate.longitude = aPlacemark.location.coordinate.longitude;
                [self centerMap:coordinate];
                [self showPlacemark:coordinate];
            }
        }];
    }
    else if ([repType isEqualToString:@"House"])
    {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:@"27 Independence Avenue Southeast, Washington, DC 20003" completionHandler:^(NSArray* placemarks, NSError* error){
            for (CLPlacemark* aPlacemark in placemarks)
            {
                // Process the placemark.
                CLLocationCoordinate2D coordinate;
                coordinate.latitude = aPlacemark.location.coordinate.latitude;
                coordinate.longitude = aPlacemark.location.coordinate.longitude;
                [self centerMap:coordinate];
                [self showPlacemark:coordinate];
            }
        }];
    }
}

- (void) centerMap:(CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D zoomLocation = coordinate;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*1609.344, 0.5*1609.344);
    
    [mView setRegion:viewRegion animated:YES];
}

- (void) showPlacemark:(CLLocationCoordinate2D)coordinate {
    RepresentativeAddress *annotation = [[RepresentativeAddress alloc] initWithName:@"House" address:@"27 Independence Avenue Southeast, Washington, DC 20003" coordinate:coordinate];
    [mView addAnnotation:annotation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"RepresentativeAddress";
    if ([annotation isKindOfClass:[RepresentativeAddress class]]) {
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;//here we use a nice image instead of the default pins
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
