//
//  HttpRequest.h
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/4/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "JSONParser.h"
#import "HttpRequestProtocol.h"

@interface HttpRequest : NSObject

@property (nonatomic, weak) id <HttpRequestProtocol> delegate;

- (void) httpGetRequestWithZip:(NSString*)zip;

@end
