//
//  Person.h
//  CoreUtility
//
//  Created by Apple on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Person : NSManagedObject

@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) NSString* hobby;
@property(strong, nonatomic) NSSet* pets;

@end

@interface Person (CoreDataGeneratedAccessors)
- (void)addPetsObject:(NSManagedObject *)value;
- (void)removePetsObject:(NSManagedObject *)value;
- (void)addPets:(NSSet *)value;
- (void)removePets:(NSSet *)value;
@end