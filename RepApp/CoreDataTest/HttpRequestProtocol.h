//
//  HttpSuccessProtocol.h
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/4/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import <Foundation/Foundation.h>

//Custom Http Protocol for success and failure

@protocol HttpRequestProtocol

- (void) httpSuccess:(NSDictionary*)jsonObject;
- (void) httpFailure;

@end
