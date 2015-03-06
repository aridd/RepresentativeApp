                                                                                                                                                                                                                                                                                                                                                                                                                                        //
//  RepresentativesDB.m
//  CoreDataTest
//
//  Created by Andrew Ridd on 3/4/15.
//  Copyright (c) 2015 Andrew Ridd. All rights reserved.
//

#import "RepresentativesDB.h"

@implementation RepresentativesDB

- (NSManagedObjectContext*)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void) saveRepresentative:(NSArray *)repArray {
    for (RepresentativeModel* repObj in repArray) {
        NSManagedObjectContext *context = [self managedObjectContext];
        Representatives *reps = [NSEntityDescription insertNewObjectForEntityForName:@"Representatives" inManagedObjectContext:context];
        
        NSLog(@"Reps: %@ %@ %@", reps.name, reps.party, reps.state);
        
        reps.name = repObj.name;
        reps.party = repObj.party;
        reps.state = repObj.state;
        reps.district = repObj.district;
        reps.phone = repObj.phone;
        reps.office = repObj.office;
        reps.link = repObj.link;
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
    }
}

// Retrieve Senate Representatives using a Predicate query
- (NSArray*) retrieveSenateRepresentatives:(NSString*)zip {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Representatives"
                                              inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"office Contains[cd] '%@' && zip = %@",@"Senate", zip];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    NSArray *senateRepsArray = [context executeFetchRequest:fetchRequest error:&error];
    
    if(senateRepsArray) {
        
        return senateRepsArray;
    } else {
        NSLog(@"Error: %@", error);
    }
    
    return nil;
}

// Retrieve House of Representatives using a Predicate query
- (NSArray*) retrieveHouseRepresentatives:(NSString*)zip {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Representatives"
                                              inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"office Contains[cd] '%@' && zip = %@",@"House", zip];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    NSArray *houseRepsArray = [context executeFetchRequest:fetchRequest error:&error];
    
    if(houseRepsArray) {
        
        return houseRepsArray;
    } else {
        NSLog(@"Error: %@", error);
    }
    
    return nil;
}




@end
