//
//  HomeViewController.m
//  iOS-Template-App
//
//  Created by Michael Hearne on 25/04/2014.
//  Copyright (c) 2014 FeedHenry. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize button;
@synthesize result;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [button setEnabled:NO];
    
    [FH initWithSuccess:^(FHResponse *response) {
        [button setEnabled:YES];
    }
             AndFailure:^(FHResponse *response) {
                 NSLog(@"initialize fail");
             }];
}


- (IBAction)cloudCall:(id)sender
{
  NSDictionary* args = [NSDictionary dictionaryWithObjectsAndKeys:
                       @"world", @"hello",
                       nil];
  [FH performCloudRequest:@"hello" WithMethod:@"POST" AndHeaders:nil AndArgs:args AndSuccess:^(FHResponse *response) {
      [result setText:[response.parsedResponse objectForKey:@"msg"]];
    } AndFailure:^(FHResponse *response) {
       NSLog(@"cloudCall fail: %@", response.rawResponseAsString);
     }
  ];
}

@end
