//
//  ViewController.h
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/2/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "Representatives.h"
#import "HttpRequestProtocol.h"
#import "JSONParser.h"
#import "RepresentativesDB.h"
#import "HttpRequest.h"
#import <Reachability/Reachability.h>
#import "RepresentativeDetailsViewController.h"

@interface RepresentativesListTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, HttpRequestProtocol, UISearchBarDelegate>

@property(nonatomic, strong) NSString *zip;
@property(nonatomic, strong) NSDictionary *representativesDictionary;
@property(nonatomic, strong) IBOutlet UISearchBar* sBar;
@property(assign) BOOL isFirstTime;


@end

