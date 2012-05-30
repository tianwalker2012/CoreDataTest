//
//  EZDataAccessor.h
//  CoreUtility
//
//  Created by Apple on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person, Pet;

@interface EZDataAccessor : NSObject {
    NSManagedObjectContext* managedObjectContext;
}

@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

+ (EZDataAccessor*) getInstance;
+ (void) cleanData;

- (NSArray*) fetchAllPerson;
- (void) savePerson:(Person*)person;
- (void) updatePerson:(Person*)person;
- (Person*) createPerson;
- (Pet*) createPet;
- (BOOL) save:(NSManagedObject*)obj;
- (NSArray*) fetchAll:(Class)classType;

@end
