//
//  Pet.h
//  CoreUtility
//
//  Created by Apple on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Pet : NSManagedObject

@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) Person* owner;

@end
