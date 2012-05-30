//
//  EZTestSuite.m
//  CoreUtility
//
//  Created by Apple on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "EZTestSuite.h"
#import "EZAppDelegate.h"
#import "EZDataAccessor.h"
#import "Person.h"
#import "Pet.h"

@interface EZTestSuite(private)

+ (void) testSimpleCase;
+ (void) testAddRelationShip;

@end

@implementation EZTestSuite


+ (void) executeTestCases{
    [EZTestSuite testSimpleCase];
    [EZTestSuite testAddRelationShip];
    
}

+ (void) testSimpleCase
{
    EZDataAccessor* accessor = [EZDataAccessor getInstance]; 
    NSLog(@"Instantiate the accessor right");
    Person* xietian = [accessor createPerson];
    NSLog(@"Create the object successful");
    xietian.name = @"Tian ge";
    xietian.hobby = @"hobby";
    [accessor savePerson:xietian];
    NSLog(@"Save success");
    NSArray* persons = [accessor fetchAllPerson];
    NSLog(@"FetchAll returned");
    assert([persons count] > 0);
}

//I will test cascade storage.
+ (void) testAddRelationShip
{
    EZDataAccessor* accessor = [EZDataAccessor getInstance];
    Person* tony = [accessor createPerson];
    tony.name = @"Tony";
    [accessor save:tony];
    Pet* lucy = [accessor createPet];
    lucy.name = @"Lucy";
    //lucy.owner = tony;
    //[accessor save:lucy];
   
    Pet* lucyKidOne = [accessor createPet];
    lucyKidOne.name = @"KidOne";
    //lucyKidOne.owner = tony;
    //[tony addPetsObject:lucyKidOne];
    //[accessor save:lucyKidOne];
    NSSet* set = [NSSet setWithObjects:lucy,lucyKidOne, nil];
    [tony addPets:set];
    [accessor save:tony];
    
    
    NSArray* persons = [accessor fetchAllPerson];
    BOOL haveTony = false;
    for(Person* psn in persons){
        NSLog(@"name:%@, pets count:%i",psn.name,[psn.pets count]);
        if([psn.name compare:@"Tony"] == NSOrderedSame){
            haveTony = TRUE;
            assert([psn.pets count] == 2);
        }
    }
    assert(haveTony);
    NSArray* pets = [accessor fetchAll:[Pet class]];
    assert([pets count] == 2);
    for(Pet* pt in pets){
        assert([pt.owner.name compare:@"Tony"] == NSOrderedSame);
    }
    
    
}

@end
