//
//  EZMainViewController.h
//  CoreUtility
//
//  Created by Apple on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "EZFlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface EZMainViewController : UIViewController <EZFlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)showInfo:(id)sender;

@end
