//
//  AppDelegate.m
//  iOS-Template-App
//
//  Created by Michael Hearne on 25/04/2014.
//  Copyright (c) 2014 FeedHenry. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [FH initWithSuccess:^(FHResponse *response) {
    NSLog(@"initialized OK");
  } AndFailure:^(FHResponse *response) {
    NSLog(@"initialize fail, %@", response.rawResponseAsString);
  }];
  return YES;
}

@end
