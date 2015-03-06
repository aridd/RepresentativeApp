//
//  ViewController.m
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/2/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import "RepresentativesListTableViewController.h"

@interface RepresentativesListTableViewController ()

@end

@implementation RepresentativesListTableViewController

@synthesize zip;
@synthesize representativesDictionary;
@synthesize sBar;
@synthesize isFirstTime;

- (void)viewDidLoad {
    [super viewDidLoad];
    sBar.delegate = self;
    isFirstTime = true;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[representativesDictionary allKeys] count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[representativesDictionary allKeys] objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentfier = @"RepresentativeCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentfier forIndexPath:indexPath];
    
    Representatives *reps = [[representativesDictionary allKeys] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = reps.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@-%@     (%@)", reps.state, reps.district, reps.party];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Representatives *reps = [[representativesDictionary allKeys] objectAtIndex:indexPath.row];
    
    RepresentativeDetailsViewController *repDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"repDetail"];
    repDetail.representative = reps;
    [self.navigationController pushViewController:repDetail animated:NO];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    //Call Http Request when Search Bar is clicked
    if (isFirstTime)
    {
        isFirstTime = false;
        Reachability *reachability = [Reachability reachabilityForInternetConnection];
        NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
        
        if (remoteHostStatus == ReachableViaWiFi || remoteHostStatus == ReachableViaWWAN) {
            zip = searchBar.text;
            HttpRequest *httpRequest = [[HttpRequest alloc] init];
            httpRequest.delegate = self;
            [httpRequest httpGetRequestWithZip:zip];
        }
        else
        {
            RepresentativesDB *repDB = [[RepresentativesDB alloc] init];
            [self displayRepresentatives:repDB];
        }
    }
}

// Protocol method for http success called from HttpRequest
- (void) httpSuccess:(NSDictionary*)jsonObject {
    JSONParser *jsonParser = [[JSONParser alloc] init];
    NSArray *repArray = [jsonParser parseJson:jsonObject withZip:zip];
    Representatives *reps = [repArray objectAtIndex:0];
    NSLog(@"Test %@", reps.name);
    
    RepresentativesDB *repDB = [[RepresentativesDB alloc] init];
    
    [repDB saveRepresentative:repArray];
    [self displayRepresentatives:repDB];
}

// Protocol method for http failure called from HttpRequest
- (void) httpFailure {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Server Error" message:@"Server failed to fulfill the request." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Populate listview with Representative data
- (void) displayRepresentatives:(RepresentativesDB*)repDB {
    NSArray *houseArray = [repDB retrieveHouseRepresentatives:zip];
    NSArray *senateArray = [repDB retrieveSenateRepresentatives:zip];
    
    if (houseArray != nil && senateArray != nil) {
        representativesDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:houseArray, @"House", senateArray, @"Senate", nil];
        [self.tableView reloadData];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Network Connection Error" message:@"Unable to connect to the internet.  Please check your connection and try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

@end
