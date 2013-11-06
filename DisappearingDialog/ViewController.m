//
//  ViewController.m
//  DisappearingDialog
//
//  Created by Chris Paveglio on 11/6/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{    [super viewDidLoad];   }

- (void)didReceiveMemoryWarning
{    [super didReceiveMemoryWarning];   }

- (IBAction)showDialog:(id)sender
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Self Closing Alert" message:@"This dialog will self destruct in 2 seconds." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av setDelegate:self];
    [av show];
    
    NSLog(@"alert shown");
    
    [NSTimer scheduledTimerWithTimeInterval:1.8 target:self selector:@selector(dismissTimedDialog:) userInfo:av repeats:NO];
    //NSTimer passes itself as parameter to the selector
    //so, store a ref to the alert view into the userInfo
}

- (IBAction)showActionSheet:(id)sender
{
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"Self Closing Sheet" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"OK", nil];
    [as setDelegate:self];
    [as showInView:self.view];
    
    NSLog(@"sheet shown");
    
    [NSTimer scheduledTimerWithTimeInterval:1.8 target:self selector:@selector(dismissTimedSheet:) userInfo:as repeats:NO];
    //NSTimer passes itself as parameter to the selector
    //so, store a ref to the alert view into the userInfo
}

-(void)dismissTimedDialog:(id)sender
{
    NSLog(@"alert dismissed");
    [(UIAlertView *)[sender userInfo] dismissWithClickedButtonIndex:0 animated:YES];
    //get the userInfo object (the alertview) to tell it to close
    //make sure to cast it as  (UIAlertView *) or compiler has no idea what userInfo is
}

-(void)dismissTimedSheet:(id)sender
{
    NSLog(@"alert dismissed");
    [(UIActionSheet *)[sender userInfo] dismissWithClickedButtonIndex:0 animated:YES];
    //get the userInfo object (the alertview) to tell it to close
    //make sure to cast it as  (UIActionSheet *) or compiler has no idea what userInfo is
}



@end
