//
//  HttpRequest.m
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/4/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

#define kBaseURL @"http://whoismyrepresentative.com/getall_mems.php"


@synthesize delegate;

- (void) httpGetRequestWithZip:(NSString*)zip {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = nil;
    NSDictionary *parameters = @{@"output": @"json", @"zip": zip};
    [manager GET:kBaseURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *jsonObject = (NSDictionary*)responseObject;
        NSLog(@"JSONObject %@", jsonObject);
        [delegate httpSuccess:jsonObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", [error description]);
        [delegate httpFailure];
        
    }];
}

@end
