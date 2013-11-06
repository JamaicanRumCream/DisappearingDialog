//
//  ViewController.h
//  DisappearingDialog
//
//  Created by Chris Paveglio on 11/6/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate> //required to handle sheet

- (IBAction)showDialog:(id)sender;
- (IBAction)showActionSheet:(id)sender;

@end
