//
//  EZFlipsideViewController.h
//  CoreUtility
//
//  Created by Apple on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EZFlipsideViewController;

@protocol EZFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(EZFlipsideViewController *)controller;
@end

@interface EZFlipsideViewController : UIViewController

@property (weak, nonatomic) id <EZFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
