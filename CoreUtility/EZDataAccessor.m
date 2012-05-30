//
//  EZDataAccessor.m
//  CoreUtility
//
//  Created by Apple on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "EZDataAccessor.h"
#import "Person.h"
#import "EZAppDelegate.h"
#import "Pet.h"

@implementation EZDataAccessor
@synthesize managedObjectContext;

//The purpose of this class is to clean all the data, to keep a clean room for test.
+ (void) cleanData
{
    //EZAppDelegate* delegate = [UIApplication sharedApplication].delegate;
    NSURL* url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [url URLByAppendingPathComponent:@"CoreUtility.sqlite"];
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
    
}

+ (EZDataAccessor*) getInstance
{
    static EZDataAccessor* accessor = nil;
    EZAppDelegate* delegate = [UIApplication sharedApplication].delegate;
    if(accessor == nil){
        accessor = [[EZDataAccessor alloc] init];
        accessor.managedObjectContext = delegate.managedObjectContext;
    }
    return accessor; 
}
- (NSArray*) fetchAll:(Class)class
{
    NSLog(@"Class Name:%@",[class description]);
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:[class description] inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
    
    //NSError* errors = nil;
    if([aFetchedResultsController performFetch:nil]){
        NSLog(@"Get the result successfully");
    }else{
        NSLog(@"Failed to get any result");
    }
    return aFetchedResultsController.fetchedObjects;
}

- (NSArray*) fetchAllPerson
{
    return [self fetchAll:[Person class]];
}

- (void) savePerson:(Person*)person
{
    NSError *error = nil;
	if (![person.managedObjectContext save:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		//abort();
	}else{
		NSLog(@"Successfully saved, %@",person);
    }
}

- (BOOL) save:(NSManagedObject*)obj
{
    NSError* error = nil;
    BOOL res = false;
    if(![obj.managedObjectContext save:&error]){
        NSLog(@"Error at save, detail:%@, userinfo:%@", error, [error userInfo]);
    }else{
        NSLog(@"Succeefully saved, %@",obj);
        res = TRUE;
    }
    return res;
}

- (void) updatePerson:(Person*)person
{
    [self savePerson:person];
    
}

- (Person*) createPerson
{
    Person* newPerson = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:managedObjectContext];
    return newPerson;

}

- (Pet*) createPet
{
    Pet* newPet = [NSEntityDescription insertNewObjectForEntityForName:@"Pet" inManagedObjectContext:managedObjectContext];
    return newPet;
}

@end
